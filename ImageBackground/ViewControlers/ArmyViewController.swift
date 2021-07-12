//
//  ArmyViewController.swift
//  ImageBackground
//
//  Created by Danya on 11.07.2021.
//

import UIKit

class ArmyViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        
        get {
            return imageView.image
        }
        set {
            activityIndicator.startAnimating()
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchImageArmy()
        
    }
    //вариант 1
    fileprivate func fetchImageArmy() {
        imageURL = URL(string: "https://avatars.mds.yandex.net/get-zen_doc/1931664/pub_5d8466235ba2b500ae107411_5d847199fbe6e700ae44af34/scale_1200")
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
                    
        }
        
    }
    
    
}
