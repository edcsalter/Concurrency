import UIKit

class Concurrency: NSObject {
    
    // Class lvl var
    let queue = DispatchQueue(label: "io.teched.worker")

    func demonstrateGCD() {
        queue.async {
            // Call SLOW NON-UI functions/methods
            var i = 0
            
            for _ in 0..<1000 {
                i += 1
            }
            DispatchQueue.main.async {
                print("i = \(i)")
            }
        }
    }
}

let concurrentObj = Concurrency()
concurrentObj.demonstrateGCD()
