import UIKit

class Concurrency: NSObject {
    
    // Class lvl var creating a serial DispatchQueue
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

// Main DispatchQueue is a class var
let mainDispatchQueue = DispatchQueue.main

// Creating a concurrent DispatchQueue
let concurrentDispatchQueue = DispatchQueue(label: "io.teched.concurrentWorker", attributes: .concurrent)

// Concurrent queues so common Apple has 6 globally available that differ by their Quality of Service (QoS)
/**
 .userInteractive
 .userInitiated
 .utility
 .background
 .default - falls inbetween .userInitiated & .utility
 .unspecified - exists only for legacy APIs
 */
let userInteractiveQueue = DispatchQueue.global(qos: .userInteractive)
