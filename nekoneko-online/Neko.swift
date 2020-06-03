//
//  Neko.swift
//  nekoneko-online
//
//  Created by Yoshiki Izumi on 2020/06/03.
//  Copyright © 2020 Yoshiki Izumi. All rights reserved.
//

import SpriteKit

class Neko: SKSpriteNode {

    var time: CGFloat = 0.0
    var timeSpeed: CGFloat = 0.1
    var eyeRight: SKShapeNode = SKShapeNode(circleOfRadius: 10.0)
    var eyeFrameRight: SKShapeNode = SKShapeNode(circleOfRadius: 50.0)
    var eyeLeft: SKShapeNode = SKShapeNode(circleOfRadius: 10.0)
    var eyeFrameLeft: SKShapeNode = SKShapeNode(circleOfRadius: 50.0)

}
