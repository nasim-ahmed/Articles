//
//  ViewController.swift
//  Articles
//
//  Created by Research on 10/5/17.
//  Copyright © 2017 HealthDiary. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let cellId = "cellId"
    
    var articles:[Article]?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        
        navigationItem.title = "Rest API"
        
        collectionView?.register(ArticleViewCell.self, forCellWithReuseIdentifier: cellId)
        
        
        restAPICall()
        
    }
    func restAPICall(){
        let urlString = "https://swift.mrgott.pro/blog.json"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared
            .dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error?.localizedDescription ?? "")
                }
                
                guard let data = data else {return}
                do{
                    let articleData = try JSONDecoder().decode([Article].self, from: data)
                   
                    
                    DispatchQueue.main.async{
                        self.articles = articleData
                        self.collectionView?.reloadData()
                    }
                }catch let jsonError{
                    print(jsonError)
                }
                
        }.resume()

    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ArticleViewCell
    
        cell.article = articles?[indexPath.item]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: 100)
    }



}

