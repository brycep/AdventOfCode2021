//
//  Day1Solution.swift
//  AdventOfCode
//
//  Created by Bryce Penberthy on 12/9/21.
//

import Foundation

class Day1Solution {
    func solution() {
        do {
            let dataString = try String(contentsOfFile: "/Users/bryce/code/AdventOfCode/data/Day1Data.txt")
            let dataValues = dataString.components(separatedBy: "\n")
            
            var counter = 0
            var lastValue = Int.max
            dataValues.forEach { item in
                let currentValue = Int(item) ?? 0
                if (currentValue > lastValue) {
                    counter += 1
                } else {
                }
                lastValue = currentValue
            }
            
            print("\n")
            print("Counter = \(counter)")
        } catch {
            print("I couldn't open the file")
        }
    }
}
