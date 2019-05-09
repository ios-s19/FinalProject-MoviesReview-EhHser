////
////  SwipingController.swift
////  EMovies
////
////  Created by Eh Hser on 4/29/19.
////  Copyright © 2019 Acer. All rights reserved.
////
//
//import UIKit
//
//class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        collectionView?.backgroundColor = .green
//        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cell")
//
//        collectionView?.isPagingEnabled = true
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 4
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        // cell.backgroundColor = .red
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: view.frame.height)
//    }
//
//}
