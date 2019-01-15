//
//  ViewController.swift
//  Stopwatch
//
//  Created by Felipe Almeida on 2019-01-14.
//  Copyright © 2019 Felipe Almeida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let stopwatch = Stopwatch()
    
    var timer: Timer?

    @IBOutlet weak var elapsedTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func startButtonTapped(_ sender: UIButton) {
        print("Start button tapped")
        
        stopwatch.start()
        
//        while stopwatch.isRunning {
//            print("Updating...")
//            elapsedTimeLabel.text = "\(stopwatch.elapsedTime)"
//        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateElapsedTimeLabel(timer:)), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        print("Stop button tapped")
        
        stopwatch.stop()
    }
    
    @objc func updateElapsedTimeLabel(timer: Timer) {
        print("Updating elapsed time")
        if stopwatch.isRunning {
            elapsedTimeLabel.text = "\(stopwatch.elapsedTime)"
            let minutes = Int(stopwatch.elapsedTime / 60)
            let seconds = Int(stopwatch.elapsedTime.truncatingRemainder(dividingBy: 60))
            let tenths = Int((stopwatch.elapsedTime * 10).truncatingRemainder(dividingBy: 10))
            
            elapsedTimeLabel.text = String(format: "%02d:%02d.%02d", minutes, seconds, tenths)
        } else {
            timer.invalidate()
        }
    }
    
    deinit {
        if let timer = self.timer {
                timer.invalidate()
        }
    }
}

