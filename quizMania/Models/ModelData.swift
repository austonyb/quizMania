//
//  ModelData.swift
//  quizMania
//
//  Created by Auston Youngblood on 2/27/23.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var quizzes: [Quiz] = load("Quizzes.json")
    
    func updateData(newData: [Quiz]) {
            self.quizzes = newData
            save("Quizzes.json", quizzes)
        }
}

var quizzes: [Quiz] = load("Quizzes.json")


func load<T: Decodable>(_ filename: String) -> T {
   
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

func save<T: Encodable>(_ filename: String, _ data: T) {
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    do {
        let encoder = JSONEncoder()
        let jsonData = try encoder.encode(data)
        try jsonData.write(to: file)
    } catch {
        fatalError("Couldn't write \(filename) to main bundle:\n\(error)")
    }
}

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

