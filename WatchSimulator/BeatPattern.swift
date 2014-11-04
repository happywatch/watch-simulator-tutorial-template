//
//  BeatPattern.swift
//  WatchSimulator
//
//  Created by temporary on 11/3/14.
//  Copyright (c) 2014 Ben Morrow. All rights reserved.
//

import UIKit

struct BeatPattern {
    var icon = "❤️"
    var description = "Mid-range"
    var bpm = 80
    var duration: Double {
        get {
            return 60.0 / Double(bpm)
        }
    }
    
    init(){
        
    }
    
    init(icon: String, description: String, bpm: Int){
        self.icon = icon
        self.description = description
        self.bpm = bpm
    }
}
