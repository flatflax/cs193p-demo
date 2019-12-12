//
//  ViewController.swift
//  Concentration
//
//  Created by 須木 on 2019/12/12.
//  Copyright © 2019 須木. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0{
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
        }
        else{
            print("chosen card was not in cardButtons")
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        print("flipCard(withEmoji:\(emoji)")
    }
        
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for:UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else{
                button.setTitle("", for:UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1) : #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            }
        }
    }
    
    var emojiChoices: Array<String> = ["👻","🦀","🎃","🦑","🐝","🐓","🐟","🌸","🐚","⭐️","🌈","🍎","🍓"]
    
    var emoji = [Int: String]()
    
    func emoji(for card:Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            let randomIndex = arc4random_uniform(UInt32(emojiChoices.count))
            emoji[card.identifier] = emojiChoices.remove(at: Int(randomIndex))
        }
        return emoji[card.identifier] ?? "?"
    }
    @IBAction func restartGame(_ sender: Any) {
        
    }
}

