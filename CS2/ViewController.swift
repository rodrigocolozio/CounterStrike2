//
//  ViewController.swift
//  CS2
//
//  Created by Rodrigo Colozio on 13/05/23.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - Attributes
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "cs2")
        image.layer.cornerRadius = 6
        return image
    } ()
    
    fileprivate let mainButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Check what's new", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.backgroundColor = UIColor(red: 255/255, green: 213/255, blue: 128/255, alpha: 0.8)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(mainAction), for: .touchUpInside)
        return button
        
    }()
    
    fileprivate let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor =  UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 0.8)
        view.layer.cornerRadius = 8
        return view
    }()
    
    var descriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Check out what is new in the Game!"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = -1
        label.textColor = .black
        return label
    }()
    
    fileprivate let scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    fileprivate let contentView: UIView = {
       let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "Counter Strike 2"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        configureUI()
    }
    
    private func configureUI() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.view.addSubview(imageView)
        self.view.addSubview(mainButton)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(container)
        
        
        // settings the ContentView
        let hConst = contentView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
            
            
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 80),
            imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            
            container.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant:  20),
            container.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant:  50),
            container.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -50),
            container.heightAnchor.constraint(equalTo: self.descriptionLabel.heightAnchor, constant: 10),

            descriptionLabel.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: 10),
            
            mainButton.topAnchor.constraint(equalTo: self.container.bottomAnchor, constant: 55),
            mainButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 80),
            mainButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -80),
            mainButton.heightAnchor.constraint(equalToConstant: 40)
          
        ])
    }
    
    
    // MAR: - Methods
    
    @objc func mainAction() {
        let vc = MenuViewController()
        vc.delegate = self
        vc.modalPresentationStyle = .automatic
        present(vc, animated: true)
    }
}


extension ViewController: MenuDelegate {
    
    func tappedForUpdates(description: String, image: String) {
        self.descriptionLabel.text = description
        self.imageView.image = UIImage(named: image)
        
    }
    
}

