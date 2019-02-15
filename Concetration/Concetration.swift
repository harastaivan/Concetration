//
//  Concetration.swift
//  Concetration
//
//  Created by Ivan Harašta on 15/02/2019.
//  Copyright © 2019 Ivan Harašta. All rights reserved.
//

import Foundation

class Concetration {
    var cards = [Card]()

    var indexOfOneAndOnlyCardFaceUp: Int?

    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyCardFaceUp, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyCardFaceUp = nil
            } else {
                // either no cards or 2 are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyCardFaceUp = index
            }
        }
    }

    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        // TODO: Shuffle the cards
    }
}
