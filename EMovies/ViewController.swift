//
//  ViewController.swift
//  EMovies
//
//  Created by Eh Hser on 4/12/19.
//  Copyright © 2019 Acer. All rights reserved.
//

import UIKit
import AFNetworking

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var allMovies = [Movie.Results]()
    var searchAllMovies = [Movie.Results]()     // filter array
    var isSearching = false
    //var listOfPoster = [UIImage]()
    
    let cellReuseIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        fetch()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return self.searchAllMovies.count
        } else {
         return self.allMovies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MovieCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! MovieCell
        
        if isSearching {
            cell.title.text = self.searchAllMovies[indexPath.row].title
            cell.myOverview.text = self.searchAllMovies[indexPath.row].overview
            
            let movie = searchAllMovies[indexPath.row]
            let posterPath = movie.poster_path as! String
            //let baseUrl = "http://image.tmdb.org/t/p/w500"
            let imageUrl = NSURL(string: Config.apiKey + posterPath)
            
            do {
                cell.poster.setImageWith(imageUrl! as URL)
            } catch let err {
                print("Error: ")
            }
        } else {
            cell.title.text = self.allMovies[indexPath.row].title
            cell.myOverview.text = self.allMovies[indexPath.row].overview

            
            
            let movie = allMovies[indexPath.row]
            let posterPath = movie.poster_path as! String
            //let baseUrl = "http://image.tmdb.org/t/p/w500"
            let imageUrl = NSURL(string: Config.apiKey + posterPath)
            
            do {
                cell.poster.setImageWith(imageUrl! as URL)
            } catch let err {
                print("Error: ")
            }
        }
        
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dvc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        //dvc.getPoster = listOfPoster[indexPath.row] as! UIImage
        //let baseUrl = "http://image.tmdb.org/t/p/w500"
        dvc.imageUrl = NSURL(string: Config.apiKey + allMovies[indexPath.row].poster_path! as! String)
        dvc.movieTitleDetail = allMovies[indexPath.row].title as! String
        dvc.releaseDateDetail = allMovies[indexPath.row].release_date as! String
        dvc.descriptionDetail = allMovies[indexPath.row].overview as! String
        dvc.ratingDetail = String(format:"%.1f", allMovies[indexPath.row].vote_average as! Double) //allMovies[indexPath.row].vote_average
        self.navigationController?.pushViewController(dvc, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func fetch() {
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = NSURL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")
        let request = NSURLRequest(
            url: url! as URL,
            cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData,
            timeoutInterval: 10)
        
        
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate: nil,
            delegateQueue: OperationQueue.main
        )
        
        
        
        let task: URLSessionDataTask = session.dataTask(with: request
            as URLRequest, completionHandler: { (dataOrNil, reponse, error) in
                guard let dataResponse = dataOrNil,
                    error == nil else {
                        print(error?.localizedDescription ?? "Response Error")
                        return}
                do {
                    
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Movie.self, from: dataResponse)
                    self.allMovies = response.results
                    self.tableView.reloadData()
                    
                } catch let parsingError {
                    print("Error", parsingError)
                }
        }) // the end
        
        task.resume()
        
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //print("I am typing: ", searchText)
        self.searchAllMovies = allMovies.filter({$0.title.prefix(searchText.count).lowercased() == searchText.lowercased()})
        self.isSearching = true
        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
    
}

