//
//  Day1Solution.swift
//  AdventOfCode
//
//  Created by Bryce Penberthy on 12/9/21.
//

import Foundation

class Day1Solution {
    let WINDOW_SIZE = 3
    
    func solution() {
        do {
            let dataString = try String(contentsOfFile: "/Users/bryce/code/AdventOfCode2021/data/Day1Data.txt")
            let dataValues = dataString.components(separatedBy: "\n")
            
            var counter = 0
            var previousValue = nil as Int?
            var windowValues = [Int?](repeating: nil, count: WINDOW_SIZE)
            dataValues.forEach { item in
                let currentValue = Int(item) ?? 0
                windowValues = shiftWindow(windowValues: windowValues, currentValue: currentValue)
                let value = calculateValue(windowValues: windowValues)
                
                if (isWindowPopulated(windowValues: windowValues) && (previousValue != nil)) {
                    if (value! > previousValue!) {
                        print("\(value!) increased")
                        counter += 1
                    } else {
                        print("\(value!) decreased")
                    }
                }
                previousValue = value
            }
            
            print("\n")
            print("Counter = \(counter)")
        } catch {
            print("I couldn't open the file")
        }
    }
    
    private func shiftWindow(windowValues: [Int?], currentValue: Int) -> [Int?] {
        var shiftedValues = [Int?](repeating:nil, count: WINDOW_SIZE)
        for index in 0...(WINDOW_SIZE - 2) {
            shiftedValues[index + 1] = windowValues[index]
        }
        shiftedValues[0] = currentValue
        return shiftedValues
    }
    
    private func calculateValue(windowValues: [Int?]) -> Int? {
        if (!isWindowPopulated(windowValues: windowValues)) {
            return nil
        }
        return windowValues.map { $0! }.reduce(0) { result, item in result + item }
    }
    
    
    private func isWindowPopulated(windowValues: [Int?]) -> Bool {
        return (windowValues[0] != nil) && (windowValues[1] != nil) && (windowValues[2] != nil)
    }
    
}
