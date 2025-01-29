//
//  ViewController.swift
//  MovieS
//
//  Created by Esclava de chofi, lilly y lulu on 29/1/25.
// UI
// ver este tutorial que es el que realizo paso a paso: https://www.youtube.com/watch?v=mT3OFcui97k
// Network request
// tap a cell to see info about de movie
// custom cell


import UIKit

    class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet var table: UITableView!
    @IBOutlet var field: UITextField!
    
    var movies = [Movie] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        field.delegate = self 
        // Do any additional set up after
    }
    
    // Field
    
    func textFieldShouldReturn(_textField: UITextField) ->
    searchMovies()
    return true
    
    }
    func searchMovies() {
    field.resignFirstResponder()
        
        guard let text = field.text, !text.isEmpty else
        return
    }
    URLSession.shared.dataTask(with: URL(string: "http://www.omdbapi.com/?apikey=3aea79ac&s=fast%20and&type=movie")!,
                               completionHandler: { data, response, error in
        
        guard let data = data, error == nil else {
            return
                  }
        // Convert
        
        // Updates our movies array
        
        // Refresh our table
        
        
    }).resume()

   // Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
    return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell ()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    // Show movie details
    }

struct MovieResult: Codable {
    let Search: [Movie]
}

struct Movie: Codable {
    let Title: String
    let Year: String
    let imdbID: String
    let _Type: String
    let Poster: String
    
    private enum Codingkeys: String, CodingKey {
        case Title, Year, imdbID, _Type = "Type", Poster
        
    }
}
