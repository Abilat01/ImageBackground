//
//  RockViewController.swift
//  ImageBackground
//
//  Created by Danya on 11.07.2021.
//

import UIKit

class RockViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchImageRock()
    }
    
    //вариант №2
    func fetchImageRock() {
        imageURL = URL(string: "https://s1.1zoom.ru/b5050/995/363541-svetik_1920x1200.jpg")
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            if let data = try? Data(contentsOf: self.imageURL!) {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
    }
}
