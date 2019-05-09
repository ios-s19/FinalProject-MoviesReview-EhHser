//
//  Movie.swift
//  EMovies
//
//  Created by Eh Hser on 4/12/19.
//  Copyright © 2019 Acer. All rights reserved.
//

struct Movie: Codable {
    struct Results: Codable {
        let vote_count: Int?
        let id: Int?
        let video: Bool?
        let vote_average: Double?
        let title: String
        let popularity: Double?
        let poster_path: String?
        let original_language: String?
        let original_title: String?
        let genre_ids: [Int]?
        let backdrop_path: String?
        let adult: Bool?
        let overview: String?
        let release_date: String?
    }
    let results: [Results]
}
