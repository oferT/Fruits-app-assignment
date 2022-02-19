//
//  FruitsManager.swift
//  Fruits
//
//  Created by Ofer tzafrir on 17/02/2022.
//

import Foundation

protocol FruitsManagerDelegate {
    func didFetchedFruitsList(_ fruitsList: [Fruit])
    func didFailWithError(_ error: Error)
}


struct FruitsManager {
    
    private let urlString = "https://dev-api.com/fruitsBT/getFruits"
    var delegate: FruitsManagerDelegate?
    
    func fetchfruitsList(){
        performRequest(with: urlString)
    }
    
    private func performRequest(with urlString: String)  {
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(safeData)
                }
            }
            task.resume()
        }
    }
    
    private func parseJSON(_ data: Data)  {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(Fruits.self, from: data)
            var fruitsList = [Fruit]()
            decodedData.fruits.forEach { fruit in
                fruitsList.append(Fruit(name: fruit.name, image: fruit.image, description: fruit.description, price: fruit.price))
            }
            delegate?.didFetchedFruitsList(fruitsList)
        }catch{
            delegate?.didFailWithError(error)
        }
    }
}


