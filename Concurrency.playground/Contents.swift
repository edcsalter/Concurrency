import UIKit

class Concurrency: NSObject {
    
    // Class lvl var
    let queue = DispatchQueue(label: "io.teched.worker")

    func demonstrateGCD() {
        queue.async {
            // Call SLOW NON-UI functions/methods
            var i = 0
            
            // Add 1 to i 1000 times
            for _ in 0..<1000 {
                i += 1
            }
            
            // Print value of i when finished
            DispatchQueue.main.async {
                print("i = \(i)")
            }
        }
    }
}

let concurrentObj = Concurrency()
concurrentObj.demonstrateGCD()
