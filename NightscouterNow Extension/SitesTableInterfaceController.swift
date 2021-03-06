

//
//  SitesTableInterfaceController.swift
//  Nightscouter
//
//  Created by Peter Ina on 10/4/15.
//  Copyright © 2015 Peter Ina. All rights reserved.
//

import WatchKit
import NightscouterWatchOSKit

class SitesTableInterfaceController: WKInterfaceController, DataSourceChangedDelegate, SiteDetailViewDidUpdateItemDelegate {
    
    @IBOutlet var sitesTable: WKInterfaceTable!
    @IBOutlet var sitesLoading: WKInterfaceLabel!
    
    var models: [WatchModel] = []
    
    // Whenever this changes, it updates the attributed title of the refresh control.
    var lastUpdatedTime: NSDate? {
        didSet{
            
            // Create and use a formatter.
            let dateFormatter = NSDateFormatter()
            dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
            dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
            dateFormatter.timeZone = NSTimeZone.localTimeZone()
            
            if let date = lastUpdatedTime {
                timeStamp = dateFormatter.stringFromDate(date)
            }
            
            sitesLoading.setHidden(!self.models.isEmpty)
        }
    }
    
    var timeStamp: String = ""
    
    var currentlyUpdating: Bool = false
    
    override func willActivate() {
        super.willActivate()
        WatchSessionManager.sharedManager.addDataSourceChangedDelegate(self)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        print(">>> Entering \(#function) <<<")
     
        self.models = WatchSessionManager.sharedManager.models
        self.updateTableData()

        let model = models.minElement{ (lModel, rModel) -> Bool in
            return rModel.lastReadingDate.compare(lModel.lastReadingDate) == .OrderedAscending
        }
        
        self.lastUpdatedTime = model?.lastReadingDate ?? NSDate(timeIntervalSince1970: 0)
        
        //WatchSessionManager.sharedManager.updateData(forceRefresh: false)
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        print(">>> Entering \(#function) <<<")
        super.didDeactivate()
        lastUpdatedTime = nil
        
        //WatchSessionManager.sharedManager.removeDataSourceChangedDelegate(self)
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        // create object.
        // push controller...
        print(">>> Entering \(#function) <<<")
        
        WatchSessionManager.sharedManager.currentSiteIndex = rowIndex
        
        pushControllerWithName("SiteDetail", context: [WatchModel.PropertyKey.delegateKey: self])
    }
    
    private func updateTableData() {
        print(">>> Entering \(#function) <<<")
        dispatch_async(dispatch_get_main_queue()) {

        let rowSiteTypeIdentifier: String = "SiteRowController"
        let rowEmptyTypeIdentifier: String = "SiteEmptyRowController"
        let rowUpdateTypeIdentifier: String = "SiteUpdateRowController"
        
            self.sitesTable.setNumberOfRows(0, withRowType: rowEmptyTypeIdentifier)

            
        if self.models.isEmpty {
            self.sitesLoading.setHidden(true)
            
            self.sitesTable.setNumberOfRows(1, withRowType: rowEmptyTypeIdentifier)
            let row = self.sitesTable.rowControllerAtIndex(0) as? SiteEmptyRowController
            if let row = row {
                row.messageLabel.setText("No sites availble.")
            }
            
        } else {
            
            var rowSiteType = self.models.map{ _ in rowSiteTypeIdentifier }
            // datestamp/loading row
            rowSiteType.append(rowUpdateTypeIdentifier)
            
            self.sitesTable.setRowTypes(rowSiteType)
            
            for (index, model) in self.models.enumerate() {
                if let row = self.sitesTable.rowControllerAtIndex(index) as? SiteRowController {
                    row.model = model
                }
            }
            
            let updateRow = self.sitesTable.rowControllerAtIndex(self.models.count) as? SiteUpdateRowController
            if let updateRow = updateRow {
                updateRow.siteLastReadingLabel.setText(self.timeStamp)
                updateRow.siteLastReadingLabelHeader.setText("LAST UPDATE FROM PHONE")
            }
            }
        }
    }
    
    func dataSourceDidUpdateAppContext(models: [WatchModel]) {
        print(">>> Entering \(#function) <<<")
        NSOperationQueue.mainQueue().addOperationWithBlock { 
            
        self.dismissController()
        self.models = models // WatchSessionManager.sharedManager.models
        self.lastUpdatedTime = NSDate()
        self.updateTableData()
            
        }

    }
    
    func dataSourceCouldNotConnectToPhone(error: NSError) {
        self.presentErrorDialog(withTitle: "Phone not Reachable", message: error.localizedDescription)
    }
    
    func didUpdateItem(model: WatchModel){
        NSOperationQueue.mainQueue().addOperationWithBlock {
            
            self.dismissController()
            self.models = WatchSessionManager.sharedManager.models
            self.lastUpdatedTime = NSDate()
            self.updateTableData()
        }
    }
    
    func didSetItemAsDefault(model: WatchModel) {
        WatchSessionManager.sharedManager.defaultSiteUUID = NSUUID(UUIDString: model.uuid)
    }
    
    func presentErrorDialog(withTitle title: String, message: String) {
        // catch any errors here
        let retry = WKAlertAction(title: "Retry", style: .Default, handler: { () -> Void in
            WatchSessionManager.sharedManager.updateData(forceRefresh: true)
        })
        
        let cancel = WKAlertAction(title: "Cancel", style: .Cancel, handler: { () -> Void in
            self.dismissController()
        })
        
        let action = WKAlertAction(title: "Local Update", style: .Default, handler: { () -> Void in
            for model in self.models {
                self.currentlyUpdating = true
                quickFetch(model.generateSite(), handler: { (returnedSite, error) -> Void in
                    NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
                        self.currentlyUpdating = false
                        WatchSessionManager.sharedManager.updateModel(returnedSite.viewModel)
                    }
                })
            }
            
        })
        
        dispatch_async(dispatch_get_main_queue()) {
            self.presentAlertControllerWithTitle(title, message: message, preferredStyle: .Alert, actions: [retry, cancel, action])
        }
    }
    
    @IBAction func updateButton() {
        WatchSessionManager.sharedManager.updateData(forceRefresh: true)
    }
    
    override func handleUserActivity(userInfo: [NSObject : AnyObject]?) {
        print(">>> Entering \(#function) <<<")
        
        guard let dict = userInfo?[WatchModel.PropertyKey.modelKey] as? [String : AnyObject], incomingModel = WatchModel (fromDictionary: dict) else {
            
            return
        }
        
        dispatch_async(dispatch_get_main_queue()) {
            self.popController()
            self.dismissController()
            
            if let index = WatchSessionManager.sharedManager.models.indexOf(incomingModel) {
                WatchSessionManager.sharedManager.currentSiteIndex = index
            }
            
            self.pushControllerWithName("SiteDetail", context: [WatchModel.PropertyKey.delegateKey: self, WatchModel.PropertyKey.modelKey: incomingModel.dictionary])
        }
    }
}

