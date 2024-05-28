//
//  ContentView.swift
//  HabitTracker
//
//  Created by Álvaro Gascón on 27/5/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var data = Habits()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data.habits) { habit in
                    NavigationLink {
                        HabitView(data: data, habit: habit)
                        
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(habit.title)
                                    .font(.headline)
                                Text(habit.description)
                            }
                            
                            Spacer()
                            
                            Text("\(habit.count)")
                                .font(.title)
                                .padding(5)
                                .frame(minWidth: 50)
                                .background(color(for: habit))
                                .foregroundStyle(.white)
                                .clipShape(Capsule())
                        }
                    }
                }
                .onDelete(perform: onDelete)
            }
            .navigationTitle("Habits")
            .toolbar {
                NavigationLink {
                    AddView(data: data)
                } label: {
                    Label("Add Habit", systemImage: "plus")
                        
                }
            }
//            .toolbar {
//                EditButton()
//            }
        }
    }
    
    func onDelete(at offsets: IndexSet) {
        data.habits.remove(atOffsets: offsets)
    }
    
    func color(for habit: HabitItem) -> Color {
        if habit.count < 3 {
            .red
        } else if habit.count < 10 {
            .orange
        } else if habit.count < 20{
            .green
        } else if habit.count < 50 {
            .blue
        } else {
            .indigo
        }
    }
}

#Preview {
    ContentView()
}
