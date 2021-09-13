//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by 최하림 on 9/8/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playSoundSwitch: UISwitch!
    
    var imageNumber = -1
    var messageNumber = -1
    var soundNumber = -1
    let totalNumberOfImages = 9
    let totalNumberOfSounds = 6
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // helper function responsible for playing sound
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("🥵 ERROR: \(error.localizedDescription) Could not initialize AVAudioPlayer object")
            }
        } else {
            print("🥵 ERROR: Could not read data from file sound0")
        }
    }
    
    func nonRepeatingRandom(originalNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while originalNumber == newNumber
        return newNumber
    }

    @IBAction func messageButtonPressed(_ sender: UIButton) {
        let messages = ["You are remarkable!",
                        "You are amazing!",
                        "You can do it!",
                        "Don't give up~",
                        "Keep calm and carry on",
                        "Push yourself!"]
        
        messageNumber = nonRepeatingRandom(originalNumber: messageNumber, upperBound: messages.count-1)
        messageLabel.text = messages[messageNumber]
        
        imageNumber = nonRepeatingRandom(originalNumber: imageNumber, upperBound: totalNumberOfImages-1)
        imageView.image = UIImage(named: "image\(imageNumber)")
        
        soundNumber = nonRepeatingRandom(originalNumber: soundNumber, upperBound: totalNumberOfSounds-1)
        
        if playSoundSwitch.isOn { // if playSoundSwitch is on
            playSound(name: "sound\(soundNumber)") // then play the sound
        }
    }
    
    @IBAction func playSoundToggled(_ sender: UISwitch) {
        if !sender.isOn && audioPlayer != nil {   // if NOT true
            audioPlayer.stop()  // stop playing
        }
    }
}
