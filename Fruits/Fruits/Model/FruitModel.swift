//
//  FruitModel.swift
//  Fruits
//
//  Created by Ofer tzafrir on 17/02/2022.
//

import Foundation

struct Fruit : Decodable {
    let name: String
    let image: String
    let description: String
    let price: Int
}

struct Fruits : Decodable {
    let fruits: [Fruit]
}
