//
//  ProfileViewController.swift
//  NavigTest
//
//  Created by Mac on 08.07.2022.
//

import UIKit

struct Post {
    var author: String?
    var description: String?
    var image: String?
    var lokes: Int?
    var views: Int?
   
}


class ProfileViewController: UIViewController {
   
    lazy var topView: ProfileHeaderView = {
        let tv = ProfileHeaderView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    var tableView = UITableView()
    var postData = [Post]()
  
      
    override func viewDidLoad() {
        super.viewDidLoad()
   
        postData.append(Post(author: "Elon Musk", description: "Ну классный самолет. Ветерок на посадке только слишком сильно дунул", image: "A330-300.jpg", lokes: 12, views: 33))
        postData.append(Post(author: "Юрий Шевчук", description: "Всюду черти! надави брат, на педаль.", image: "Brothers.tiff", lokes: 50, views: 55))
        postData.append(Post(author: "Cергей Крокодилов", description: "Как тебе такое, Илон Маск?", image: "Boston.jpg", lokes: 132, views: 4567))
        postData.append(Post(author: "Donald Trump", description: "Wow!!! Wonderfull Kukuruznik", image: "Aeroplan.jpeg", lokes: 243, views: 427))
        
  
        setTableView()
        setConstraints()
       
    }

        func setTableView() {
            tableView.frame = self.view.frame
            tableView.delegate = self
            tableView.dataSource = self
            self.view.addSubview(tableView)
            tableView.separatorColor = UIColor.black
            tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
            tableView.backgroundColor = .systemGray5
            tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "Cell")
            tableView.translatesAutoresizingMaskIntoConstraints = false
        }
        func setConstraints() {
            let safeArea = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([

               tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
               tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
               tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
                tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
            
            ])
        }
}
    
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard  let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PostTableViewCell
        else {fatalError()}
        
        let thePost = postData[indexPath.row]
        cell.views.text = "Views:\(thePost.views ?? 0)"
        cell.likes.text = "Likes:\(thePost.lokes ?? 0)"
        cell.postAuthor.text = thePost.author
        cell.postTxt.text = thePost.description
        cell.postImage.image = UIImage(named: "\(thePost.image ?? "No Data")")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let view = ProfileHeaderView()
        view.backgroundColor = .systemGray5
        let q = PhotosTableViewCell()
        let editButton = UIButton(frame: CGRect(x:0, y:190, width:400, height:150))
        editButton.addTarget(self, action: #selector(showGallery), for: UIControl.Event.touchUpInside)
        view.addSubview(q)
        view.addSubview(editButton)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        return 320
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    @objc func showGallery(sender: UIButton) {
       let vc = PhotosViewController()
          navigationController?.pushViewController(vc, animated: true)
        
    }
}

    

