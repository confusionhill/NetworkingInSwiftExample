//
//  ViewController.swift
//  FakeStoreIOS
//
//  Created by Farhandika on 25/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let cellIdentifier = "cellPlain"
    
    var products:[Product] = []
    
    let networkManager = NetworkManager()
    
    lazy var tableView:UITableView = {
        /// setting up tableView
        let tableview = UITableView(frame:
                                        CGRect(x: 0, y: 0,
                                               width: UIScreen.main.bounds.width,
                                               height: UIScreen.main.bounds.height))
        /// Registering TableViewCell to TableView
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        return tableview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        /// registering the tableview delegate
        tableView.delegate = self
        /// registering the tableview datasource
        tableView.dataSource = self
        /// adding tableview to the viewcontroller
        self.view.addSubview(tableView)
        
        /// perform network request then add the data
        networkManager.getProducts { result in
            switch result {
            case .success(let products):
                /// if the data is retrieved
                DispatchQueue.main.async {
                    self.products = products
                    self.tableView.reloadData()
                }
            case .failure(let error):
                // if not
                print(error.localizedDescription)
            }
        }
        
    }


}

//MARK: - Tableview DataSource
extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = products[indexPath.row].title
        return cell
    }
    
    
}

//MARK: - Tableview Delegate
extension ViewController:UITableViewDelegate {
    
}
