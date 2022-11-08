//
//  ViewController.swift
//  XcodePlay
//
//  Created by Graham on 08/11/2022.
//

import UIKit

class ViewController: UIViewController {
    private var contentView = UIView()
    private var topView = UIView()
    private var bottomView = UIView()
    private var contentViewTopConstraint: NSLayoutConstraint? = nil
    private var contentViewBottomConstraint: NSLayoutConstraint? = nil
    private var bottomViewHeightConstant: CGFloat {
        return view.bounds.height * 0.5
    }
    private var viewOffsetConstant: CGFloat {
        return (view.bounds.height * 0.5) / 2
    }
    private var animationTime: CGFloat = 0.4

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.backgroundColor = .gray
        view.addSubview(contentView)
        topView.backgroundColor = .systemTeal
        contentView.addSubview(topView)
        bottomView.backgroundColor = .systemOrange
        contentView.addSubview(bottomView)

        contentViewTopConstraint = .init(item: contentView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        contentViewBottomConstraint = .init(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: viewOffsetConstant)

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        contentViewTopConstraint!.isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        contentViewBottomConstraint!.isActive = true

        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: bottomViewHeightConstant).isActive = true

        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        topView.bottomAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true

        let swipeUpGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp))
        swipeUpGestureRecognizer.direction = .up
        bottomView.addGestureRecognizer(swipeUpGestureRecognizer)

        let swipeDownGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown))
        swipeDownGestureRecognizer.direction = .down
        bottomView.addGestureRecognizer(swipeDownGestureRecognizer)
    }
}

extension ViewController {
    @objc
    private func swipeUp() {
        contentViewTopConstraint?.constant = -viewOffsetConstant
        contentViewBottomConstraint?.constant = 0
        UIView.animate(withDuration: animationTime) {
            self.view.layoutSubviews()
        }
    }

    @objc
    private func swipeDown() {
        contentViewTopConstraint?.constant = 0
        contentViewBottomConstraint?.constant = viewOffsetConstant
        UIView.animate(withDuration: animationTime) {
            self.view.layoutSubviews()
        }
    }
}
