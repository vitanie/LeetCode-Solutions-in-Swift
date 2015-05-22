//
//  Medium_040_Combination_Sum_II_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/19/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_040_Combination_Sum_II_Test: XCTestCase {
    private static let ProblemName: String = "Medium_040_Combination_Sum_II"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        var input: [Any] = [[2, 3, 6, 7], 7]
        var expected: [[Int]] = [[7]]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        var input: [Any] = [[9], 1]
        var expected: [[Int]] = []
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        var input: [Any] = [[1, 2, 3], 6]
        var expected: [[Int]] = [[1, 2, 3]]
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        var input: [Any] = [[10, 1, 2, 7, 6, 1, 5], 8]
        var expected: [[Int]] = [[1, 7], [1, 2, 5], [2, 6], [1, 1, 6]]
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        var input: [Any] = [[8], 8]
        var expected: [[Int]] = [[8]]
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        var input: [Any] = [[1, 1, 1, 1, 1], 5]
        var expected: [[Int]] = [[1, 1, 1, 1, 1]]
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        var input: [Any] = [[1, 1, 1, 1, 1], 4]
        var expected: [[Int]] = [[1, 1, 1, 1]]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(# input: [Any], expected: [[Int]]) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_040_Combination_Sum_II_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: [[Int]] = Medium_040_Combination_Sum_II.combinationSum(candidates: input[0] as! [Int], target: input[1] as! Int)
            if count(result) != count(expected) {
                assertHelper(false, problemName: Medium_040_Combination_Sum_II_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            } else {
                for var i = 0; i < count(expected); i++ {
                    var flag: Bool = false
                    for var j = 0; j < count(result); j++ {
                        if expected[i] == result[j] {
                            flag = true
                        }
                    }
                    if flag == false {
                        assertHelper(false, problemName: Medium_040_Combination_Sum_II_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
                        return
                    }
                }
            }
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_040_Combination_Sum_II_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_040_Combination_Sum_II_Test.ProblemName, input: input, resultValue: Medium_040_Combination_Sum_II_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}