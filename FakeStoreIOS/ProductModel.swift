//
//  ProductModel.swift
//  FakeStoreIOS
//
//  Created by Farhandika on 25/03/22.
//

import Foundation

struct Product: Codable {
    let id: Int
    let title: String
    let price: Double
    let productDescription: String
    let category: String
    let image: String
    let rating: Rating

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case productDescription = "description"
        case category, image, rating
    }
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}
