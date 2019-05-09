//
//  DetailViewController.swift
//  EMovies
//
//  Created by Eh Hser on 4/12/19.
//  Copyright © 2019 Acer. All rights reserved.
//

import UIKit
import AFNetworking


class DetailViewController: UIViewController {

    
    //@IBOutlet weak var detailPoster: UIImageView!
    //@IBOutlet weak var detailPosterView: UIImageView!
    //@IBOutlet weak var titleDetailView: UILabel!
    
    @IBOutlet weak var ratingView: UILabel!
    @IBOutlet weak var titleDetailView: UITextView!
    @IBOutlet weak var detailPosterView: UIImageView!
    @IBOutlet weak var releaseDateView: UILabel!
    @IBOutlet weak var descriptionView: UITextView!
    //var getPoster = UIImage()
    
    var imageUrl = NSURL(string: "")
    var movieTitleDetail = ""
    var releaseDateDetail = ""
    var descriptionDetail = ""
    var ratingDetail = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //detailPoster.image = getPoster
        
        detailPosterView.setImageWith(imageUrl! as URL)
        titleDetailView.text = movieTitleDetail
        releaseDateView.text = releaseDateDetail
        descriptionView.text = descriptionDetail
        ratingView.text = ratingDetail
        //descriptionView.text = movieTitleDetail

        // Do any additional setup after loading the view.
    }
    

}
