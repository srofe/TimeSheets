//
//  TSTime.swift
//  TimeSheets
//
//  Created by Simon Rofe on 8/8/2022.
//

import Foundation

struct TSTime: CustomStringConvertible {
    let hour: Int
    let minute: Int

    var description: String {
        "\(hour):\(minute)"
    }
}
