//
//  ViewController.swift
//  CollectionViewExpand
//
//  Created by Iphone XR on 29/11/22.
//

import UIKit


class ViewController: UIViewController {

    private var collectionView:UICollectionView?

    var items = [String]()
    var selectedIndex : Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.items = ["A","B","C","D","E","F","G"]
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        
       collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
      
       guard let collectionView = collectionView else{
            return
        }
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        }
    }
extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)as! CollectionViewCell
        
        cell.nameLabel.text = self.items[indexPath.row]
       
        return cell
    }

}

extension ViewController: UICollectionViewDelegate{

}
extension ViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if selectedIndex  ==  indexPath.row {
                    return CGSize(width: self.view.bounds.width - 20, height: 120)
        } else {
                    return CGSize(width: self.view.bounds.width - 20, height: 300.0)
                }
       
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        //For reload the selected cell
        self.collectionView?.reloadItems(at: [indexPath])
        }
    }

class CollectionViewCell: UICollectionViewCell {

  static let identifier = "CollectionViewCell"
    
    var nameLabel:UILabel!
   
   override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .gray

        nameLabel = UILabel()
        nameLabel.textColor = UIColor.black
        nameLabel.font = UIFont.systemFont(ofSize: 17)
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: nameLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: nameLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true

        }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

