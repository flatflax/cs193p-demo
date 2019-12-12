//
//  ViewController.swift
//  Concentration
//
//  Created by 須木 on 2019/12/12.
//  Copyright © 2019 須木. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCount = 0{
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)}
        else{
            print("chosen card was not in cardButtons")
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices: Array<String> = ["👻","👻","🎃","🎃","🐝","🐝"]
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        print("flipCard(withEmoji:\(emoji)")
        if button.currentTitle == emoji{
            button.setTitle("", for:UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        }
        else{
            button.setTitle(emoji, for:UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

