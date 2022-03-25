//
//  NetworkManager.swift
//  FakeStoreIOS
//
//  Created by Farhandika on 25/03/22.
//

import Foundation

class NetworkManager {
    //MARK: - Get Product from Network
    public func getProducts(
        completion: @escaping (Result<[Product], Error>) -> ()
    )  {
        let url = URL(string: "https://fakestoreapi.com/products")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _,error in
            if let data = data {
                /// do exception handler so that our app does not crash
                do {
                    let result = try JSONDecoder().decode([Product].self, from: data)
                    completion(.success(result))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
}
