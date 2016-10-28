//
//  GameScene.swift
//  PoissonDiskSamplingDemo
//
//  Created by Anna Afanasyeva on 28/10/2016.
//  Copyright © 2016 Anna Afanasyeva. All rights reserved.
//

import SpriteKit
import GameplayKit

import PoissonDiskSampling

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        isUserInteractionEnabled = true
        
        generatePoissonPoints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        reset()
        generatePoissonPoints()
    }
    
    private func generatePoissonPoints() {
        guard  let poissonPoints = PoissonDiskSampling().generate(Double(frame.width), height: Double(frame.height), minDistance: 120.0, newPointsCount: 30) else {
            return
        }
        
        draw(points: poissonPoints, radius: 5, color: SKColor.orange)
    }
    
    private func draw(points: [Point], radius: CGFloat, color: SKColor) {
        for point in points {
            let circle = SKShapeNode(circleOfRadius: radius)
            circle.position = CGPoint(x: point.x, y: point.y)
            circle.strokeColor = color
            circle.fillColor = color
            addChild(circle)
        }
    }
    
    private func reset() {
        self.removeAllChildren()
    }
}
