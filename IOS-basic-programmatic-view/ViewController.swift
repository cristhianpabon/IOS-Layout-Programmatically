//
//  ViewController.swift
//  IOS-basic-programmatic-view
//
//  Created by c.pabon.cuellar on 26/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: UI Components
    private lazy var tableView: UIImageView = {
        let image = UIImage(named: String.tableBackground)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var logoImage: UIImageView = {
        let image = UIImage(named: String.logoImageText)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var diceStack: UIStackView = {
       let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis  = .horizontal
        stackview.spacing = 50
        stackview.distribution  = .fillEqually
        stackview.alignment = .center
        return stackview
    }()
    
    private lazy var diceOne: UIImageView = {
        let image = UIImage(named: String.diceOne)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var diceTwo: UIImageView = {
        let image = UIImage(named: String.diceTwo)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var playButton : UIButton = {
        let button = UIButton()
        button.setTitle(String.textButton, for: .normal);
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(rollButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpView()
    }

    //MARK:Events
    @objc func rollButtonPressed(_ sender: UIButton) {
        
        rollDices()
    }
    //MARK:Methods
    func rollDices(){
        //#imageLiteral(resourceName: "String here")
        let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
           
        diceOne.image = diceArray[Int.random(in: 0...5)]
        diceTwo.image = diceArray[Int.random(in: 0...5)]
    }
}



extension ViewController: ProgrammaticallyLayoutable {

    //MARK: Programmatically
    func buildViewHierarchy() {
        view.addSubview(tableView)
        view.addSubview(logoImage)
        view.addSubview(diceStack)
        diceStack.addArrangedSubview(diceOne)
        diceStack.addArrangedSubview(diceTwo)
        view.addSubview(playButton)
    }

    func setUpConstraints() {
        setUpTableView()
        setUpLogoImage()
        setUpDiceStack()
        setUpPlayButton()
    }

    func setUpAdditionalConfigs() {
        setUpViewBackground()
    }
    
    //MARK: Constraints Methods
    func setUpTableView(){
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    func setUpLogoImage(){
        let topConstant = self.view.frame.size.height * 0.088
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: topConstant).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setUpDiceStack(){
        diceStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        diceStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setUpPlayButton(){
        let bottomConstant = self.view.frame.size.height * 0.10
        playButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -bottomConstant).isActive = true
        playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    //MARK: Additional Method Configs
    func setUpViewBackground(){
        view.backgroundColor = .white
    }
}

fileprivate extension String {
    static let tableBackground = "GreenBackground"
    static let logoImageText = "DiceeLogo"
    static let diceOne = "DiceOne"
    static let diceTwo = "DiceThree"
    static let textButton = "ROLL"
}



