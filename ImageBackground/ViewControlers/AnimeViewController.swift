//
//  AnimeViewController.swift
//  ImageBackground
//
//  Created by Danya on 11.07.2021.
//

import UIKit

class AnimeViewController: UIViewController {

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

        fetchImageAnime()
    }
    
    func fetchImageAnime() {
        
        imageURL = URL(string: "https://www.meme-arsenal.com/memes/cd64c6fdb67600778d35b5a56f0cd6c7.jpg")
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        }
    }
  
}
