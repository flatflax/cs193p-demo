//
//  Card.swift
//  Concentration
//
//  Created by 須木 on 2019/12/12.
//  Copyright © 2019 須木. All rights reserved.
//

import Foundation

struct Card: Hashable
{
    func hash(into hasher: inout Hasher){ hasher.combine(identifier) }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int{
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
