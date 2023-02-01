//
//  GameScene.swift
//  sideScroller
//
//  Created by CHRISTIAN BOURQUIN on 1/30/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene,SKPhysicsContactDelegate {
    var ball: SKSpriteNode!
    var ground: SKSpriteNode!
    var scoreTracker:SKLabelNode!
    let cam = SKCameraNode()
    var score = 0
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        //sets screen orientation to the left
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        ball = self.childNode(withName: "box") as? SKSpriteNode
        ground = self.childNode(withName: "ground") as? SKSpriteNode
        scoreTracker = self.childNode(withName: "ScoreTracker") as? SKLabelNode
        self.camera = cam
        
    }
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        cam.position.x = ball.position.x
        scoreTracker.position.x = cam.position.x 
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("collision")
        scoreTracker.text = "score: \(score)"
        if contact.bodyA.node?.name == "firstFloor"{
            contact.bodyA.node?.removeFromParent()
            score += 1
            scoreTracker.text = "score: \(score)"

        }
        if contact.bodyB.node?.name == "firstFloor"{
            contact.bodyB.node?.removeFromParent()
            score += 1
            scoreTracker.text = "score: \(score)"

        }
        if contact.bodyA.node?.name == "evilGuy"{
            score -= 1
            scoreTracker.text = "score: \(score)"

        }
        if contact.bodyB.node?.name == "evilGuy"{
            score -= 1
            scoreTracker.text = "score: \(score)"

        }
    }
    
    func jump(){
        ball.physicsBody?.velocity = CGVector(dx: 500, dy: 500)
    }
}
