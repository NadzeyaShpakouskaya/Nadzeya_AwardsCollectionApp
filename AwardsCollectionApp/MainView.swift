//
//  MainView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.06.2021.
//

import SwiftUI

struct MainView: View {
    @State private var showAward = false
    @State private var awardAnimated = false
    
    var body: some View {
        
        VStack {
            Button(action: buttonAction) {
                HStack {
                    Text(showAward ? "Hide Award" : "Show Award")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .scaleEffect(showAward ? 2 : 1)
                        .rotationEffect(.degrees(showAward ? 0 : 180))
                }
            }
            
            Spacer()
            if showAward {
                Text("Tap on clock to run the animation")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.indigo)
                    .multilineTextAlignment(.center)
                    .transition(.clockRingTransition)
                
                withAnimation {
                    ClockView(color: .gray)
                        .frame(width: 250, height: 250)
                        .transition(.clockRingTransition)
                        .offset(x: awardAnimated ? 5 : 0, y:  awardAnimated ? 5 : 0)
                        .animation(
                            Animation
                                .default
                                .repeatCount(7, autoreverses: true)
                                .speed(4),
                            value: awardAnimated
                        )
                        .onTapGesture { awardAnimated.toggle()}
                }
            }
            Spacer()
        }
        .font(.headline)
        .padding()
    }
    
    private func buttonAction() {
        withAnimation {
            showAward.toggle()
        }
    }
}

extension AnyTransition {
    static var transition: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .scale)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    static var clockRingTransition: AnyTransition {
        let insertion = AnyTransition.move(edge: .top)
            .combined(with: .scale)
            .animation(Animation.easeOut)
        
        let removal = AnyTransition.move(edge: .top)
            .combined(with: .scale)
            .animation(Animation.default.delay(0.35))
        
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
