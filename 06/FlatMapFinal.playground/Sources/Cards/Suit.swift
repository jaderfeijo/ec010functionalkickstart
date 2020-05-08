import SwiftUI

public let suits = Suit.allCases
public let numberOfSuits = suits.count

public enum Suit: String, CaseIterable {
    case spades = "♠︎"
    case diamonds = "♦︎"
    case clubs =  "♣︎"
    case hearts = "♥︎"
}

extension Suit {
    public var color: Color {
        switch self {
        case .diamonds, .hearts:
            return .red
        case .clubs, .spades:
            return .black
        }
    }
}

extension Suit: CustomStringConvertible {
    public var description: String {
        rawValue
    }
}

// not needed with Swift 5.3

extension Suit: Equatable, Comparable {
    public static func <(lhs: Suit, rhs: Suit) -> Bool {
        Suit.allCases.firstIndex(of: lhs)! < Suit.allCases.firstIndex(of: rhs)!
    }
}
