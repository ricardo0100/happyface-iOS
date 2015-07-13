//
//  FaceViewController.swift
//  Happiness
//
//  Created by Ricardo Gehrke Filho on 13/07/15.
//  Copyright © 2015 Ricardo Gehrke Filho. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController, FaceViewDataSource
{
    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
        }
    }
    
    var hapiness: Int = 100 {
        didSet {
            hapiness = min(max(hapiness, 0), 100)
            print("hapiness: \(hapiness)")
            updateUI()
        }
    }
    
    func updateUI() {
        faceView.setNeedsDisplay()
    }
    
    func smilenessForFaceView(sender: FaceView) -> Double? {
        return Double(hapiness - 50) / 50
    }
    
}
