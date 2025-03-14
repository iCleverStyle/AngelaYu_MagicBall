//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let ballArray = [ #imageLiteral(resourceName: "ball1.png"), #imageLiteral(resourceName: "ball2.png"), #imageLiteral(resourceName: "ball3.png"), #imageLiteral(resourceName: "ball4.png"), #imageLiteral(resourceName: "ball5.png")]
    @IBOutlet weak var ballImage: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    private var timer: Timer?
    private var isRolling = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        isRolling.toggle()
        
        if isRolling {
            sender.setTitle("Stop", for: .normal)
            startRolling()
        } else {
            sender.setTitle("Roll", for: .normal)
            stopRolling()
        }
    }
    
    private func startRolling() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.ballImage.image = self.ballArray.randomElement()
        }
    }
    
    private func stopRolling() {
        timer?.invalidate()
        timer = nil
        ballImage.image = ballArray.randomElement()
    }
}

