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
        let time = TSTime(hour: 12, minute: 0)
        XCTAssertEqual(time.hour, 12, "A TSTime shall have an hour property.")
    }

    func test_time_hasMinute() {
        let time = TSTime(hour: 12, minute: 34)
        XCTAssertEqual(time.minute, 34, "A TSTime shall have a minute property")
    }

    func test_time_isCustomStringConvertible() {
        let time = TSTime(hour: 6, minute: 45)
        XCTAssertEqual(time.description, "6:45", "TSTime shall conform to CustomStringConvertible protocol.")
    }

    func test_time_customStringConvertiblePadsWithZero() {
        let time = TSTime(hour: 2, minute: 30)
        XCTAssertEqual(time.description, "2:30", "TSTime description shall show trailing zero for thirty minutes.")
    }

    func test_time_customStringConvertiblePadsWithTwoZeros() {
        let time = TSTime(hour: 2, minute: 0)
        XCTAssertEqual(time.description, "2:00", "TSTime description shall show two zeros when there are zero minutes.")
    }

    func test_time_canBeAdded_minutesOnly() {
        let time1 = TSTime(hour: 0, minute: 15)
        let time2 = TSTime(hour: 0, minute: 15)
        XCTAssertEqual(time1 + time2, TSTime(hour: 0, minute: 30), "Two TSTime objects shall be able to be added - minutes only.")
    }

    func test_time_canBeAdded_hoursOnly() {
        let time1 = TSTime(hour: 1, minute: 0)
        let time2 = TSTime(hour: 2, minute: 0)
        XCTAssertEqual(time1 + time2, TSTime(hour: 3, minute: 0), "Two TSTime objects shall be able to be added - hours only.")
    }

    func test_time_canBeAdded_hoursAndMinuts_withMinuteRollOver() {
        let time1 = TSTime(hour: 1, minute: 45)
        let time2 = TSTime(hour: 2, minute: 30)
        XCTAssertEqual(time1 + time2, TSTime(hour: 4, minute: 15), "Two TSTime objects shall be able to be added - minutes sum greater than 60.")
    }

    func test_time_canBeSubtracted_minutesOnly() {
        let time1 = TSTime(hour: 0, minute: 30)
        let time2 = TSTime(hour: 0, minute: 15)
        XCTAssertEqual(time1 - time2, TSTime(hour: 0, minute: 15), "Two TSTime objects shall be able to be subtracted - minutes only.")
    }

    func test_time_canBeSubtracted_hoursOnly() {
        let time1 = TSTime(hour: 3, minute: 0)
        let time2 = TSTime(hour: 1, minute: 0)
        XCTAssertEqual(time1 - time2, TSTime(hour: 2, minute: 0), "Two TSTime objects shall be able to be subtracted - hours only.")
    }

    func test_time_canBeSubtracted_withMinutesRollOver() {
        let time1 = TSTime(hour: 3, minute: 15)
        let time2 = TSTime(hour: 1, minute: 45)
        XCTAssertEqual(time1 - time2, TSTime(hour: 1, minute: 30), "Two TSTime objects shall be able to be subtracted - minutes subtraction less than 0.")
    }

    func test_time_hasDecimalDescription() {
        let time = TSTime(hour: 6, minute: 15)
        XCTAssertEqual(time.decimalHours, "6.25", "TSTime shall provide a decimal description as a string.")
    }

    func test_time_hasDecimalDescriptionWithPadding() {
        let time = TSTime(hour: 10, minute: 30)
        XCTAssertEqual(time.decimalHours, "10.50", "TSTime shall provide a decimal description as a string with zero padding at end.")
    }
}
