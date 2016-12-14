//
//  TestingTransform.swift
//  maybe
//
//  Created by Amy Roberson on 12/13/16.
//  Copyright © 2016 Amy Roberson. All rights reserved.
//

import XCTest
@testable import maybe

class TestingTransform: XCTestCase {


    func testMaybeWithString(){
        let x = "4"
        let maybe: Maybe<String> = .some(x)
        let result = maybe.transformUnwrapped(by: { x in
            return Int(x)!})
        let expected: Maybe<Int> = .some(4)
        XCTAssert(result == expected)
        
    }
    
    func testMaybeWithNone(){
        let maybe: Maybe<String> = .none
        let result = maybe.transformUnwrapped(by: { x in
            return Int(x)!})
        let expected: Maybe<Int> = .none
        XCTAssert(result == expected)
        
    }
    
    func testMaybeWithInt(){
        let x = 5
        let maybe: Maybe = .some(x)
        let result = maybe.transformUnwrapped(by: {x -> Int in
            let num = x
            return (num + 1) })
        let expected: Maybe<Int> = .some(6)
        XCTAssert(result == expected)
    }
    
    func testtoString(){
        let x: Maybe<Int> = .some(5)
        let result = x.toString(transform: { x in
            return "There is a value"})
        let expected: Maybe<String> = .some("There is a value")
        XCTAssert(result == expected)
        
    }
    
    func testtoStringNone(){
        let x: Maybe<Int> = .none
        let result = x.toString(transform: { x in
            return "There no value"})
        let expected: Maybe<String> = .none
        XCTAssert(result == expected)
        
    }

}
