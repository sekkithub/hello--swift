//
//  ViewController.swift
//  Hello--Swift
//
//  Created by Masato Seki on 13/05/2015.
//  Copyright (c) 2015 Masato Seki. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
//    var audioPlayer01 = AVAudioPlayer()
//    var audioPlayer02 = AVAudioPlayer()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        var alertSound01 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("hello", ofType: "mp3")!)
//        var alertSound02 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("mayonnaise", ofType: "mp3")!)
//        println(alertSound01)
//        println(alertSound02)
//
//        // Removed deprecated use of AVAudioSessionDelegate protocol
//        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
//        AVAudioSession.sharedInstance().setActive(true, error: nil)
//        
//        var error:NSError?
//        audioPlayer01 = AVAudioPlayer(contentsOfURL: alertSound01, error: &error)
//        audioPlayer01.prepareToPlay()
//        audioPlayer01.play()
//        audioPlayer01.numberOfLoops = -1
//
//        audioPlayer02 = AVAudioPlayer(contentsOfURL: alertSound02, error: &error)
//        audioPlayer02.prepareToPlay()
//        audioPlayer02.play()
//        audioPlayer02.numberOfLoops = -1
//
//    }

//    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
//        if UIDevice.currentDevice().orientation.isLandscape.boolValue {
//            println("landscape")
//        } else {
//            println("portraight")
//        }
//    }

    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        if UIDevice.currentDevice().orientation == .LandscapeLeft {
            println("Landscape Left")
        } else if UIDevice.currentDevice().orientation == .LandscapeRight {
            println("Landscape Right")
        } else {
            println("Portrait")
        }
    }
}