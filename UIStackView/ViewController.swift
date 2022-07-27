//
//  ViewController.swift
//  UIStackView
//
//  Created by Damir Chalkarov on 27.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var persents = [0, 5, 10, 15, 20, 25]
    var summ: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textField = UITextField()
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(textfieldAction(sender: )), for: .editingChanged)
        
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let stackView = UIStackView(arrangedSubviews: persents.map { makeButton(with: $0) })
        stackView.spacing = 10
        scrollView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
        
    }

    func makeButton(with percent: Int) -> UIButton {
        let button = UIButton()
        
        button.setTitle(" discount \(percent)%", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.tag = percent
        
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(buttonAction(sender: )), for: .touchUpInside)
        return button
    }
    
    @objc func textfieldAction(sender: UITextField) {
        summ = Double(sender.text!)!
        
    }
    
    @objc func buttonAction(sender: UIButton) {
        let finishSumm = summ - summ / 100 * Double(sender.tag)
        print(finishSumm)
        
        
        UIView.animate(withDuration: 0.25) {
            sender.isHidden = true
        }
    }

}

