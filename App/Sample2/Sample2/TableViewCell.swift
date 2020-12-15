//
//  TableViewCell.swift
//  Sample2
//
//  Created by Fumiya Tanaka on 2020/12/01.
//

import UIKit

protocol TableViewCellDelegate: AnyObject {
    func didTapChangeVisibleButton(cell: TableViewCell)
}

class TableViewCell: UITableViewCell {
    @IBOutlet weak var randomImageView: UIImageView!
    @IBOutlet weak var changeVisibleButton: UIButton!
    
    weak var delegate: TableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        changeVisibleButton.layer.cornerRadius = 8
        changeVisibleButton.layer.borderWidth = 2
        changeVisibleButton.layer.borderColor = changeVisibleButton.tintColor.cgColor
    }    
    
    @IBAction func tapChangeVisibleButton() {
        delegate?.didTapChangeVisibleButton(cell: self)
    }
}
