//
//  ContentView.swift
//  SwiftUI2
//
//  Created by Leo on 10/03/21.
//

import SwiftUI

struct ContentView: View {

    @State private var newTodo = ""
    @State private var allTodos: [TodoItem] = [
        TodoItem(todoDesc: "1"),
        TodoItem(todoDesc: "2"),
        TodoItem(todoDesc: "3")
    ]

    var body: some View {
        NavigationView{
            VStack {
                HStack {
                    TextField("Add todo...", text: $newTodo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: {
                        guard self.validateInput().0 else {
                            print("Error: \(self.validateInput().1)")
                            return
                        }
                        self.allTodos.append(TodoItem(todoDesc: self.newTodo))
                        self.newTodo = ""
                    }, label: {
                        Text("Submit")
                    })
                    .padding(.leading,16)
                }.padding()
                List {
                    ForEach(allTodos) { item in
                        Text(item.todoDesc)
                    }
                }
            }
            .navigationTitle("Todos")
        }
    }

    func validateInput() -> (Bool, String) {
        let text = self.newTodo
        if text.isEmpty {
            return (false, "Text shouldn't be empty")
        }
        if self.allTodos.contains(where: { $0.todoDesc == text}) {
            return (false, "This kind of text already submitted, please try another different text.")
        }
        return (true, "")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
