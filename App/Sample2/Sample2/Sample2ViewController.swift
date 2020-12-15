//
//  Sample2ViewController.swift
//  Sample2
//
//  Created by Fumiya Tanaka on 2020/11/26.
//

import UIKit

class Sample2ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var data: [Bool] = [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false
    ]
    
    var imageArray: [UIImage] = [
        UIImage(named: "image1")!,
        UIImage(named: "image2")!,
        UIImage(named: "image3")!,
        UIImage(named: "image4")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension Sample2ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.delegate = self
        let isVisible = data[indexPath.row]
        if isVisible {
            cell.randomImageView.image = imageArray[indexPath.row % 4]
        } else {
            cell.randomImageView.image = nil
        }
        return cell
    }
}

extension Sample2ViewController: TableViewCellDelegate {
    func didTapChangeVisibleButton(cell: TableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            data[indexPath.row].toggle()
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}
