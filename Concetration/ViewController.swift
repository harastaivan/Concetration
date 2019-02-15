//
//  ViewController.swift
//  Concetration
//
//  Created by Ivan Harašta on 15/02/2019.
//  Copyright © 2019 Ivan Harašta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCount =  0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!

    @IBOutlet var cardButtons: [UIButton]!

    var emojiChoices = ["😂", "😡", "😂", "😡"]

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        let cardNumber = cardButtons.index(of: sender)!
        print("cardNumber = \(cardNumber)")
        flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
    }

    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipCard(withEmoji: \(emoji))")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

