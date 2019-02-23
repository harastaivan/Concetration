//
//  Concetration.swift
//  Concetration
//
//  Created by Ivan Harašta on 15/02/2019.
//  Copyright © 2019 Ivan Harašta. All rights reserved.
//

import Foundation

struct Concetration {
    private(set) var cards = [Card]()

    private var indexOfOneAndOnlyCardFaceUp: Int? {
        get {
            var foundIndex: Int? // = nil
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }

    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concetration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyCardFaceUp, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                // either no cards or 2 are face up
                indexOfOneAndOnlyCardFaceUp = index
            }
        }
    }

    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concetration.init(at: \(numberOfPairsOfCards)): you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        cards.shuffle()
    }
}
