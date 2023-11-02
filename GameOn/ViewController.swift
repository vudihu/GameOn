//
//  ViewController.swift
//  GameOn
//
//  Created by Hung Vu on 01/11/2023.
//

import UIKit

class ViewController: UIViewController {
    
    enum Status {
        case keo
        case bua
        case giay
        case none
    }
    
    @IBOutlet weak var buttonGiay: UIButton!
    @IBOutlet weak var actionGiay: UIButton!
    @IBOutlet weak var actionKeo: UIButton!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var computerImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    let images = ["hand2", "hand0", "hand5"]
    var myStatus: Status = .none
    var computerStatus: Status = .none
    var keo = UIImage(named: "hand2")
    var bua = UIImage(named: "hand0")
    var giay = UIImage(named: "hand5")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        randomAction(myStatus: .none)
    }
    
    func setupUI() {
        [buttonGiay, actionGiay, actionKeo].forEach {
            $0?.layer.cornerRadius = 30
        }
    }
    
    func actionComputer() {
        let randomIndex = Int.random(in: 0..<images.count)
        let imageName = images[randomIndex]
        let image = UIImage(named: imageName)
        computerImage.image = image
    }
    
    func randomAction(myStatus: Status) {
        
        // My status
        switch myStatus {
        case .keo:
            myImage.image = keo
        case .bua:
            myImage.image = bua
        case .giay:
            myImage.image = giay
        case .none:
            myImage.isHidden = true
        }
        [myImage, computerImage].forEach {
            $0?.isHidden = myStatus == .none
        
        // Random status's Computer
        let randomIndex = Int.random(in: 0..<images.count)
        let imageName = images[randomIndex]
        let image = UIImage(named: imageName)
        computerImage.image = image
        }
    }
    
    func compareAction() {
        switch (myImage.image, computerImage.image) {
        case (keo, bua), (bua, giay), (giay,keo):
            myLabel.text = "LOSE"
        case (keo, giay), (bua, keo), (giay, bua):
            myLabel.text = "WIN"
        default:
            myLabel.text = "DRAW"
        }
    }
    
    
    @IBAction func actionBua(_ sender: Any) {
        randomAction(myStatus: .bua)
        compareAction()
    }
    @IBAction func actionGiay(_ sender: Any) {
        randomAction(myStatus: .giay)
        compareAction()
    }
    @IBAction func actionKeo(_ sender: Any) {
        randomAction(myStatus: .keo)
        compareAction()
    }
}

