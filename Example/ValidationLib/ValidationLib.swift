//
//  ValidationLib.swift
//  ValidationLib
//
//  Created by Decagon on 24/08/2022.
//

import UIKit

class Validation {
    
  static let shared = Validation()
  private init() {}
  
  func validateEmail(_ email: String) {
    if email.isValidEmail {
      print("TRUE")
    } else {
      print("FALSE")
    }
  }
}

extension String {
  
    var emailWithAsteriks: String {
        if isEmpty {
            return ""
        }
        let splittedString = split(separator: "@")
        let firstPart = splittedString[0]
        let secondPart = splittedString[1]
        let index = firstPart.index(firstPart.startIndex, offsetBy: 1)
        let firstTowChars = firstPart[firstPart.startIndex...index]
        let asteriks = String.init(repeating: "*", count: firstPart.count-2)
        return "\(String(firstTowChars))\(asteriks)\(String(secondPart))"
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        count > 7 ? true : false
    }
    
    var isValidPhoneNumber: Bool {
        let emailRegEx = "[0-9]{11}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var isValidDay: Bool {
        let emailRegEx = "[0-9]{1,2}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var isValidMonth: Bool {
        let emailRegEx = "[0-9]{1,2}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var isValidYear: Bool {
        let emailRegEx = "[0-9]{4}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var jsonBundleURL: URL? { Bundle.main.url(forResource: self, withExtension: "json") }
    
    var m3u8BundleURL: URL? { Bundle.main.url(forResource: self, withExtension: "m3u8") }
    
    
    func getOnlyNumbers() -> String {
        return filter{$0.isNumber}
    }
    
    var takeWholeNumber: String {
        let spliitedString = split(separator: ",")
        if !spliitedString.isEmpty {
            switch spliitedString.count {
            case 2:
                return "\(spliitedString[0])000"
            case 3:
                return "\(spliitedString[0])000000"
            default:
                break
            }
        }
        return self
    }
    
    var toInt: Int {
        Int(self) ?? 0
    }
    
    var toDouble: Double {
        Double(self) ?? 0.0
    }
    
    var extractDate: String {
        if self.contains("T") {
            return String(self.split(separator: "T")[0])
        }
        return ""
    }
    
}
