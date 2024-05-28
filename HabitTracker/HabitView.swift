//
//  HabitView.swift
//  HabitTracker
//
//  Created by Álvaro Gascón on 27/5/24.
//

import SwiftUI

struct HabitView: View {
    var data: Habits
    var habit: HabitItem

    var body: some View {
        NavigationStack {
            VStack {
                Text(habit.description)
                    .padding(.top, 20)
                    .font(.title2)
                    .multilineTextAlignment(.leading)
                    
                
                Text("Completed: \(habit.count) times")
                .padding(.top, 20)
                .padding(.bottom, 20)
                .font(.title3)
                
                Button("+1 to my goal") {
                    var newHabit = habit
                    newHabit.count += 1
                    
                    if let index = data.habits.firstIndex(of: habit) {
                        data.habits[index] = newHabit
                    }
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .font(.title3)
                .cornerRadius(25)
                
                Spacer()
                Spacer()
            }
            .navigationTitle(habit.title)
        }
    }
}


#Preview {
    let title = "Habit"
    let description = "Description"
    return HabitView(data: Habits(), habit: HabitItem(title: title, description: description))
}
