//
//  Card.swift
//  Concentration
//
//  Created by Jay on 30/12/2018.
//  Copyright © 2018 Jay. All rights reserved.
//

import Foundation

struct Card
{
    // Struct has no inheritence whereas Classes support inheritence
    // Struct are value types (copies the values around) & classes are reference types (eg: pointers)
    
    
    // this should contains details of how the cards work and not how the card is displayed.
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    

    static var identifierFactory = 0
    
    //static vars
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    // init is only  method where you can have the external and internal name to be the same.
    
    init ()
    {
        self.identifier = Card.getUniqueIdentifier()        // self.identifier means this particulcar cards identifier
        
    }
    
}
