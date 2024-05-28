//
//  HabitItem.swift
//  HabitTracker
//
//  Created by Álvaro Gascón on 27/5/24.
//

import Foundation


struct HabitItem: Equatable, Codable, Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var count = 0
}

@Observable
class Habits {
    var habits = [HabitItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let saved = UserDefaults.standard.data(forKey: "Habits") {
            if let decoded = try? JSONDecoder().decode([HabitItem].self, from: saved) {
                habits = decoded
                return
            }
        }
        habits = []
    }
}
