//
//  ViewController.swift
//  MovieS
//
//  Created by Esclava de chofi, lilly y lulu on 29/1/25.
// UI
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
    
    //Field
    func textFieldShouldReturn(_textField: UITextField) ->
    searchMovies ()
    return true
    
    }
    func searchMovies() {
    field.resignFirstResponder()
    
 }
   //Table

func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
  return movies.count
}
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   return UITableViewCell ()
 }
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  tableView.deselectRow(at: indexPath, animated: true)
  //Show movie details
}

struct Movie{

}
