//
//  QuizView.swift
//  quizMania
//
//  Created by Auston Youngblood on 2/27/23.
//

import SwiftUI

struct QuizView: View {
    @State private var isRotating = 0.0
    
    
    
    var body: some View {
        //cool rotating gradient bg
        ZStack {
            Circle()
                .fill(
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                )
                .frame(width: 2000, height: 2000)
                .ignoresSafeArea()
                .rotationEffect(.degrees(isRotating))
                .onAppear {
                    withAnimation(.linear(duration: 1)
                        .speed(0.1).repeatForever(autoreverses: false)) {
                            isRotating = 360.0
                        }
                }
                .offset(x: -300, y: -300)
            
            VStack {
                Text("This will be where the title lives")
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
