//
//  MenuViewController.swift
//  CS2
//
//  Created by Rodrigo Colozio on 13/05/23.
//

import UIKit


protocol MenuDelegate: AnyObject {
    func tappedForUpdates(description: String, image: String)
}

class MenuViewController: UIViewController {

    // MARK: - Attributes
    
    
    weak var delegate: MenuDelegate?
    fileprivate let smokeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Smoke Updates", for: .normal)
        button.setTitleColor(UIColor.systemOrange, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapSmokeButton), for: .touchUpInside)
        return button
    }()
    
    fileprivate let layoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Layout updates", for: .normal)
        button.setTitleColor(UIColor.systemOrange, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapLayoutbutton), for: .touchUpInside)
        return button
    }()
    
    fileprivate let mapButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Maps update", for: .normal)
        button.setTitleColor(UIColor.systemOrange, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapMapbutton), for: .touchUpInside)

        return button
    }()
    
    fileprivate let cs2Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Welcome to CS2", for: .normal)
        button.setTitleColor(UIColor.systemOrange, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didCs2Mapbutton), for: .touchUpInside)
        return button
    }()
    
    let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        configureUI()
    }
    
    
    private func configureUI() {
        self.view.addSubview(smokeButton)
        self.view.addSubview(layoutButton)
        self.view.addSubview(mapButton)
        self.view.addSubview(cs2Button)

        
        
        
        NSLayoutConstraint.activate([
            smokeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            smokeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 45),
            smokeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -45),
            smokeButton.heightAnchor.constraint(equalToConstant: 35),
            
            layoutButton.topAnchor.constraint(equalTo: self.smokeButton.bottomAnchor, constant: 30),
            layoutButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 45),
            layoutButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -45),
            layoutButton.heightAnchor.constraint(equalToConstant: 35),
            
            mapButton.topAnchor.constraint(equalTo: self.layoutButton.bottomAnchor, constant: 30),
            mapButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 45),
            mapButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -45),
            mapButton.heightAnchor.constraint(equalToConstant: 35),
            
            cs2Button.topAnchor.constraint(equalTo: self.mapButton.bottomAnchor, constant: 30),
            cs2Button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 45),
            cs2Button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -45),
            cs2Button.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
    
    
    
    @objc func didTapSmokeButton() {
        delegate?.tappedForUpdates(description: "In Counter-Strike 2, smokes are coded as three dimensional objects, meaning they’re responsive to the environment they’re in. Rather than just blocking sight, smokes will be dynamic and be impacted by gunshots, grenades, and even light. If you shoot through a smoke in CS:GO, nothing happens. However, in Counter-Strike 2, you can shoot or use grenades to briefly create a line of sight through the smoke or disperse the smoke quicker.", image: "smoke")
        dismiss(animated: true)
    }
    
    @objc func didTapLayoutbutton() {
        delegate?.tappedForUpdates(description: "Counter-Strike 2 also includes an overhauled UI, with better-looking ranks and overlay in-game. There is also a new main menu, which shows your team together when they join the lobby.", image: "layout")
        dismiss(animated: true)
    }
    
    @objc func didTapMapbutton() {
        delegate?.tappedForUpdates(description: "The maps featured in the video include Mirage, Overpass, Dust2, Nuke, Ancient, Italy and Inferno. Lighting, props and even some of the layouts have been altered.", image: "dust2")
        dismiss(animated: true)
    }
    
    @objc func didCs2Mapbutton() {
        delegate?.tappedForUpdates(description: "Welcome to Counter Strike 2, check out what is new in game", image: "cs2")
        dismiss(animated: true)
    }


}
