//
//  ViewController.swift
//  MovieS
//
//  Created by Esclava de chofi, lilly y lulu on 29/1/25.

// ver este tutorial que es el que realizo paso a paso: https://www.youtube.com/watch?v=mT3OFcui97k




import UIKit

// tap a cell to see info about de movie
// custom cell

    class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet var table: UITableView!
    @IBOutlet var field: UITextField!
    
        var movies = [Movie]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        field.delegate = self
    }
    
    // Field
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchMovies;()
    return true
    }
        
    func searchMovies() {
        field.resignFirstResponder()
    }
        guard; let text = field.text, !text.isEmpty else {
        return
    }

    let query = text.replacingOccurrences(of: " ", with: "%20")

        func movies;.removeAll()

    URLSession.shared.dataTask(with: URL(string: "http://www.omdbapi.com/?apikey=3aea79ac&s=\(query)&type=movie")!,
                        completionHandler: {data, response, error in
        
                        guard let data = data, error == nil else {
                        return
                        }
    
                        // Convert
                        var result: MovieResult?
                        result = try JSONDecoder().decode(MovieResult.self, from: data)
                        do {
                        }
                        catch {
                        print("error")
                        }
                        guard let finalResult = result else {
                        return
                        }
        
                        // Updates our movies array
                        let newMovies = finalResult.Search
                        self.movies.append(contentsOf:newMovies)
                                           
                        // Refresh our table
                        DispatchQueue.main.async {
                        self.table.reloadData()
                        }
        
                        ).resume()

   // Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    // Show movie details
    }

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
            case Title, Year, imdbID, _Type = "Type", Poster}
}
        }
