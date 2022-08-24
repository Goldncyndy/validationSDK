import XCTest
@testable import ValidationLib_Example

class Tests: XCTestCase {
  
//  var validate: ValidationLib_Example!
    
  func testVerification() {
    var validate: String?
    
    XCTAssertNil(validate)
    
    validate = "girl@gmail.com"
    XCTAssertEqual(validate, "girl@gmail.com")
  }
}
