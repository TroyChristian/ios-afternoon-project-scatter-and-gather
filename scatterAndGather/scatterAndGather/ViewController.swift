//
//  ViewController.swift
//  scatterAndGather
//
//  Created by Lambda_School_Loaner_219 on 12/10/19.
//  Copyright © 2019 Lambda_School_Loaner_219. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
   
    var isScattered: Bool = true {
        didSet {
            scatterLetters()
        }
    }
    
    let schoolLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "lambda_logo")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let lLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "L"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 51)
        return label
    }()
    
    let aLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "A"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize:51)
        return label
    }()
    
    let mLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "M"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 51)
        return label
    }()
    
    let bLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "B"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 51)
        return label
        
    }()
    
    let dLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "D"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize:51)
        return label
    }()
    
    let aLabel2:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "A"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 51)
        return label
    }()
    
   
    
    var labelArray = [UILabel]()
    var positions = [CGPoint]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSchoolLogo()
        configureLambdaLabels()
        configureButtons()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title:"Toggle", style: .plain, target: self, action: #selector(handleToggle))
        
        labelArray.append(lLabel)
        labelArray.append(aLabel)
        labelArray.append(mLabel)
        labelArray.append(bLabel)
        labelArray.append(dLabel)
        labelArray.append(aLabel2)
        
    }
    
    
    func configureButtons() {
        let toggleButton = UIButton(type: .system)
        toggleButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toggleButton)
        toggleButton.setTitle("WOOOAHHHH", for: .normal)
        toggleButton.addTarget(self, action: #selector(handleToggle), for: .touchUpInside)
        toggleButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        toggleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        toggleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 50).isActive = true
        toggleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
        
        @objc func handleToggle() {
        isScattered.toggle()
    }


    
    
    
    
    private func scatterLetters(){
        if isScattered {
            UIView.animate(withDuration: 3.0) {
                self.schoolLogo.alpha = 1 ///view opacity
                for (index, label)in self.labelArray.enumerated() {
                    label.transform = .identity
                    label.backgroundColor = .clear
                    label.textColor = .black
                    self.configureLambdaLabels()
                    label.center = self.positions[index]
                }
                
            
            }
            } else {
               UIView.animate(withDuration: 3.0) {
               self.schoolLogo.alpha = 0
               for (index,label) in self.labelArray.enumerated() {
                   self.positions.insert(label.center, at: index)
                   label.center = CGPoint(x: CGFloat.random(in: 0 ... self.view.bounds.size.width), y: CGFloat.random(in: 0...self.view.bounds.size.height))
                   label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / CGFloat.random(in: 0...8))
                   label.backgroundColor = UIColor(red: (CGFloat.random(in: 0...255) / 255), green: (CGFloat.random(in: 0...255) / 255), blue: (CGFloat.random(in: 0...255) / 255), alpha: 1)
                   
                   label.textColor = UIColor(red: (CGFloat.random(in: 0...255) / 255), green: (CGFloat.random(in: 0...255) / 255), blue: (CGFloat.random(in: 0...255) / 255), alpha: 1)
                        
                    }
                }
            }
           
        }
    private func configureSchoolLogo(){
        view.addSubview(schoolLogo)
        schoolLogo.widthAnchor.constraint(equalToConstant: 205).isActive = true
        schoolLogo.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        schoolLogo.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        schoolLogo.centerYAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        
        
        
    }
    private func configureLambdaLabels() {
        view.addSubview(lLabel)
        lLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        lLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant:6).isActive = true
        lLabel.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 6 - 10).isActive = true
        lLabel.heightAnchor.constraint(equalTo:lLabel.widthAnchor, multiplier:1).isActive = true
        
        view.addSubview(aLabel)
        aLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        aLabel.leadingAnchor.constraint(equalTo: lLabel.trailingAnchor, constant:10).isActive = true
        aLabel.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 6 - 10).isActive = true
        aLabel.heightAnchor.constraint(equalTo:aLabel.widthAnchor, multiplier:1).isActive = true
        
        view.addSubview(mLabel)
        mLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        mLabel.leadingAnchor.constraint(equalTo: aLabel.trailingAnchor, constant:10).isActive = true
        mLabel.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 6 - 10).isActive = true
        mLabel.heightAnchor.constraint(equalTo:mLabel.widthAnchor, multiplier:1).isActive = true
        
        view.addSubview(bLabel)
        bLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        bLabel.leadingAnchor.constraint(equalTo: mLabel.trailingAnchor, constant:10).isActive = true
        bLabel.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 6 - 10).isActive = true
        bLabel.heightAnchor.constraint(equalTo:bLabel.widthAnchor, multiplier:1).isActive = true
        
        view.addSubview(dLabel)
        dLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        dLabel.leadingAnchor.constraint(equalTo: bLabel.trailingAnchor, constant:10).isActive = true
        dLabel.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 6 - 10).isActive = true
        dLabel.heightAnchor.constraint(equalTo:dLabel.widthAnchor, multiplier:1).isActive = true
        
        view.addSubview(aLabel2)
        aLabel2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        aLabel2.leadingAnchor.constraint(equalTo: dLabel.trailingAnchor, constant:10).isActive = true
        aLabel2.widthAnchor.constraint(equalToConstant: view.bounds.size.width / 6 - 10).isActive = true
        aLabel2.heightAnchor.constraint(equalTo:aLabel2.widthAnchor, multiplier:1).isActive = true
    }
    
    struct AnimationsPreview: PreviewProvider {
        static var previews: some View {
            ContainerView()
        }
        struct ContainerView: UIViewControllerRepresentable {
            func updateUIViewController(_ uiViewController: AnimationsPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AnimationsPreview.ContainerView>) {
        }
            func makeUIViewController(context: UIViewControllerRepresentableContext<AnimationsPreview.ContainerView>) -> UIViewController{
                return UINavigationController(rootViewController: ViewController())
            }
    }
}
}

