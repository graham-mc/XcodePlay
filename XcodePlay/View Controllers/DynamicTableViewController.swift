//
//  DynamicTableViewController.swift
//  XcodePlay
//
//  Created by Graham on 09/11/2022.
//

import UIKit

class DynamicTableViewController: UIViewController {

    var dynamicTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        dynamicTableView.dataSource = self
        dynamicTableView.delegate = self
        dynamicTableView.register(DynamicTableViewCell.self, forCellReuseIdentifier: DynamicTableViewCell.identifier)
        dynamicTableView.tableFooterView = UIView()
        view.addSubview(dynamicTableView)

        dynamicTableView.translatesAutoresizingMaskIntoConstraints = false
        dynamicTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        dynamicTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        dynamicTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        dynamicTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension DynamicTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dynamicCell = tableView.dequeueReusableCell(withIdentifier: DynamicTableViewCell.identifier, for: indexPath) as? DynamicTableViewCell else { return UITableViewCell() }
        return dynamicCell
    }
}

extension DynamicTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


class DynamicTableViewCell: UITableViewCell {
    static let identifier = "DynamicTableViewCell"
    let boxView = UIView()
    let bigLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        boxView.backgroundColor = .systemOrange
        contentView.addSubview(boxView)

        bigLabel.numberOfLines = 0
        bigLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sed velit dignissim sodales ut eu sem integer."
        bigLabel.font = .systemFont(ofSize: 20)
        contentView.addSubview(bigLabel)

        boxView.translatesAutoresizingMaskIntoConstraints = false
        boxView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        boxView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 10).isActive = true
        boxView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        boxView.centerYAnchor.constraint(equalTo: bigLabel.centerYAnchor).isActive = true
        boxView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        boxView.widthAnchor.constraint(equalToConstant: 80).isActive = true

        bigLabel.translatesAutoresizingMaskIntoConstraints = false
        bigLabel.leadingAnchor.constraint(equalTo: boxView.trailingAnchor, constant: 20).isActive = true
        bigLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bigLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        bigLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
}
