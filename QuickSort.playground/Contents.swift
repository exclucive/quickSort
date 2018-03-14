//: Playground - noun: a place where people can play

import UIKit

func quickSort(_ a: [Int]) -> [Int] {
    let count = a.count
    guard count > 1 else { return a }
    
    let pivot = a[count/2]
    let less = a.filter{$0 < pivot}
    let equal = a.filter{$0 == pivot}
    let greater = a.filter{$0 > pivot}
    
    return quickSort(less) + equal + quickSort(greater)
}

var array = [3, 5, -110, 99, 8, 19, 2, 3, -20]

func partitioningLomuto(_ a: inout [Int], low: Int, high: Int) -> Int {
    let pivot = a[high]
    
    var pointerIndex = low
    
    for i in low..<high {
        if pivot >= a[i] {
            a.swapAt(pointerIndex, i)
            pointerIndex += 1
        }
    }
    
    a.swapAt(pointerIndex, high)

    return pointerIndex
}

func lomutoQuickSort(_ a: inout [Int], low: Int, high: Int) {
    if low < high {
        let pointer = partitioningLomuto(&a, low: low, high: high)
        lomutoQuickSort(&a, low: low, high: pointer - 1)
        lomutoQuickSort(&a, low: pointer + 1, high: high)
    }
}

lomutoQuickSort(&array, low: 0, high: array.count - 1)
print(array)

