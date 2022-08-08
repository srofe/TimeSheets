//
//  TSTime.swift
//  TimeSheets
//
//  Created by Simon Rofe on 8/8/2022.
//

import Foundation

struct TSTime {
    let hour: Int
    let minute: Int
}

extension TSTime: CustomStringConvertible {
    var description: String {
        "\(hour):\(minute)"
    }
}

extension TSTime: Equatable {
    static func==(lhs: TSTime, rhs: TSTime) -> Bool {
        lhs.hour == rhs.hour && lhs.minute == rhs.minute
    }
}

extension TSTime {
    static func+(lhs: TSTime, rhs: TSTime) -> TSTime {
        TSTime(hour: (lhs.hour + rhs.hour) + (lhs.minute + rhs.minute) / 60, minute: (lhs.minute + rhs.minute) % 60)
    }

    static func-(lhs: TSTime, rhs: TSTime) -> TSTime {
        if rhs.minute > lhs.minute {
            let lhsHour = lhs.hour - 1
            let lhsMinute = lhs.minute + 60
            return TSTime(hour: (lhsHour - rhs.hour), minute: lhsMinute - rhs.minute)
        } else {
            return TSTime(hour: (lhs.hour - rhs.hour), minute: lhs.minute - rhs.minute)
        }
    }
}
