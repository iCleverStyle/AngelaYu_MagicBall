//
//  CodeViewController.swift
//  Magic 8 Ball
//
//  Created by Евгений on 29.03.25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class CodeViewController: UIViewController {
    
    // MARK: -  UI Elements
    private lazy var ballImage2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var rollButton2: UIButton = {
        let button = UIButton()
        button.contentMode = .scaleToFill
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Roll", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        button.layer.cornerRadius = 18
        button.backgroundColor = .white
        button.setTitleColor(UIColor(cgColor: CGColor(srgbRed: 0.4941176471, green: 0.79607843140000001, blue: 0.97647058819999999, alpha: 1)), for: .normal)
        button.addTarget(self, action: #selector(rollButtonPressed2), for: .touchUpInside)
        return button
    }()

    private lazy var labelAskMe: UILabel = {
        let label = UILabel()
        label.contentMode = .left
        label.text = "Ask me anything..."
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        label.baselineAdjustment = .alignBaselines
        label.adjustsFontSizeToFitWidth = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32)
        label.textColor = UIColor(cgColor: CGColor(genericGrayGamma2_2Gray: 1, alpha: 1))
        return label
    }()

    // MARK: -  View Hierachy
    func setupLayout() {
        title = "made by code"
        view.addSubview(labelAskMe)
        view.addSubview(ballImage2)
        view.addSubview(rollButton2)
    }
    
    // MARK: -  Constrains
    func setupConstraints() {
        view.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 0.4941176471, green: 0.79607843140000001, blue: 0.97647058819999999, alpha: 1))
        
        NSLayoutConstraint.activate([
            labelAskMe.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            labelAskMe.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ballImage2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ballImage2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ballImage2.widthAnchor.constraint(equalToConstant: 250),
            
            rollButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollButton2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            rollButton2.widthAnchor.constraint(equalToConstant: 200),
            rollButton2.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
        
    // MARK - Old cod
    let ballArray = [ #imageLiteral(resourceName: "ball1.png"), #imageLiteral(resourceName: "ball2.png"), #imageLiteral(resourceName: "ball3.png"), #imageLiteral(resourceName: "ball4.png"), #imageLiteral(resourceName: "ball5.png")]
    
    private var timer: Timer?
    private var isRolling = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupConstraints()
    }
    
    @objc func rollButtonPressed2(_ sender: UIButton) {
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
            self.ballImage2.image = self.ballArray.randomElement()
        }
    }
    
    private func stopRolling() {
        timer?.invalidate()
        timer = nil
        ballImage2.image = ballArray.randomElement()
    }
}
