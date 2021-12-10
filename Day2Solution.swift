//
//  Day2Solution.swift
//  AdventOfCode
//
//  Created by Bryce Penberthy on 12/10/21.
//

import Foundation

class Day2Solution {
    
    struct Submarine {
        var depth: Int = 0
        var distance: Int = 0
        var aim: Int = 0
    }
    
    func solution() {
        do {
            let dataString = try String(contentsOfFile: "/Users/bryce/code/AdventOfCode2021/data/Day2Data.txt")
            let dataValues = dataString.components(separatedBy: "\n")

            var submarine = Submarine()
            dataValues.forEach { items in
                let values = items.components(separatedBy: " ")
                if (values.count == 2) {
                    let command = values[0]
                    let units = Int(values[1]) ?? 0
                    switch(command) {
                    case "forward":
                        submarine.distance += units
                        submarine.depth += (units * submarine.aim)
                    case "down":
                        submarine.aim += units
                    case "up":
                        submarine.aim -= units
                    default:
                        print("Unexpected command")
                    }
                }
            }
            
            print("Depth = \(submarine.depth)")
            print("Distance = \(submarine.distance)")
            print("Answer = \(submarine.distance * submarine.depth)")
        } catch {
            print("Could not read the data file")
        }
    }
}
