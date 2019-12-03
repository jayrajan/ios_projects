//
//  ViewController.swift
//  Concentration
//
//  Created by Jay on 21/12/2018.
//  Copyright © 2018 Jay. All rights reserved.
//

import UIKit
// UIKit is the library that contains all the functions to control the UI elements

class ViewController: UIViewController { // Class open
// ViewController is the class for the UI view
// UIViewController is the super class which is contained in the UIKIT Library.

// Declare instance variables (if any)
    
  lazy var game = Concentration(numberOfPairsOfCards: 12)
    
    
    var flipCount = 0 { //flipcount open
        didSet {  // didset open   didSet functions observe changes in the variable and updates the FlipCountLabel when it detects a change.
        
        flipCountLabel.text = "Flips: \(flipCount)" // changing the label with the number of flipcounts
            
        } // didset close
    
    } // flipcount close
  
    // UILabel1 (outlet)
    @IBOutlet weak var flipCountLabel: UILabel!
  
    //OutletCollection -> gets to decide what goes in the array
    
    // This will be an array of UIButton
//    @IBOutlet var cardButons: [UIButton]!
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
// Declare swift methods of this class
    @IBAction func touchcard(_ sender: UIButton) {
        flipCount += 1    // inncrementing the count
        //   print("this is a ghost!")
        
       
        // let cardNumber = cardButtons.index(of: sender)! // the exclamation (!) means assume the index is set and grab the number of the element that is set so it just returns the number of the element thats been pressed/executed.
        
        // OPTIONALS - read on this
      
        if  let cardNumber = cardButtons.index(of: sender)
      {
      //  print("Card Number: \(cardNumber)")
       
        game.chooseCard(at: cardNumber)
        updateViewFromModel()
        // flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
        
        else
      {
        print("Chosen card is not in cardButtons")
        }
        
    //    flipCard(withEmoji: "👻", on: sender)
    }
    
    

    // declaring our own functionn
    // have two names for variable one is external name & internal name
    // it is possible to have same name for both external & internal
    // withEmoji is the external name
    // emoji is the internal name
    
    
    func updateViewFromModel()
    {
        for index in cardButtons.indices
        {
          let button = cardButtons[index]
          let card = game.cards[index]
            if card.isFaceUp
            {
                button.setTitle(emoji (for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            }
            else
            {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    
    var emojiChoices = ["👻","🍋","🕷","🎃","🍭","🙊","🌻","🍀","🍒"]
    
    var emoji = Dictionary<Int,String> ()
    
    func emoji(for card: Card) -> String
    {
        if emoji[card.identifier] == nil {
        
            if emojiChoices.count > 0
            {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        }
        
        
        if emoji[card.identifier] != nil {
         return emoji[card.identifier]!
        }
        else {
        return "?"
        }
  //  return emoji[card.identifier] ?? "?"  this is the same as above if and else statements.
    
    }
    
    
 /*   func flipCard(withEmoji emoji: String, on button: UIButton)
    
        
        
    { // func open
        
       // print("flipCard(withEmoji: \(emoji))")
        print("withEmoji: \(emoji)")
        if  button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            }
        
    }  // func close
   */
} // Class Close

