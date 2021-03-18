//___FILEHEADER___

import XCTest
@testable import Project_39___Unit_testing_with_XCTest

class ___FILEBASENAMEASIDENTIFIER___: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAllWordsLoaded() {
        
        let playData = PlayData()
        XCTAssertEqual(playData.allWords.count, 18_440, "allWords was not 18.440")
    }
    
    func testWordCountsAreCorrect() {
        let playData = PlayData()
//        XCTAssertEqual(playData.wordCounts["home"], 174, "home does not appear 174 times")
//        XCTAssertEqual(playData.wordCounts["fun"], 4, "fun does not appear 4 times")
//        XCTAssertEqual(playData.wordCounts["mortal"], 41, "mortal does not appear 41 times")
        
        XCTAssertEqual(playData.wordCounts.count(for: "home"), 174, "hoem does not appear 174 times")
        XCTAssertEqual(playData.wordCounts.count(for: "fun"), 4, "fun does not appear 4 times")
        XCTAssertEqual(playData.wordCounts.count(for: "mortal"), 41, "mortal does not appear 41 times")
        
    }
    
    func testUserFilterWorks() {
        
        let playData = PlayData()
        
        playData.applyUserFilter("100")
        XCTAssertEqual(playData.filteredWords.count, 495)
        
        playData.applyUserFilter("1000")
        XCTAssertEqual(playData.filteredWords.count, 55)
        
        playData.applyUserFilter("10000")
        XCTAssertEqual(playData.filteredWords.count, 1)
        
        playData.applyUserFilter("test")
        XCTAssertEqual(playData.filteredWords.count, 56)
        
        playData.applyUserFilter("swift")
        XCTAssertEqual(playData.filteredWords.count, 7)
        
        playData.applyUserFilter("objective-c")
        XCTAssertEqual(playData.filteredWords.count, 0)
        
        
    }

    func testWordsLoadQuicly() {
        
        measure {
            _ = PlayData()
        }
        
    }
    
}
