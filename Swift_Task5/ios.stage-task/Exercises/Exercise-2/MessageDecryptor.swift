import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage (_ message: String) -> String {
        if message.count > 60 {
            return ""
        }
        struct Stack {
            var number: Int
            var subMessage: String
        }
        var stackArray : [Stack] = []
        stackArray.append(Stack(number: 1, subMessage: ""))
        var numberString: String = ""
        for i in message {
            if i.isNumber {
                numberString.append(i)
                continue
            }
            if i == "[" {
                stackArray.append(Stack(number: Int(numberString) ?? 1, subMessage: ""))
                numberString = ""
                continue
            }
            if i == "]" {
                if let lastInStack = stackArray.popLast() {
                    stackArray[stackArray.count - 1].subMessage.append(String(repeating: lastInStack.subMessage, count: lastInStack.number))
                    continue
                }
            }
            stackArray[stackArray.count - 1].subMessage.append(i)
        }
        return stackArray.first?.subMessage ?? ""
    }
   
}
