//
//  MagicSquares.swift
//
//  Created by Ketia Gaelle Kaze
//  Created on 2022-04-22
//  Version 1.0
//  Copyright (c) 2022 IMH. All rights reserved.
//
//  MagicSquares program displays the
// magic squares for a 3x3 square.
import Foundation

// The middle left index.
let THREE = 3
// The center index.
let FOUR = 4
// The middle right index.
let FIVE = 5
// The lower left index.
let SIX = 6
// The lower center index.
let SEVEN = 7
// The lower right index.
let EIGHT = 8
// The maximum number for magicNumbers.
let NINE = 9
// The sum for each row, column and diagonals
let MAGICNUM = 15

// Create default magic square.
var magicSquare: [Int] = [1, 2, THREE, FOUR, FIVE,
     SIX, SEVEN, EIGHT, NINE]
// Create an array that is similar to the default array
// but populated with zeros.
var extraArray: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]

// Creating function to create new magic squares.
func genSquare(square: [Int], currentSquare: [Int], index: Int) {
    var counter = 0
    var newCurrentSquare = currentSquare
    var newSquare = square

    // Create new squares
    for _ in square {
        if newCurrentSquare[counter] == 0 {
            newCurrentSquare[counter] = 1
            newSquare[index] = counter + 1

            if index < square.count - 1 {
                // Completes the new array of squares
                genSquare(square: newSquare, currentSquare: newCurrentSquare, index: index + 1)
            } else {
                if isMagic(preSquare: newSquare) {
                    printMagicSquare(outputSquare: newSquare)
                }
            }
            newCurrentSquare[counter] = 0
        }
        counter += 1
    }
}

// Creating a function that tells if the array is a magic square or not.
func isMagic(preSquare: [Int]) -> Bool {
    // returns true or false if the array is a magic square or not
    // check if the sum is 15
    let row1 = preSquare[0] + preSquare[1] + preSquare[2]
    let row2 = preSquare[THREE] + preSquare[FOUR]
             + preSquare[FIVE]
    let row3 = preSquare[SIX] + preSquare[SEVEN]
             + preSquare[EIGHT]
    let col1 = preSquare[0] + preSquare[THREE]
             + preSquare[SIX]
    let col2 = preSquare[1] + preSquare[FOUR]
             + preSquare[SEVEN]
    let col3 = preSquare[2] + preSquare[FIVE]
             + preSquare[EIGHT]
    let diag1 = preSquare[0] + preSquare[FOUR]
             + preSquare[EIGHT]
    let diag2 = preSquare[2] + preSquare[FOUR]
             + preSquare[SIX]

    // Returns true or false
    return row1 == MAGICNUM && row2 == MAGICNUM
             && row3 == MAGICNUM && col1 == MAGICNUM
             && col2 == MAGICNUM && col3 == MAGICNUM
             && diag1 == MAGICNUM && diag2 == MAGICNUM
}

// Creating a function that prints the array in
// the format of a magic square.
func printMagicSquare(outputSquare: [Int]) {
    // Prints inputted array in a magic square format
    print("\n*****")
    var counter = 0

    for num in outputSquare {
        // Creates new lines for the output
        if counter == THREE || counter == SIX {
            print()
            print("\(num) ", terminator: "")
        } else {
            print("\(num) ", terminator: "")
        }
        counter += 1
    }

    print("\n*****")
}

print()
print("All Possible Magic Squares (3x3):\n")
genSquare(square: magicSquare, currentSquare: extraArray, index: 0)
