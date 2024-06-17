//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by David Nwachukwu on 17/06/2024.
//

import SwiftUI

struct ContentView: View {
	let choices = ["Rock", "Paper", "Scissors"]
	@State private var computerChoice = ""
	
	@State private var playing = false
	@State private var playerChoice = ""
	@State private var roundState = ""
	
	let combos = [
		"Rock": "Scissors",
		"Paper": "Rock",
		"Scissors": "Paper"
	]
	
	var body: some View {
		ZStack {
			LinearGradient(stops: [
				.init(color: .secondary, location: 0.5),
				.init(color: .white, location: 0.5)
			], startPoint: .top, endPoint: .bottom)
			.ignoresSafeArea()
			
			if playerChoice != "" {
				Image(computerChoice)
					.resizable()
					.frame(width: 200, height: 200)
					.offset(y: -200)
			} else {
				Text("?")
					.font(.largeTitle)
					.bold()
					.frame(width: 186, height: 186)
					.overlay(
						RoundedRectangle(cornerRadius: 16)
							.stroke(Color(red: 0.16, green: 0.16, blue: 0.16), lineWidth: 6)
					)
					.offset(y: -200)
			}
			
			
			VStack {
				Spacer()
				
				VStack(spacing: 55) {
					HStack {
						ForEach(choices, id: \.self) { choice in
							Button(action: {chooseMove(choice)}) {
								VStack {
									Image(choice)
										.resizable()
										.frame(width: 100, height: 100)
										.shadow(radius: 5)
										.offset(y: playerChoice == choice ? -50 : 0)
									Text(choice)
										.foregroundStyle(.black)
										.bold()
										.textCase(.uppercase)
										.font(.caption)
										.offset(y: playerChoice == choice ? -50 : 0)
								}
							}
						}
					}
					
					
					ZStack {
						VStack(spacing: 30) {
							Text(roundState)
								.bold()
								.textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
								.opacity(roundState != "" ? 1.0 : 0.0)
								.foregroundStyle(.black)
							
							Button {
								withAnimation(.easeInOut(duration: 0.3)) {
									playerChoice = ""
									computerChoice = choices[Int.random(in: 0...2)]
									roundState = ""
									playing.toggle()
								}
							} label: {
								Text(roundState == "" ? "Play" : "Play Again")
							}
							.padding()
							.background(.regularMaterial)
							.clipShape(RoundedRectangle(cornerRadius: 20))
							.foregroundStyle(.primary)
							
						}
						.opacity(!playing ? 1.0 : 0.0)
						.offset(y: !playing ? 0 : 100)
						
						Text("Make your move")
							.padding()
							.opacity(playing ? 1.0 : 0.0)
							.bold()
							.textCase(.uppercase)
							.foregroundStyle(.black)
					}
					
				}
			}
		}
	}
	
	func chooseMove(_ choice: String) {
		if !playing {
			return
		}
		
		playerChoice = choice
		
		if playerChoice == computerChoice {
			roundState = "DRAW!"
		} else if combos[playerChoice] == computerChoice {
			roundState = "You Win!"
		} else {
			roundState = "You Lose!"
		}
		
		playing.toggle()
	}
}

#Preview {
	ContentView()
}
