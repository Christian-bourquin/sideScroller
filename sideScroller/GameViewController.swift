//
//  GameViewController.swift
//  sideScroller
//
//  Created by CHRISTIAN BOURQUIN on 1/30/23.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    @IBOutlet weak var LabelOutlet: UILabel!
    var play: GameScene!
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LabelOutlet.isHidden = true
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                play = scene as? GameScene
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func increaseScore(){
        score += 1
        LabelOutlet.text = "score: \(score)"
        
    }
    @IBAction func jumpAction(_ sender: Any) {
        play.jump()
        
    }
}
