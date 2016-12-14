//
//  type.swift
//  maybe
//
//  Created by Amy Roberson on 12/13/16.
//  Copyright © 2016 Amy Roberson. All rights reserved.
//

import Foundation

enum Maybe<Element> {
    case none
    case some(Element)

    func toString(transform:(Element) -> String) -> Maybe<String>{
        switch self {
        case .none:
            return .none
        case .some(let value):
            return .some(transform(value))
        }
    }
    
    func transformUnwrapped<NewElement>(by:(_ transform:Element)-> NewElement) -> Maybe<NewElement> {
        switch self {
        case .none:
            return .none
        case .some(let value):
            return .some(by(value))
        }
    }
}

extension Maybe where Element : Equatable{
    static func == (_ lhs: Maybe<Element>, _ rhs: Maybe<Element>) -> Bool{
        switch (lhs, rhs){
        case(.some(let left), .some(let right)):
            return left == right
        case(.none, .none):
            return true
        case(.none, .some),(.some, .none):
            return false
        }
    }
}



