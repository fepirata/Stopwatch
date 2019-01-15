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
    
    var elapsedTime: TimeInterval {
        if let startTime = self.startTime {
            return -startTime.timeIntervalSinceNow
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
    func stop() {
        startTime = nil
    }
    
}
