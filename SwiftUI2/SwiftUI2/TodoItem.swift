//
//  TodoItem.swift
//  SwiftUI2
//
//  Created by Leo on 10/03/21.
//

import Foundation

struct TodoItem: Codable, Identifiable {
    var id = UUID()
    let todoDesc: String
}
