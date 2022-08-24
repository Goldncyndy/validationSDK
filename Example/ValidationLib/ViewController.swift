//
//  ViewController.swift
//  ValidationLib
//
//  Created by Goldncyndy on 08/24/2022.
//  Copyright (c) 2022 Goldncyndy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  lazy var label: UILabel = {
    let textLabel = UILabel()
    textLabel.text = "Verify Me:"
    textLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    textLabel.textColor = .white
    return textLabel
  }()
  
  lazy var inputTextView: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.keyboardType = .emailAddress
    textField.layer.cornerRadius = 15
    textField.backgroundColor = UIColor.darkGray
    textField.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    textField.placeholder = "serena@gmail.com"
    textField.autocapitalizationType = .none
    textField.attributedPlaceholder = NSAttributedString(
      string: "  Enter Email",
      attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
    textField.textColor = .white
    textField.widthAnchor.constraint(equalToConstant: 150).isActive = true
    textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
    return textField
  }()
  
  lazy var verifyButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.backgroundColor = UIColor.green.cgColor
    button.setTitle("Verify", for: .normal)
    button.layer.cornerRadius = 25
    button.widthAnchor.constraint(equalToConstant: 90).isActive = true
    button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    button.addTarget(self, action: #selector(didTapVerify), for: .touchUpInside)
    return button
  }()

  lazy var verifyStack: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [label, inputTextView, verifyButton])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.spacing = 5
    return stackView
  }()
  let valid = Validation.shared
  
    override func viewDidLoad() {
        super.viewDidLoad()
      setupView()
      view.backgroundColor = .black
    }
  
  func setupView() {
    view.addSubview(verifyStack)
    
    verifyStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    verifyStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
    verifyStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
//    verifyStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    verifyStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    verifyStack.heightAnchor.constraint(equalToConstant: view.frame.height / 4).isActive = true
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  @objc func didTapVerify() {
    guard let newInput = inputTextView.text else { return }
    
    valid.validateEmail(newInput)
    
    if newInput.isValidEmail {
      label.text = "Validation:  Valid email address"
    } else {
      label.text = "Validation:  Invalid email address"
    }
    
  }

}

