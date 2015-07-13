//
//  FaceView.swift
//  Happiness
//
//  Created by Ricardo Gehrke Filho on 13/07/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class FaceView: UIView {
    
    var lineWidth: CGFloat = 3 { didSet { setNeedsDisplay() } }
    var color: UIColor = UIColor.blueColor() { didSet { setNeedsDisplay() } }
    var scale: CGFloat = 0.9 { didSet { setNeedsDisplay() } }

    var faceCenter: CGPoint {
        get { return convertPoint(center, fromView: superview) }
    }
    
    var faceRadius: CGFloat {
        get { return min(bounds.size.width, bounds.size.height) / 2 * scale }
    }
    
    override func drawRect(rect: CGRect) {
        let facePath = UIBezierPath(arcCenter: faceCenter, radius: faceRadius, startAngle: 0, endAngle: CGFloat(2 * M_PI), clockwise: true)

        facePath.lineWidth = lineWidth
        color.set()
        facePath.stroke()
    }

}
