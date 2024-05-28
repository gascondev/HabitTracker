//
//  AddHabit.swift
//  HabitTracker
//
//  Created by Álvaro Gascón on 27/5/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    var data: Habits
    
    @State private var title = ""
    @State private var description = ""
    
    
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
            }
            
            Section {
                TextField("Description", text: $description)
            }
        }
        .navigationTitle("Add new Habit")
        .toolbar {
            Button("Save") {
                let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
                guard trimmedTitle.isEmpty == false else { return }

                let habit = HabitItem(title: title, description: description, count: 0)
                data.habits.append(habit)
                dismiss()
            }
        }
    }
}

#Preview {
    AddView(data: Habits())
}
