//
//  PhotosViewController.swift
//  NavigTest
//
//  Created by Mac on 15.09.2022.
//

import UIKit



class PhotosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
 
    
    lazy var cv: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let width = UIScreen.main.bounds.width / 5
        flowLayout.itemSize = CGSize(width: width, height: 80)
        flowLayout.minimumLineSpacing = 7
        flowLayout.sectionInset = UIEdgeInsets(top: 95, left: 12, bottom: 12, right: 12)
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "HeaderCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.systemGray5
        return collectionView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        self.view.addSubview(cv)
    }
    
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
        let navItem = UINavigationItem(title: "Photos")
        navBar.backgroundColor = .systemGray5
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
       {
           return 5
       }

       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
       {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath)  as! PhotosCollectionViewCell

           cell.backgroundColor = UIColor.green
           let data = picturesAPI[indexPath.row]
           cell.image.image = UIImage(named: "\(data.picture ?? "NO DATA")")
           return cell
       }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {
           return CGSize(width: 100, height: 100)
       }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
       {
           return UIEdgeInsets(top: 25, left: 25, bottom: 5, right: 5)
       }
    
    func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
        cv.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50),
        cv.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 15),
        cv.widthAnchor.constraint(equalToConstant: 387),
        cv.heightAnchor.constraint(equalToConstant: 128)
        
        ])
    }
}
