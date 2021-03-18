//
//  PlayData.swift
//  Project 39 - Unit testing with XCTest
//
//  Created by Ata Etgi on 18.03.2021.
//

import Foundation

class PlayData {
    var allWords = [String]()
    
//    var wordCounts = [String: Int]()
    
    var wordCounts: NSCountedSet!
    
    private(set) var filteredWords = [String]()
    
    init() {
        if let path = Bundle.main.path(forResource: "plays", ofType: "txt") {
            if let plays = try? String(contentsOfFile: path) {
                allWords = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)
                allWords = allWords.filter({ $0 != "" })
            }
            
//            for word in allWords {
//                wordCounts[word, default: 0] += 1
//            }
//
//            allWords = Array(wordCounts.keys)
            
            wordCounts = NSCountedSet(array: allWords)
            let sorted = wordCounts.allObjects.sorted(by: {wordCounts.count(for: $0) > wordCounts.count(for: $1)})
            allWords = sorted as! [String]
            
            applyUserFilter("swift")
        }
    }
    
    func applyUserFilter(_ input: String) {
        
        if let userNumber = Int(input) {
            // we got number!
            applyFilter({ self.wordCounts.count(for: $0) >= userNumber })
        } else {
            // we got string!
            applyFilter({ $0.range(of: input, options: .caseInsensitive) != nil })
        }
        
    }
    
    func applyFilter(_ filter: (String) -> Bool) {
    
        filteredWords = allWords.filter(filter)
        
    }
    
    
}
