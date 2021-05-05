//
//  TicTacViewModel.swift
//  TicTacToe
//
//  Created by Mustafo on 29/04/21.
//

import Foundation

class TicTacViewModel : ObservableObject {
    @Published
    private(set) var ticTacModel = TicTactModel()
    var isOnX : Bool {
        ticTacModel.isOnX
    }
    var gameOver : Bool {
        ticTacModel.gameOver
    }
    var alertMsg : String{
        ticTacModel.alertMsg
    }
    
    func choose(index : Int) {
        ticTacModel.choose(index: index)
    }
    func reset(){
        ticTacModel = TicTactModel()
    }
    var moves : Array<String> {
        ticTacModel.moves
    }
    
}
