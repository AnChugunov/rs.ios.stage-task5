import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        
            var numberString = ""
            var numbersStack: [Int] = [1]
            var substringsStack: [String] = [""]
            var lastInNumbersStack: Int
            var lastInSubstringsStack: String
            for i in message {
               
                if i.isNumber {
                    numberString.append(i)
                    continue
                }
              
                if i == "[" {
                    numbersStack.append(Int(numberString) ?? 1)
                    substringsStack.append("")
                    numberString = ""
                    continue
                }
                
                if i == "]" {
                    lastInNumbersStack = numbersStack.popLast()!
                    lastInSubstringsStack = substringsStack.popLast()!
                    var stringToAppend: String = ""
                    for _ in 0...lastInNumbersStack {
                        stringToAppend += lastInSubstringsStack
                    }
                    substringsStack.append(stringToAppend)
                    continue
                }
                substringsStack[substringsStack.count - 1].append(i)
            }
            
            
            return substringsStack.first!
        
    }
        
    }
