//
//  ViewController.swift
//  ExNSRange
//
//  Created by 김종권 on 2023/11/30.
//

import UIKit

class ViewController: UIViewController {
private let textField = {
        let v = UITextField()
        v.textColor = .black
        v.placeholder = "input..."
        v.font = .systemFont(ofSize: 24)
        v.backgroundColor = .lightGray
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    private let label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 30, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("location7로 range 이동", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textField)
        view.addSubview(label)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
        ])
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        textField.delegate = self
        button.addTarget(self, action: #selector(handleTapButton), for: .touchUpInside)
    }
    
    @objc func handleTapButton() {
        let newPosition = textField.position(from: textField.beginningOfDocument, offset: 7)!
        textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        label.text = "last text> \(textField.text!), \nlast range>\(range)"
        
        return true
    }
}
