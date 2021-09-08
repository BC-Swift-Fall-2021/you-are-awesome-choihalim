//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by 최하림 on 9/8/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("🐙 viewDidLoad has run!")
        messageLabel.text = "Fabulous? That's You!"
    }


    @IBAction func messageButtonPressed(_ sender: UIButton) {
        print("🤓 The message button was pressed!")
        messageLabel.text = "You Are Awesome!"
    }
}

