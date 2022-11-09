//
//  BoxScrollViewController.swift
//  XcodePlay
//
//  Created by Graham on 09/11/2022.
//

import UIKit

class BoxScrollViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let redView = UIView()
    private let blueView = UIView()
    private let greenView = UIView()
    private let squareSize: CGFloat
    private let squareSpacing: CGFloat

    required init(squareSize: CGFloat = 300, squareSpacing: CGFloat = 20) {
        self.squareSize = squareSize
        self.squareSpacing = squareSpacing
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
}

extension BoxScrollViewController {
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        redView.backgroundColor = .systemRed
        greenView.backgroundColor = .systemGreen
        blueView.backgroundColor = .systemBlue
        contentView.addSubview(redView)
        contentView.addSubview(greenView)
        contentView.addSubview(blueView)
    }

    private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
        // Explicitly setting the width will prevent horizontal scrolling
        contentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        let squareConstant = squareConstant()

        redView.translatesAutoresizingMaskIntoConstraints = false
        redView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: squareSpacing).isActive = true
        redView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        redView.widthAnchor.constraint(equalToConstant: squareConstant).isActive = true
        redView.heightAnchor.constraint(equalToConstant: squareConstant).isActive = true

        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: squareSpacing).isActive = true
        greenView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        greenView.widthAnchor.constraint(equalToConstant: squareConstant).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: squareConstant).isActive = true

        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: squareSpacing).isActive = true
        blueView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        blueView.widthAnchor.constraint(equalToConstant: squareConstant).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: squareConstant).isActive = true
        // For vertical scrolling to function we need to explicitly set the bottom (and top) constraint(s), because UIScrollView needs to know how much content to vertically scroll
        blueView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -squareSpacing).isActive = true
    }

    private func squareConstant() -> CGFloat {
        let maxWidth = view.bounds.width - 20
        if squareSize > maxWidth {
            return maxWidth
        }
        return squareSize
    }
}

