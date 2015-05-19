//
//  ViewController.swift
//  Hello--Swift
//
//  Created by Masato Seki on 13/05/2015.
//  Copyright (c) 2015 Masato Seki. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

let iiFaderForAvAudioPlayer_defaultFadeDurationSeconds = 3.0
let iiFaderForAvAudioPlayer_defaultVelocity = 2.0

class ViewController: UIViewController {
    
    var audioPlayer01 = AVAudioPlayer()
    var audioPlayer02 = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var Sound01 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("country", ofType: "mp3")!)
        var Sound02 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("metal", ofType: "mp3")!)
        println(Sound01)
        println(Sound02)

        // Removed deprecated use of AVAudioSessionDelegate protocol
        AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, error: nil)
        AVAudioSession.sharedInstance().setActive(true, error: nil)
        
        var error:NSError?
        audioPlayer01 = AVAudioPlayer(contentsOfURL: Sound01, error: &error)
        audioPlayer01.prepareToPlay()
        audioPlayer01.play()
        audioPlayer01.volume = 1.0
        audioPlayer01.numberOfLoops = -1
        
        audioPlayer02 = AVAudioPlayer(contentsOfURL: Sound02, error: &error)
        audioPlayer02.prepareToPlay()
        audioPlayer02.play()
        audioPlayer02.volume = 0
        audioPlayer02.numberOfLoops = -1
    }

    func fadePlayer(player: AVAudioPlayer,
        toVolume endVolume : Float,
        overTime time : Float) {
            
            // Update the volume every 1/10 of a second
            var fadeSteps : Int = Int(time) * 10
            // Work out how much time each step will take
            var timePerStep : Float = 1 / 100.0
        
            var startVolume = player.volume
            
            // Schedule a number of volume changes
            for step in 0...fadeSteps {
                
                let delayInSeconds : Float = Float(step) * timePerStep
                
                let popTime = dispatch_time(DISPATCH_TIME_NOW,
                    Int64(delayInSeconds * Float(NSEC_PER_SEC)));
                dispatch_after(popTime, dispatch_get_main_queue()) {
                    
                    let fraction = (Float(step) / Float(fadeSteps))
                    
                    player.volume = startVolume +
                        (endVolume - startVolume) * fraction
                }
            }
    }

    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        let country = audioPlayer01.volume
        let metal = audioPlayer02.volume

        if UIDevice.currentDevice().orientation == .Portrait {
            fadePlayer(audioPlayer01, toVolume: 1.0, overTime: 50.0)
            fadePlayer(audioPlayer02, toVolume: 0.0, overTime: 50.0)
            println("portrait")
        } else {
            fadePlayer(audioPlayer01, toVolume: 0.0, overTime: 50.0)
            fadePlayer(audioPlayer02, toVolume: 1.0, overTime: 50.0)
            println("landscape")

        }
    }
}

