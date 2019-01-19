//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by Felipe Almeida on 2019-01-14.
//  Copyright © 2019 Felipe Almeida. All rights reserved.
//

import Foundation

class Stopwatch {
    
    private var startTime: Date?
    
    var updatedTime: Double = 0.0
    
    var elapsedTime: TimeInterval {
        if let startTime = self.startTime {
            return updatedTime + -startTime.timeIntervalSinceNow
        } else {
            return 0
        }
    }
    
    
    
    var isRunning: Bool {
        return startTime != nil
    }
    
    func start() {
        startTime = Date()
    }
    
//    pause functioni
    func pause() {
        
        updatedTime = elapsedTime
        
        startTime = nil
        
        print("UpdatedTime value is: \(updatedTime)")
    }
    
    func stop() {
        startTime = nil
        updatedTime = 0.0
        print("UpdatedTime value is: \(updatedTime)")
        print("startTime value is: \(startTime)")
    }
    
}
