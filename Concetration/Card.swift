//
//  Card.swift
//  Concetration
//
//  Created by Ivan Harašta on 15/02/2019.
//  Copyright © 2019 Ivan Harašta. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    // No emoji! - This is a Model not a View

    static var identifierFactory = 0

    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }

    init() {
        identifier = Card.getUniqueIdentifier()
    }
}
