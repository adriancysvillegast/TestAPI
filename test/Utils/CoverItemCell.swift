//
//  CoverItemCell.swift
//  test
//
//  Created by Adriancys Jesus Villegas Toro on 23/2/24.
//

import UIKit
import SDWebImage

class CoverItemCell: UITableViewCell {
    static let identifier = "CoverItemCell"
    
    private lazy var aImageCover: UIImageView = {
        let aImage = UIImageView()
        aImage.contentMode = .scaleAspectFit
//        aImage.layer.cornerRadius = 12
        aImage.translatesAutoresizingMaskIntoConstraints = false
        return aImage
    }()
    
    private lazy var label: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - SetUpView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [aImageCover, label].forEach {
            contentView.addSubview($0)
        }
        
        
        contentView.layer.cornerRadius = 12
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            aImageCover.topAnchor.constraint(equalTo: topAnchor),
            aImageCover.leadingAnchor.constraint(equalTo: leadingAnchor),
            aImageCover.trailingAnchor.constraint(equalTo: trailingAnchor),
            aImageCover.heightAnchor.constraint(equalToConstant: 200),
            label.topAnchor.constraint(equalTo: aImageCover.bottomAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 70)
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        aImageCover.image = nil
        label.text = nil
    }
    
    func configure(value: ChurkModal) {
        label.text = value.value
        let url = URL(string: value.iconUrl)
        aImageCover.sd_setImage(with: url, placeholderImage: UIImage(named: "photo"))
    }
}
