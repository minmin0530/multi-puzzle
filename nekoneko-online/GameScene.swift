//
//  GameScene.swift
//  nekoneko-online
//
//  Created by Yoshiki Izumi on 2020/06/03.
//  Copyright © 2020 Yoshiki Izumi. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
//    private var label : SKLabelNode?
//    private var spinnyNode : SKShapeNode?
    var snArray: [Neko] = [] //= Neko(texture: SKTexture(imageNamed: "nekoneko-orange"))

    override func didMove(to view: SKView) {
        
        for _ in 0...10 {
            let r = Int.random(in: 0...9)
            if r % 3 == 0 {
                snArray.append(Neko(texture: SKTexture(imageNamed: "nekoneko-pink")))
            }
            if r % 3 == 1 {
                snArray.append(Neko(texture: SKTexture(imageNamed: "nekoneko-green")))
            }
            if r % 3 == 2 {
                snArray.append(Neko(texture: SKTexture(imageNamed: "nekoneko-orange")))
            }
        }
        
        var z: CGFloat = 1.0
        for sn in snArray {
            sn.time = CGFloat.random(in: 0.0...360.0)
            sn.timeSpeed = CGFloat.random(in: 0.0...0.05)
            sn.position.x = CGFloat.random(in: -400.0...400.0)
            sn.position.y = CGFloat.random(in: -400.0...400.0)
            sn.eyeRight.fillColor = UIColor.white
            sn.eyeRight.strokeColor = UIColor.black
            sn.eyeRight.lineWidth = 10
            sn.eyeRight.position.x = 50
            sn.eyeRight.position.y = -20

            sn.eyeLeft.fillColor = UIColor.white
            sn.eyeLeft.strokeColor = UIColor.black
            sn.eyeLeft.lineWidth = 10
            sn.eyeLeft.position.x = -50
            sn.eyeLeft.position.y = -20

            sn.eyeFrameRight.fillColor = UIColor.white
            sn.eyeFrameRight.strokeColor = UIColor.black
            sn.eyeFrameRight.lineWidth = 10
            sn.eyeFrameRight.position.x = 50
            sn.eyeFrameRight.position.y = -30

            sn.eyeFrameLeft.fillColor = UIColor.white
            sn.eyeFrameLeft.strokeColor = UIColor.black
            sn.eyeFrameLeft.lineWidth = 10
            sn.eyeFrameLeft.position.x = -50
            sn.eyeFrameLeft.position.y = -30

            sn.zPosition = z
            z += 1
            sn.eyeFrameRight.zPosition = z
            sn.eyeFrameLeft.zPosition = z
            z += 1
            sn.eyeRight.zPosition = z
            sn.eyeLeft.zPosition = z
            z += 1

            addChild(sn.eyeRight)
            addChild(sn.eyeFrameRight)
            addChild(sn.eyeLeft)
            addChild(sn.eyeFrameLeft)
            addChild(sn)
        }
//        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
//
//        // Create shape node to use during mouse interaction
//        let w = (self.size.width + self.size.height) * 0.05
//        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
//
//        if let spinnyNode = self.spinnyNode {
//            spinnyNode.lineWidth = 2.5
//
//            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                              SKAction.fadeOut(withDuration: 0.5),
//                                              SKAction.removeFromParent()]))
//        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        for sn in snArray {

            sn.time += sn.timeSpeed
            
            sn.position.y += 5 * cos(sn.time)
            sn.eyeFrameRight.position.x = sn.position.x + 50.0
            sn.eyeFrameRight.position.y = sn.position.y - 30.0
            sn.eyeFrameLeft.position.x = sn.position.x - 50.0
            sn.eyeFrameLeft.position.y = sn.position.y - 30.0
            sn.eyeRight.position.x = 30.0 * cos(sn.time) + 50.0 + sn.position.x
            sn.eyeRight.position.y = 30.0 * sin(sn.time) - 30.0 + sn.position.y
            sn.eyeLeft.position.x = 30.0 * cos(sn.time) - 50.0 + sn.position.x
            sn.eyeLeft.position.y = 30.0 * sin(sn.time) - 30.0 + sn.position.y
        }
    }
}
