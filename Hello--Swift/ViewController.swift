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
    
    var audioPlayer01 = AVAudioPlayer()
    var audioPlayer02 = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var Sound01 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("gvsb03", ofType: "mp3")!)
        var Sound02 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("gvsb04", ofType: "mp3")!)
        println(Sound01)
        println(Sound02)

        // Removed deprecated use of AVAudioSessionDelegate protocol
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        
        var error:NSError?
        audioPlayer01 = AVAudioPlayer(contentsOfURL: Sound01, error: &error)
        audioPlayer01.prepareToPlay()
        audioPlayer01.play()
        audioPlayer01.volume = 1.0;
        audioPlayer01.numberOfLoops = -1
        
        audioPlayer02 = AVAudioPlayer(contentsOfURL: Sound02, error: &error)
        audioPlayer02.prepareToPlay()
        audioPlayer02.play()
        audioPlayer02.volume = 0;
        audioPlayer02.numberOfLoops = -1

        if audioPlayer01.volume < 0.1 {
            audioPlayer01.volume = audioPlayer01.volume + 0.1
            var dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(0.1 * Double(NSEC_PER_SEC)))

        } else {
            audioPlayer01.volume = 1.0
        }
    }



    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {

        if UIDevice.currentDevice().orientation == .LandscapeLeft {
            println("Landscape Left")
            audioPlayer01.volume = 0;
            audioPlayer02.volume = 1.0;

            audioPlayer02.volume = audioPlayer02.volume - 0.1;
            [self performSelector:@selector(doVolumeFade) withObject:nil afterDelay:0.1];

        } else if UIDevice.currentDevice().orientation == .LandscapeRight {
            println("Landscape Right")
            audioPlayer01.volume = 0;
            audioPlayer02.volume = 1.0;
        } else {
            println("Portrait")
            audioPlayer01.volume = 1.0;
            audioPlayer02.volume = 0;
        }
    }
}

