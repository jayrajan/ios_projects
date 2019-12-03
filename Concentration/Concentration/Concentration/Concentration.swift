//
//  Concentration.swift
//  Concentration
//
//  Created by Jay on 30/12/2018.
//  Copyright © 2018 Jay. All rights reserved.
//

// This is the main model file for the game - concentration

import Foundation

class Concentration
{
 // API - Application Programming Interface includes all the vars and methods which can be used in public.
    
    var cards = [Card]()
    
    var indexOfOneCardAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int){
    
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneCardAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
            }
                  cards[index].isFaceUp = true
                indexOfOneCardAndOnlyFaceUpCard = nil
            }
                else {
                // either or no cards  or 2 cards are face up
                
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneCardAndOnlyFaceUpCard = index
            }
        
        }
        }
        
     /*   if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        }
        else {
            cards[index].isFaceUp = true
        } */
    
    
    
    init(numberOfPairsOfCards: Int)
    {
        for _ in 1...numberOfPairsOfCards
            // _ means dont care about the name of parameter.
        {
            let card = Card()
      //      let matchingCard = card // matchingcard is a copy of card
            cards += [card, card]    //another way of appending an array
            
      //      cards.append(card)     //creating copies of cards
      //      cards.append(card)     // creating copies of cards
            
     //       cards.append(matchingCard)
        }
        
        // To do: Shuffle the cards - Homework 
    }
}
