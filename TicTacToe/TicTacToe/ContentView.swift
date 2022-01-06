//
//  ContentView.swift
//  TicTacToe
//
//  Created by Mustafo on 28/04/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var ticTacViewModel = TicTacViewModel()
    @State private var gameOver = false
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Text("\(ticTacViewModel.isOnX ? "X" : "O") goes")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
                                        .opacity(0.3))
                        .cornerRadius(8)
                        
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 15), count: 3), content: {
                        ForEach(0..<9,id:\.self){ index in
                            ZStack {
                                Color.blue
                                Color.white
                                    .opacity(ticTacViewModel.moves[index] == "" ? 1 : 0)
                                Text(ticTacViewModel.moves[index]).font(.largeTitle)
                                    .bold()
                                
                            }
                            .cornerRadius(8)
                            .frame(width: getWidth(), height: getWidth())
                            .rotation3DEffect(
                                Angle(degrees: ticTacViewModel.moves[index] == "" ? 180 : 0),
                                axis: (x: 0.0, y: 1.0, z: 0.0),
                                anchor: .center,
                                anchorZ: 0.0,
                                perspective: 0.0
                            )
//                            .animation(.easeIn)
                            .onTapGesture {
                                withAnimation(.easeIn){
                                ticTacViewModel.choose(index : index)
                                gameOver = ticTacViewModel.gameOver
                                    
                                }
                            }
                        }
                    })
                    .padding(15)
                    
                    Button(action: {
                        withAnimation(.easeIn) {
                            ticTacViewModel.reset()
                        }
                    }, label: {
                        Text("Reset")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .background(Color.red.opacity(0.5))
                            .cornerRadius(8)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.1), radius: -5, x: -5, y: 5)
                    })
                    .padding(.top,40)
                }
                
            }
            .alert(isPresented: $gameOver, content: {
                Alert(title: Text("Game Over"), message: Text(ticTacViewModel.alertMsg), dismissButton: .default(Text("New Game!"), action: {
                    ticTacViewModel.reset()
                }))
            })
            .navigationTitle("Tic Tac Toe")
        }
    }
    
    func getWidth()-> CGFloat{
        let width = UIScreen.main.bounds.width - (30 + 30)
        return width / 3
    }
           
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
