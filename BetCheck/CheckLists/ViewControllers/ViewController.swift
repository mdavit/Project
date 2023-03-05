//
//  ViewController.swift
//  BetCheck
//
//  Created by Davit Margaryan on 02.03.23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var playerPicker: UIPickerView!
    @IBOutlet weak var betCompanyPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerPicker.delegate =  self
        playerPicker.dataSource = self
        betCompanyPicker.delegate = self
        betCompanyPicker.dataSource = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
        
        playerPicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Center the picker view horizontally and vertically
            playerPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            playerPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //playerPicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            // Set the width of the picker view to be equal to the width of the view, with a 16-point margin on each side
            playerPicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            playerPicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // Set the height of the picker view to be 200 points
            playerPicker.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        betCompanyPicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Center the picker view horizontally and vertically
            playerPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            betCompanyPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //betCompanyPicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            // Set the width of the picker view to be equal to the width of the view, with a 16-point margin on each side
            betCompanyPicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            betCompanyPicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // Set the height of the picker view to be 200 points
            betCompanyPicker.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    @objc func handleTap() {
            // Gesturi dzevna talis
            print("User tapped the screen!")
        }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        // bolor toxeri hamar stexcum e nor UILabel
        let label = UILabel()
        label.textAlignment = .center
        // sa el guyne poxume kaxvac dark u light modic
        if traitCollection.userInterfaceStyle == .dark {
            label.textColor = .white
        } else {
            label.textColor = .black
        }
        
        // Stex cuyc e talis toxeri u sectionneri grvace
        if component == 0 {
            label.text = "Column 1, Row \(row)"
        } else if component == 1 {
            label.text = "Column 2, Row \(row)"
        } else {
            label.text = "Sum, Row \(row)"
        }
        
        // veradardznum e Label vorpes twxi tesq
        return label
    }
}
