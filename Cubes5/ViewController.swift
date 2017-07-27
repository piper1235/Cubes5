//
//  ViewController.swift
//  Cubes5
//
//  Created by Tony on 7/26/17.
//  Copyright © 2017 Anthony Vitrano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var games : [Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            games = try context.fetch(Game.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }
        
        func tableView(_ <#T##tableView: UITableView##UITableView#>, numberOfRowsInSection: <#T##Int#>) -> Int {
            return games.count
        }
        
        func tableView(_ <#T##tableView: UITableView##UITableView#>, cellForRowAt: <#T##IndexPath#>: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            let game = games[IndexPath.row]
            cell.textLabel?.text = game.title
            return cell
        }
    }
    
}

