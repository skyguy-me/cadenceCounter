//
//  ViewController.swift
//  Cadence counter
//
//  Created by Gokul on 1/9/16.
//  Copyright © 2016 Gokul. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController {
    
    
    var timer = NSTimer()
    var timerCounts:Double = 0.0
    var counts = 0
    var cadence = 160
    var audio = AVAudioPlayer()
    var audi02 = AVAudioPlayer()
    
    
    @IBOutlet weak var countingLabel: UILabel!
    @IBAction func startButton(sender: UIBarButtonItem) {
        timer.invalidate()
        timerCounts = Double(1) / (Double(cadence)/60)
        timer = NSTimer.scheduledTimerWithTimeInterval(timerCounts, target:self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
        
    }
    @IBAction func clearButton(sender: UIBarButtonItem) {
        timer.invalidate()
        counts = 0
    }
    
    @IBAction func stopButton(sender: UIBarButtonItem) {
        timer.invalidate()
    }
    @IBAction func cadenceMinus(sender: UIButton) {
        cadence -= 1
        countingLabel.text = String(stringInterpolationSegment: cadence)
    }
    
    @IBAction func cadancePlus(sender: UIButton) {
        cadence += 1
        cadence+=2;
        
        countingLabel.text = String(stringInterpolationSegment: cadence)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countingLabel.text = String(stringInterpolationSegment: cadence)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateCounter() {
        counts += 1
        if (counts%2 == 0){
            audio = setupAudioPlayerWithFile("clink", type: ".m4a")
            audio.volume = 0.3
            audio.play()
        }
        else {
            //audio = setupAudioPlayerWithFile("ping", type: ".m4a")
            // audio.volume = 0.3
            // audio.play()
        }
    }
    
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer  {
        //1
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType:type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        var audioPlayer:AVAudioPlayer?
        return audioPlayer!
    }
    
}
