//
//  TimeSheetsTests.swift
//  TimeSheetsTests
//
//  Created by Simon Rofe on 8/8/2022.
//

import XCTest
@testable import TimeSheets

class TSTimeTests: XCTestCase {
    func test_time_hasHour() {
        let time = TSTime(hour: 12)
        XCTAssertEqual(time.hour, 12, "A TSTime shall have an hour property.")
    }
}
