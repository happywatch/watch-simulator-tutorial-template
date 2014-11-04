//
//  WatchAppViewController.swift
//  WatchSimulator
//
//  Created by temporary on 10/12/14.
//  Copyright (c) 2014 Ben Morrow. All rights reserved.
//

import UIKit

class AppViewController: UIViewController {
    
    @IBOutlet weak var bpmLabel: UILabel!
    
    var currentBeatPattern = BeatPattern()
    
    var beatPatterns: [[AnyObject?]] = [
        ["💛", "Fast", 180],
        ["❤️", "Mid-range", 80],
        ["💜", "Slow", 55],
        ["💙", "Sedated", 30]
    ]
    
    var currentBeatPatternIndex = 0
    
    let shrinkFactor = CGFloat(2.0 / 3)
    
    var expandFactor: CGFloat {
        get {
            return 1 / shrinkFactor
        }
    }
    
    let iconLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any more setup after this
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.view.insertSubview(iconLabel, atIndex: 1)
        iconLabel.transform = CGAffineTransformMakeScale(shrinkFactor, shrinkFactor)
        iconLabel.frame = self.view.bounds
        iconLabel.textAlignment = .Center
        iconLabel.font = UIFont.boldSystemFontOfSize(132)
        
        newBeat()
        beat()
        
    }
    
    func newBeat() {
        if ++currentBeatPatternIndex == beatPatterns.count {
            currentBeatPatternIndex = 0
        }
        let beatValues = beatPatterns[currentBeatPatternIndex]
        currentBeatPattern = BeatPattern(
            icon: beatValues[0] as String,
            description: beatValues[1] as String,
            bpm: beatValues[2] as Int)
        bpmLabel.text = "\(currentBeatPattern.bpm)"
        iconLabel.text = currentBeatPattern.icon
        
        NSTimer.scheduledTimerWithTimeInterval(8, target: self, selector: Selector("newBeat"), userInfo: nil, repeats: false)
        
        
    }
    
    func beat(){
        UIView.animateWithDuration(self.currentBeatPattern.duration / 2,
            delay: 0.0,
            options: .CurveEaseInOut,
            animations: {
                self.iconLabel.transform = CGAffineTransformScale(self.iconLabel.transform, self.expandFactor, self.expandFactor)
            },
            completion: { _ in
                UIView.animateWithDuration(self.currentBeatPattern.duration / 2,
                    delay: 0.0,
                    options: .CurveEaseInOut,
                    animations: {
                        self.iconLabel.transform = CGAffineTransformScale(self.iconLabel.transform, self.shrinkFactor, self.shrinkFactor)
                    },
                    completion: { _ in
                        self.beat()
                    }
                )
            }
        )
    }
    
}



















