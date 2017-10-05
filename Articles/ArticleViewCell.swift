//
//  ArticleViewCell.swift
//  Articles
//
//  Created by Research on 10/5/17.
//  Copyright © 2017 HealthDiary. All rights reserved.
//

import UIKit

class ArticleViewCell: UICollectionViewCell {
    var article: Article?{
        didSet{
        articleTitle.text = article?.title
        articleDescription.text = article?.description
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let articleTitle:UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let articleDescription:UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    func setUpView(){
        addSubview(articleTitle)
        articleTitle.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        articleTitle.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        articleTitle.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        articleTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(articleDescription)
        articleDescription.topAnchor.constraint(equalTo: articleTitle.bottomAnchor).isActive = true
        articleDescription.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        articleDescription.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        articleDescription.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
}
