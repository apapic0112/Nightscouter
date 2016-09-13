//
//  NSAssetKitWatchOS.swift
//  Nightscouter
//
//  Created by Peter Ina on 11/9/15.
//  Copyright (c) 2015 Nothingonline.net. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

open class NSAssetKitWatchOS : NSObject {

    //// Cache

    fileprivate struct Cache {
        static let appLogoTintColor: UIColor = UIColor(red: 0.000, green: 0.451, blue: 0.812, alpha: 1.000)
        static let darkNavColor: UIColor = NSAssetKitWatchOS.appLogoTintColor.colorWithShadow(0.6)
        static let predefinedWarningColor: UIColor = UIColor(red: 1.000, green: 0.902, blue: 0.125, alpha: 1.000)
        static let predefinedPostiveColor: UIColor = UIColor(red: 0.016, green: 0.871, blue: 0.443, alpha: 1.000)
        static let predefinedAlertColor: UIColor = UIColor(red: 1.000, green: 0.067, blue: 0.310, alpha: 1.000)
        static let predefinedNeutralColor: UIColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1.000)
        static let predefinedLogoColor: UIColor = UIColor(red: 0.363, green: 0.363, blue: 0.363, alpha: 1.000)
    }

    //// Colors

    open class var appLogoTintColor: UIColor { return Cache.appLogoTintColor }
    open class var darkNavColor: UIColor { return Cache.darkNavColor }
    open class var predefinedWarningColor: UIColor { return Cache.predefinedWarningColor }
    open class var predefinedPostiveColor: UIColor { return Cache.predefinedPostiveColor }
    open class var predefinedAlertColor: UIColor { return Cache.predefinedAlertColor }
    open class var predefinedNeutralColor: UIColor { return Cache.predefinedNeutralColor }
    open class var predefinedLogoColor: UIColor { return Cache.predefinedLogoColor }

    //// Drawing Methods

    open class func drawWatchFace(_ watchFrame: CGRect = CGRect(x: 0, y: 0, width: 134, height: 134), arrowTintColor: UIColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1.000), rawColor: UIColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1.000), isDoubleUp: Bool = false, isArrowVisible: Bool = false, isRawEnabled: Bool = true, textSizeForSgv: CGFloat = 39, textSizeForDelta: CGFloat = 10, textSizeForRaw: CGFloat = 12, deltaString: String = "-- --/--", sgvString: String = "---", rawString: String = "--- : -----", angle: CGFloat = 0) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!

        //// Color Declarations
        let arrowTintShadowColor = arrowTintColor.colorWithShadow(0.2)

        //// Variable Declarations
        let arrowNotVisible = !isArrowVisible
        let isUncomputable = arrowNotVisible


        //// Subframes
        let group: CGRect = CGRect(x: watchFrame.minX + floor((watchFrame.width - 98) * 0.50000 + 0.5), y: watchFrame.minY + floor((watchFrame.height - 98) * 0.63889 + 0.5), width: 98, height: 98)
        let frame4 = CGRect(x: group.minX, y: group.minY, width: 98, height: 98)
        let centerRing: CGRect = CGRect(x: watchFrame.minX + floor((watchFrame.width - 117) * 0.52941 + 0.5), y: watchFrame.minY + floor((watchFrame.height - 117) * 0.47059 + 0.5), width: 117, height: 117)
        let frame3 = CGRect(x: centerRing.minX, y: centerRing.minY, width: 117, height: 117)
        let innerRing: CGRect = CGRect(x: watchFrame.minX + floor((watchFrame.width - 119) * 0.46667 + 0.5), y: watchFrame.minY + floor((watchFrame.height - 119) * 0.46667 + 0.5), width: 119, height: 119)
        let frame = CGRect(x: innerRing.minX, y: innerRing.minY, width: 119, height: 119)
        let frame2 = CGRect(x: watchFrame.minX, y: watchFrame.minY, width: 134, height: 134)
        let group2: CGRect = CGRect(x: frame2.minX + floor((frame2.width - 121.01) * 0.49961 + 0.01) + 0.49, y: frame2.minY + floor((frame2.height - 97.25) * 0.00004 - 0.25) + 0.75, width: 121.01, height: 97.25)


        //// Group
        //// sgvLabel Drawing
        let sgvLabelRect = CGRect(x: frame4.minX + floor(frame4.width * 0.04082 + 0.5), y: frame4.minY + floor(frame4.height * 0.03061 + 0.5), width: floor(frame4.width * 0.95918 + 0.5) - floor(frame4.width * 0.04082 + 0.5), height: floor(frame4.height * 0.58163 + 0.5) - floor(frame4.height * 0.03061 + 0.5))
        let sgvLabelStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        sgvLabelStyle.alignment = .center

        let sgvLabelFontAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: textSizeForSgv)!, NSForegroundColorAttributeName: arrowTintShadowColor, NSParagraphStyleAttributeName: sgvLabelStyle]

        NSString(string: sgvString).draw(in: sgvLabelRect, withAttributes: sgvLabelFontAttributes)


        //// deltaLabel Drawing
        let deltaLabelRect = CGRect(x: frame4.minX + floor(frame4.width * 0.04082 + 0.5), y: frame4.minY + floor(frame4.height * 0.48980 + 0.5), width: floor(frame4.width * 0.95918 + 0.5) - floor(frame4.width * 0.04082 + 0.5), height: floor(frame4.height * 0.66327 + 0.5) - floor(frame4.height * 0.48980 + 0.5))
        let deltaLabelStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        deltaLabelStyle.alignment = .center

        let deltaLabelFontAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: textSizeForDelta), NSForegroundColorAttributeName: arrowTintShadowColor, NSParagraphStyleAttributeName: deltaLabelStyle]

        let deltaLabelTextHeight: CGFloat = NSString(string: deltaString).boundingRect(with: CGSize(width: deltaLabelRect.width, height: CGFloat.infinity), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: deltaLabelFontAttributes, context: nil).size.height
        context.saveGState()
        context.clip(to: deltaLabelRect);
        NSString(string: deltaString).draw(in: CGRect(x: deltaLabelRect.minX, y: deltaLabelRect.minY + (deltaLabelRect.height - deltaLabelTextHeight) / 2, width: deltaLabelRect.width, height: deltaLabelTextHeight), withAttributes: deltaLabelFontAttributes)
        context.restoreGState()


        if (isRawEnabled) {
            //// rawLabel Drawing
            let rawLabelRect = CGRect(x: frame4.minX + floor(frame4.width * 0.04082 + 0.5), y: frame4.minY + floor(frame4.height * 0.65306 + 0.5), width: floor(frame4.width * 0.95918 + 0.5) - floor(frame4.width * 0.04082 + 0.5), height: floor(frame4.height * 0.86735 + 0.5) - floor(frame4.height * 0.65306 + 0.5))
            let rawLabelStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
            rawLabelStyle.alignment = .center

            let rawLabelFontAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: textSizeForRaw), NSForegroundColorAttributeName: rawColor, NSParagraphStyleAttributeName: rawLabelStyle]

            let rawLabelTextHeight: CGFloat = NSString(string: rawString).boundingRect(with: CGSize(width: rawLabelRect.width, height: CGFloat.infinity), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: rawLabelFontAttributes, context: nil).size.height
            context.saveGState()
            context.clip(to: rawLabelRect);
            NSString(string: rawString).draw(in: CGRect(x: rawLabelRect.minX, y: rawLabelRect.minY + (rawLabelRect.height - rawLabelTextHeight) / 2, width: rawLabelRect.width, height: rawLabelTextHeight), withAttributes: rawLabelFontAttributes)
            context.restoreGState()
        }




        //// centerRing
        if (isUncomputable) {
            //// Oval 3 Drawing
            context.saveGState()
            context.translateBy(x: frame3.minX + 0.49573 * frame3.width, y: frame3.minY + 0.50427 * frame3.height)

            let oval3Path = UIBezierPath(ovalIn: CGRect(x: -52.5, y: -52.5, width: 105, height: 105))
            arrowTintShadowColor.setStroke()
            oval3Path.lineWidth = 3
            oval3Path.stroke()

            context.restoreGState()
        }




        if (isDoubleUp) {
            //// outterRing
            //// Group 2
            context.saveGState()
            context.beginTransparencyLayer(auxiliaryInfo: nil)

            //// Clip Bezier 2
            let bezier2Path = UIBezierPath()
            bezier2Path.move(to: CGPoint(x: 0.5, y: -67))
            bezier2Path.addCurve(to: CGPoint(x: 7.06, y: -60.09), controlPoint1: CGPoint(x: 0.5, y: -67), controlPoint2: CGPoint(x: 4.27, y: -63.03))
            bezier2Path.addCurve(to: CGPoint(x: 52.39, y: -30.25), controlPoint1: CGPoint(x: 25.37, y: -57.92), controlPoint2: CGPoint(x: 42.47, y: -47.44))
            bezier2Path.addCurve(to: CGPoint(x: 52.39, y: 30.25), controlPoint1: CGPoint(x: 63.2, y: -11.53), controlPoint2: CGPoint(x: 63.2, y: 11.53))
            bezier2Path.addLine(to: CGPoint(x: 48.93, y: 28.25))
            bezier2Path.addCurve(to: CGPoint(x: 48.93, y: -28.25), controlPoint1: CGPoint(x: 59.02, y: 10.77), controlPoint2: CGPoint(x: 59.02, y: -10.77))
            bezier2Path.addCurve(to: CGPoint(x: 6.03, y: -56.18), controlPoint1: CGPoint(x: 39.56, y: -44.49), controlPoint2: CGPoint(x: 23.34, y: -54.31))
            bezier2Path.addCurve(to: CGPoint(x: 0.5, y: -62), controlPoint1: CGPoint(x: 3.42, y: -58.92), controlPoint2: CGPoint(x: 0.5, y: -62))
            bezier2Path.addCurve(to: CGPoint(x: -4.92, y: -56.3), controlPoint1: CGPoint(x: 0.5, y: -62), controlPoint2: CGPoint(x: -2.34, y: -59.01))
            bezier2Path.addCurve(to: CGPoint(x: -28.25, y: -48.93), controlPoint1: CGPoint(x: -12.9, y: -55.61), controlPoint2: CGPoint(x: -20.85, y: -53.2))
            bezier2Path.addCurve(to: CGPoint(x: -55.84, y: -8.63), controlPoint1: CGPoint(x: -43.67, y: -40.03), controlPoint2: CGPoint(x: -53.3, y: -24.96))
            bezier2Path.addCurve(to: CGPoint(x: -53.75, y: 17.44), controlPoint1: CGPoint(x: -57.17, y: -0.05), controlPoint2: CGPoint(x: -56.54, y: 8.88))
            bezier2Path.addCurve(to: CGPoint(x: -48.93, y: 28.25), controlPoint1: CGPoint(x: -52.55, y: 21.13), controlPoint2: CGPoint(x: -50.95, y: 24.75))
            bezier2Path.addLine(to: CGPoint(x: -52.39, y: 30.25))
            bezier2Path.addCurve(to: CGPoint(x: -56.81, y: -20.8), controlPoint1: CGPoint(x: -61.72, y: 14.1), controlPoint2: CGPoint(x: -62.75, y: -4.56))
            bezier2Path.addCurve(to: CGPoint(x: -30.25, y: -52.39), controlPoint1: CGPoint(x: -52.11, y: -33.66), controlPoint2: CGPoint(x: -43.04, y: -45.01))
            bezier2Path.addCurve(to: CGPoint(x: -5.94, y: -60.22), controlPoint1: CGPoint(x: -22.54, y: -56.85), controlPoint2: CGPoint(x: -14.26, y: -59.41))
            bezier2Path.addCurve(to: CGPoint(x: 0.5, y: -67), controlPoint1: CGPoint(x: -3.21, y: -63.1), controlPoint2: CGPoint(x: 0.39, y: -66.88))
            bezier2Path.addLine(to: CGPoint(x: 0.5, y: -67))
            bezier2Path.close()
                        var bezier2Transformation = CGAffineTransform.identity
            bezier2Transformation = bezier2Transformation.translatedBy(x: group2.minX + 60.51, y: group2.minY + 67)

            bezier2Path.apply(bezier2Transformation)
            bezier2Path.addClip()


            //// Rectangle Drawing
            context.saveGState()
            context.translateBy(x: group2.minX + 60.51, y: group2.minY + 67)
            context.rotate(by: -angle * CGFloat(M_PI) / 180)

            let rectanglePath = UIBezierPath()
            rectanglePath.move(to: CGPoint(x: 10, y: -57))
            rectanglePath.addLine(to: CGPoint(x: 0.5, y: -67))
            rectanglePath.addLine(to: CGPoint(x: -9, y: -57))
            rectanglePath.addLine(to: CGPoint(x: 10, y: -57))
            rectanglePath.close()
            arrowTintShadowColor.setFill()
            rectanglePath.fill()

            context.restoreGState()


            //// Oval 2 Drawing
            context.saveGState()
            context.translateBy(x: group2.minX + 60.51, y: group2.minY + 67)
            context.rotate(by: -angle * CGFloat(M_PI) / 180)

            let oval2Rect = CGRect(x: -58.5, y: -58.5, width: 117, height: 117)
            let oval2Path = UIBezierPath()
            oval2Path.addArc(withCenter: CGPoint(x: oval2Rect.midX, y: oval2Rect.midY), radius: oval2Rect.width / 2, startAngle: -210 * CGFloat(M_PI)/180, endAngle: 30 * CGFloat(M_PI)/180, clockwise: true)

            arrowTintShadowColor.setStroke()
            oval2Path.lineWidth = 4
            oval2Path.stroke()

            context.restoreGState()


            context.endTransparencyLayer()
            context.restoreGState()


        }


        //// innerRing
        //// Oval Drawing
        context.saveGState()
        context.translateBy(x: frame.minX + 0.50420 * frame.width, y: frame.minY + 0.50420 * frame.height)
        context.rotate(by: -angle * CGFloat(M_PI) / 180)

        let ovalRect = CGRect(x: -52.5, y: -52.5, width: 105, height: 105)
        let ovalPath = UIBezierPath()
        ovalPath.addArc(withCenter: CGPoint(x: ovalRect.midX, y: ovalRect.midY), radius: ovalRect.width / 2, startAngle: -220 * CGFloat(M_PI)/180, endAngle: 40 * CGFloat(M_PI)/180, clockwise: true)

        arrowTintShadowColor.setStroke()
        ovalPath.lineWidth = 3
        ovalPath.stroke()

        context.restoreGState()


        if (isArrowVisible) {
            //// Rectangle 2 Drawing
            context.saveGState()
            context.translateBy(x: frame.minX + 0.50420 * frame.width, y: frame.minY + 0.50420 * frame.height)
            context.rotate(by: -angle * CGFloat(M_PI) / 180)

            let rectangle2Path = UIBezierPath()
            rectangle2Path.move(to: CGPoint(x: 8, y: -53))
            rectangle2Path.addLine(to: CGPoint(x: 0.5, y: -59))
            rectangle2Path.addLine(to: CGPoint(x: -7, y: -53))
            rectangle2Path.addLine(to: CGPoint(x: 8, y: -53))
            rectangle2Path.close()
            arrowTintShadowColor.setFill()
            rectangle2Path.fill()

            context.restoreGState()
        }
    }

    open class func drawSourceIcon(_ logoTintColor: UIColor = UIColor(red: 0.300, green: 0.300, blue: 0.300, alpha: 1.000)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!

        //// Color Declarations
        let logoHighlightColor = logoTintColor.colorWithHighlight(1)
        let logoShadowColor = NSAssetKitWatchOS.appLogoTintColor.colorWithShadow(0.218)

        //// Gradient Declarations
        let logoGradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: [NSAssetKitWatchOS.appLogoTintColor.cgColor, logoShadowColor.cgColor] as! CFArray, locations: [0, 1])!

        //// Group
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 100, height: 100))
        context.saveGState()
        rectanglePath.addClip()
        context.drawLinearGradient(logoGradient, start: CGPoint(x: 50, y: -0), end: CGPoint(x: 50, y: 100), options: CGGradientDrawingOptions())
        context.restoreGState()


        //// outerShape 2 Drawing
        let outerShape2Path = UIBezierPath()
        outerShape2Path.move(to: CGPoint(x: 79.86, y: 38.09))
        outerShape2Path.addCurve(to: CGPoint(x: 74.53, y: 58.24), controlPoint1: CGPoint(x: 80.6, y: 42.54), controlPoint2: CGPoint(x: 78.37, y: 50.18))
        outerShape2Path.addCurve(to: CGPoint(x: 54.82, y: 85.32), controlPoint1: CGPoint(x: 69.65, y: 68.49), controlPoint2: CGPoint(x: 62.16, y: 79.41))
        outerShape2Path.addCurve(to: CGPoint(x: 50.78, y: 88.33), controlPoint1: CGPoint(x: 51.54, y: 87.96), controlPoint2: CGPoint(x: 51.75, y: 87.84))
        outerShape2Path.addCurve(to: CGPoint(x: 49.26, y: 88.33), controlPoint1: CGPoint(x: 50.52, y: 88.33), controlPoint2: CGPoint(x: 49.52, y: 88.33))
        outerShape2Path.addCurve(to: CGPoint(x: 45.21, y: 85.32), controlPoint1: CGPoint(x: 49.26, y: 88.33), controlPoint2: CGPoint(x: 46.83, y: 86.81))
        outerShape2Path.addCurve(to: CGPoint(x: 24.37, y: 58.1), controlPoint1: CGPoint(x: 38.74, y: 79.38), controlPoint2: CGPoint(x: 28.69, y: 68.39))
        outerShape2Path.addCurve(to: CGPoint(x: 20.18, y: 38.09), controlPoint1: CGPoint(x: 21, y: 50.09), controlPoint2: CGPoint(x: 19.44, y: 42.51))
        outerShape2Path.addCurve(to: CGPoint(x: 49.13, y: 10), controlPoint1: CGPoint(x: 20.18, y: 22.58), controlPoint2: CGPoint(x: 33.14, y: 10))
        outerShape2Path.addCurve(to: CGPoint(x: 50.9, y: 10), controlPoint1: CGPoint(x: 49.44, y: 10), controlPoint2: CGPoint(x: 50.6, y: 10))
        outerShape2Path.addCurve(to: CGPoint(x: 79.86, y: 38.09), controlPoint1: CGPoint(x: 66.9, y: 10), controlPoint2: CGPoint(x: 79.86, y: 22.58))
        outerShape2Path.close()
        outerShape2Path.lineCapStyle = .round;

        outerShape2Path.lineJoinStyle = .round;

        logoHighlightColor.setStroke()
        outerShape2Path.lineWidth = 1.5
        outerShape2Path.stroke()


        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 28, y: 19, width: 44, height: 39))
        logoHighlightColor.setStroke()
        ovalPath.lineWidth = 1.5
        ovalPath.stroke()


        //// crest
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 65, y: 60))
        bezierPath.addCurve(to: CGPoint(x: 53.02, y: 76.03), controlPoint1: CGPoint(x: 65, y: 60), controlPoint2: CGPoint(x: 61.48, y: 69.12))
        bezierPath.addCurve(to: CGPoint(x: 50.71, y: 77.84), controlPoint1: CGPoint(x: 51.31, y: 77.42), controlPoint2: CGPoint(x: 51.07, y: 77.64))
        bezierPath.addCurve(to: CGPoint(x: 50.57, y: 78), controlPoint1: CGPoint(x: 50.62, y: 77.95), controlPoint2: CGPoint(x: 50.57, y: 78))
        bezierPath.addLine(to: CGPoint(x: 49.43, y: 78))
        bezierPath.addCurve(to: CGPoint(x: 49.29, y: 77.84), controlPoint1: CGPoint(x: 49.43, y: 78), controlPoint2: CGPoint(x: 49.38, y: 77.95))
        bezierPath.addCurve(to: CGPoint(x: 46.98, y: 76.03), controlPoint1: CGPoint(x: 48.93, y: 77.64), controlPoint2: CGPoint(x: 48.69, y: 77.42))
        bezierPath.addCurve(to: CGPoint(x: 43.65, y: 72.97), controlPoint1: CGPoint(x: 45.77, y: 75.04), controlPoint2: CGPoint(x: 44.67, y: 74.01))
        bezierPath.addCurve(to: CGPoint(x: 48.98, y: 65.02), controlPoint1: CGPoint(x: 44.98, y: 70.98), controlPoint2: CGPoint(x: 47.66, y: 66.99))
        bezierPath.addCurve(to: CGPoint(x: 50, y: 65.05), controlPoint1: CGPoint(x: 49.32, y: 65.04), controlPoint2: CGPoint(x: 49.66, y: 65.05))
        bezierPath.addCurve(to: CGPoint(x: 65, y: 60), controlPoint1: CGPoint(x: 57.01, y: 65.05), controlPoint2: CGPoint(x: 65, y: 60))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 35, y: 60))
        bezierPath.addCurve(to: CGPoint(x: 44.56, y: 64.22), controlPoint1: CGPoint(x: 35, y: 60), controlPoint2: CGPoint(x: 39.41, y: 62.79))
        bezierPath.addCurve(to: CGPoint(x: 40.58, y: 69.42), controlPoint1: CGPoint(x: 43.86, y: 65.14), controlPoint2: CGPoint(x: 41.98, y: 67.6))
        bezierPath.addCurve(to: CGPoint(x: 35, y: 60), controlPoint1: CGPoint(x: 36.7, y: 64.41), controlPoint2: CGPoint(x: 35, y: 60))
        bezierPath.addLine(to: CGPoint(x: 35, y: 60))
        bezierPath.close()
        bezierPath.lineCapStyle = .round;

        bezierPath.lineJoinStyle = .round;

        logoHighlightColor.setFill()
        bezierPath.fill()




        //// Oval 5 Drawing
        let oval5Path = UIBezierPath(ovalIn: CGRect(x: 37, y: 34, width: 6, height: 6))
        logoHighlightColor.setFill()
        oval5Path.fill()


        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: 50, y: 28.33))
        bezier3Path.addLine(to: CGPoint(x: 50, y: 46.67))
        bezier3Path.lineCapStyle = .round;

        logoHighlightColor.setStroke()
        bezier3Path.lineWidth = 1.5
        bezier3Path.stroke()


        //// Oval 2 Drawing
        let oval2Path = UIBezierPath(ovalIn: CGRect(x: 57, y: 34, width: 6, height: 6))
        logoHighlightColor.setFill()
        oval2Path.fill()
    }

    //// Generated Images

    open class func imageOfWatchFace(_ watchFrame: CGRect = CGRect(x: 0, y: 0, width: 134, height: 134), arrowTintColor: UIColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1.000), rawColor: UIColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1.000), isDoubleUp: Bool = false, isArrowVisible: Bool = false, isRawEnabled: Bool = true, textSizeForSgv: CGFloat = 39, textSizeForDelta: CGFloat = 10, textSizeForRaw: CGFloat = 12, deltaString: String = "-- --/--", sgvString: String = "---", rawString: String = "--- : -----", angle: CGFloat = 0) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(watchFrame.size, false, 0)
            NSAssetKitWatchOS.drawWatchFace(CGRect(x: 0, y: 0, width: watchFrame.size.width, height: watchFrame.size.height), arrowTintColor: arrowTintColor, rawColor: rawColor, isDoubleUp: isDoubleUp, isArrowVisible: isArrowVisible, isRawEnabled: isRawEnabled, textSizeForSgv: textSizeForSgv, textSizeForDelta: textSizeForDelta, textSizeForRaw: textSizeForRaw, deltaString: deltaString, sgvString: sgvString, rawString: rawString, angle: angle)

        let imageOfWatchFace = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return imageOfWatchFace
    }

}



extension UIColor {
    func colorWithHue(_ newHue: CGFloat) -> UIColor {
        var saturation: CGFloat = 1.0, brightness: CGFloat = 1.0, alpha: CGFloat = 1.0
        self.getHue(nil, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        return UIColor(hue: newHue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    func colorWithSaturation(_ newSaturation: CGFloat) -> UIColor {
        var hue: CGFloat = 1.0, brightness: CGFloat = 1.0, alpha: CGFloat = 1.0
        self.getHue(&hue, saturation: nil, brightness: &brightness, alpha: &alpha)
        return UIColor(hue: hue, saturation: newSaturation, brightness: brightness, alpha: alpha)
    }
    func colorWithBrightness(_ newBrightness: CGFloat) -> UIColor {
        var hue: CGFloat = 1.0, saturation: CGFloat = 1.0, alpha: CGFloat = 1.0
        self.getHue(&hue, saturation: &saturation, brightness: nil, alpha: &alpha)
        return UIColor(hue: hue, saturation: saturation, brightness: newBrightness, alpha: alpha)
    }
    func colorWithAlpha(_ newAlpha: CGFloat) -> UIColor {
        var hue: CGFloat = 1.0, saturation: CGFloat = 1.0, brightness: CGFloat = 1.0
        self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: nil)
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: newAlpha)
    }
    func colorWithHighlight(_ highlight: CGFloat) -> UIColor {
        var red: CGFloat = 1.0, green: CGFloat = 1.0, blue: CGFloat = 1.0, alpha: CGFloat = 1.0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return UIColor(red: red * (1-highlight) + highlight, green: green * (1-highlight) + highlight, blue: blue * (1-highlight) + highlight, alpha: alpha * (1-highlight) + highlight)
    }
    func colorWithShadow(_ shadow: CGFloat) -> UIColor {
        var red: CGFloat = 1.0, green: CGFloat = 1.0, blue: CGFloat = 1.0, alpha: CGFloat = 1.0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return UIColor(red: red * (1-shadow), green: green * (1-shadow), blue: blue * (1-shadow), alpha: alpha * (1-shadow) + shadow)
    }
}
