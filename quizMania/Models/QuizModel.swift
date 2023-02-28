//
//  QuizModel.swift
//  quizMania
//
//  Created by Auston Youngblood on 2/27/23.
//

import Foundation

struct Quiz: Codable, Identifiable {
    
    var id: Int
    var topic: String
    var icon: String
    var highScore: Int
    var questions: [Question]
}

//quiz question model
struct Question: Codable {
    var id: Int
    var question: String
    //answers[0] will always be the correct answer. Just to make things easy.
    var answers: [String]
}
