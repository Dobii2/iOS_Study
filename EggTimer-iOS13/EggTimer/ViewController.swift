//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//  test push

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var player: AVAudioPlayer?
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var totalTIme = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        progressView.progress = 0
        secondsPassed = 0
        titleLabel.text = hardness
        
        totalTIme = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)

       
    }
    
    @objc func updateTimer() {
        
        if secondsPassed < totalTIme {
            
            secondsPassed += 1
            
            progressView.progress = Float(secondsPassed) / Float(totalTIme)
            
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player!.play()
        }
    }
        
}
