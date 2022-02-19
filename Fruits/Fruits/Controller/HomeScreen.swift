//
//  ViewController.swift
//  Fruits
//
//  Created by Ofer tzafrir on 17/02/2022.
//

import UIKit
import SDWebImage

class HomeScreen: UIViewController {
    
    var fruitsManager = FruitsManager()
    var fruitsList = [Fruit]()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitsManager.delegate = self
        fruitsManager.fetchfruitsList()
    }
}

extension HomeScreen: FruitsManagerDelegate{
    
    func didFetchedFruitsList(_ fruitsList: [Fruit]) {
        self.fruitsList = fruitsList
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

extension HomeScreen: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fruitsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSceenCell", for: indexPath) as! FruitsCell
        cell.title.text = fruitsList[indexPath.section].name
        cell.itemImage.sd_setImage(with: URL(string: fruitsList[indexPath.section].image))
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailsScreen = storyboard?.instantiateViewController(withIdentifier: "DetailsScreen") as? DetailsScreen{
            detailsScreen.fruit = fruitsList[indexPath.section]
            navigationController?.pushViewController(detailsScreen, animated: true)
        }
    }
}


