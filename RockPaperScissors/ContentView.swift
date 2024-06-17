//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by David Nwachukwu on 17/06/2024.
//

import SwiftUI

struct ContentView: View {
	let choices = ["Rock", "Paper", "Scissors"]
	@State private var choice = ""
	
    var body: some View {
		VStack {
			Spacer()
			Spacer()
			HStack {
				ForEach (choices, id: \.self) { choice in
					Button {
						// something
						print(choice)
					} label: {
						VStack {
							Image(choice)
								.resizable()
								.frame(width: 100, height: 100)
								.shadow(radius: 5)
							Text(choice)
								.foregroundStyle(.black)
								.bold()
								.textCase(.uppercase)
								.font(.caption)
						}
					}
				}
			}
			Spacer()
		}
    }
}

#Preview {
    ContentView()
}
