//
//  ContentView.swift
//  SportsScore
//
//  Created by Phil Chan on 6/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentScore = 0
    
    var body: some View {
        VStack {
           Text("Score Tracker")
                .font(.largeTitle)
                .padding()
            Text("Current Score: \(currentScore)")
                .font(.title)
                .padding()
            Button(action : {
                updateScore()
            }) {
                Text("Update Score")
                    .font(.headline)
                    .padding()
            }
        }
        .padding()
        
    }
    
    private func updateScore() {
        currentScore += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
