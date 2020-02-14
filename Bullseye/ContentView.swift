//
//  ContentView.swift
//  Bullseye
//
//  Created by Vivek Selvaraj on 12/02/20.
//  Copyright © 2020 Vivek Selvaraj. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    var body: some View {
        VStack {
            
            //Target Row
            Spacer()
            HStack {
                Text("Target ")
                    .font(.largeTitle)
                Text("\(target)")
                    .font(.largeTitle)
            }
            
            //Slider Row
            Spacer()
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }.padding()
            
            
            //Hit It Button
            Button(action: {
                self.alertIsVisible = true
                self.score += self.computeScore()
            }) {
                Text("Hit It!")
            }
            .alert(isPresented: $alertIsVisible){ () ->
                Alert in
                return Alert(title: Text("You scored \(computeScore())"), message: Text("The slider value was \(Int(sliderValue.rounded()))"), dismissButton: Alert.Button.default(Text("Next Round")) {
                    self.target = Int.random(in: 1...100)
                    self.round += 1
                })
            }
            
            //Third Row
            Spacer()
            HStack {
                Button(action: {
                    self.startOver()
                }) {
                    Text("Start Over")
                }
                Spacer()
                Text("Score ")
                    .font(.title)
                    
                Text("\(score)")
                    .font(.title)
                Spacer()
                Text("Round ")
                    .font(.title)
                Text("\(round)")
                    .font(.title)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Info")
                }
            }
            .padding()
        }
    }
    
    func computeScore() -> Int {
        let computedScore = 100 - abs(target - Int(sliderValue.rounded()))
        return computedScore
    }
    
    func startOver() {
        score = 0
        round = 1
        sliderValue = 50.0
        target = Int.random(in: 1...100)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}

