//
//  DetailsScreenViewController.swift
//  Fruits
//
//  Created by Ofer tzafrir on 18/02/2022.
//

import UIKit

class DetailsScreen: UIViewController {
    
    
    var fruit: Fruit?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descreption: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (fruit != nil) {
            imageView.sd_setImage(with: URL(string: fruit!.image))
            name.text = fruit?.name
            descreption.text = fruit?.description
            price.text = "\(fruit!.price) $"
        }
    }
}
