//
//  TicTacModel.swift
//  TicTacToe
//
//  Created by Mustafo on 29/04/21.
//

import Foundation

struct TicTactModel {
    var moves = Array(repeating: "", count: 9)
    var isOnX = false
    var gameOver = false
    var alertMsg = ""
    
    
    mutating func choose(index:Int) {
        if moves[index] == ""{
            moves[index] = isOnX ? "X" : "O"
            isOnX.toggle()
        }
        checkWinner()
    }
    mutating func checkWinner() {
        if chekGame(player: "X"){
           alertMsg = "X won"
            gameOver.toggle()
        }else if chekGame(player: "O") {
            alertMsg = "Y won"
            gameOver.toggle()
        } else {
            let isNotEnded = moves.contains { value in
                return value == ""
            }
            if !isNotEnded {
                gameOver.toggle()
                alertMsg = "Game Over!Tied!!!"
            }
        }
    }
    func chekGame(player: String)-> Bool{
        //Mark : -Checking in horizontal
        for i in stride(from: 0, to: 9, by: 3){
            if moves[i] == player && moves[i+1] == player && moves[i+2] == player {
                return true
            }
        }
        for i in stride(from: 0, to: 3,by: 1){
            if moves[i] == player && moves[i+3] == player && moves[i+6] == player {
                return true
            }
        }
        if moves[0] == player && moves[4] == player && moves[8] == player {
            return true
        }
        if moves[2] == player && moves[4] == player && moves[6] == player {
            return true
        }
        return false
    }

}
