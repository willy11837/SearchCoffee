//
//  CafeTableViewController.swift
//  SearchCoffee
//
//  Created by Willy Kang on 2021/2/28.
//

import UIKit

class CafeTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchedCafes = [Coffee]()
    var searching = false
    
    func fetchCafe() {
        let urlStr = "https://cafenomad.tw/api/v1.2/cafes"
        if let url = URL(string: urlStr) {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let task = URLSession.shared.dataTask(with: url) { (data, responce, error) in
                if let data = data {
                    do {
                        let searchResponse = try decoder.decode([Coffee].self, from: data)
                        CoffeeResult.shareData = searchResponse
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
    
    @IBSegueAction func showDetail(_ coder: NSCoder) -> DetailViewController? {
        guard let row = tableView.indexPathForSelectedRow?.row else { return nil }
        if searching {
            return DetailViewController(coder: coder, cafe: searchedCafes[row])
        } else {
            return DetailViewController(coder: coder, cafe: CoffeeResult.shareData[row])
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCafe()
        
        self.searchBar.delegate = self
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedCafes.count
        } else {
            return CoffeeResult.shareData.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cafeTableViewCell", for: indexPath) as! CafeTableViewCell
        var cafe = Coffee()
        if searching {
            cafe = searchedCafes[indexPath.row]
        } else {
            cafe = CoffeeResult.shareData[indexPath.row]
        }
        cell.cafeNameLabel.text = cafe.name
        cell.cafeAddressLabel.text = cafe.address
        cell.cafeOpenTimeLabel.text = cafe.open_time
        return cell
    }
}

extension CafeTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // search 邏輯寫在這
        searchedCafes = CoffeeResult.shareData.filter { $0.name!.lowercased().prefix(searchText.count) == searchText.lowercased() }
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}
