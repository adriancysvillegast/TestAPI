//
//  ViewController.swift
//  test
//
//  Created by Adriancys Jesus Villegas Toro on 23/2/24.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    private lazy var viewModel: HomeViewModel = {
       let viewModel = HomeViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    private var array: [ChurkModal] = []
    
    private lazy var aTableView: UITableView = {
        let aTable = UITableView()
        aTable.delegate = self
        aTable.dataSource = self
        aTable.register(CoverItemCell.self, forCellReuseIdentifier: CoverItemCell.identifier)
        return aTable
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        viewModel.getData()
        setUpView()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        aTableView.frame = view.bounds
    }

    
    // MARK: - setupView
    func setUpView() {
        view.addSubview(aTableView)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoverItemCell.identifier, for: indexPath) as? CoverItemCell else {
            return UITableViewCell()
        }
        
        cell.configure(value: array[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 275
    }
    
}

// MARK: - HomeViewModelDelegate
extension ViewController: HomeViewModelDelegate {
    func updateView(values: Set<ChurkModal>) {
        DispatchQueue.main.async {
            self.array = Array(values)
            self.aTableView.reloadData()
        }
    }
    
}
