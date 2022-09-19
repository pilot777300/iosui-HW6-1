//
//  PhotosCollectionViewCell.swift
//  NavigTest
//
//  Created by Mac on 16.09.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    lazy var backView: UILabel = {
        let authorlbl = UILabel()
        authorlbl.translatesAutoresizingMaskIntoConstraints = false
        authorlbl.backgroundColor = .systemGray5
        authorlbl.contentMode = .scaleToFill
        authorlbl.layer.cornerRadius = 12
      return authorlbl
    }()
    
    
    lazy var image: UIImageView = {
       let postImg = UIImageView()
       postImg.translatesAutoresizingMaskIntoConstraints = false
       postImg.contentMode = .scaleToFill
       postImg.clipsToBounds = true
       postImg.backgroundColor = .clear
        postImg.layer.cornerRadius = 12
       return postImg
   }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
      
        addSubview(backView)
        backView.addSubview(image)
        
         backView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        backView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        image.leftAnchor.constraint(equalTo: backView.leftAnchor).isActive = true
        image.topAnchor.constraint(equalTo: backView.topAnchor).isActive = true
        image.heightAnchor.constraint(equalTo: backView.heightAnchor).isActive = true
        image.widthAnchor.constraint(equalTo: backView.widthAnchor).isActive = true
    
    }

}
