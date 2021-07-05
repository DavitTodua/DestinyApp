//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var storyBrain = StoryBrain()
    var nextStory:Story?
    
    
    @IBOutlet weak var StoryLabel: UILabel!
    @IBOutlet weak var choiceButton2: UIButton!
    @IBOutlet weak var choiceButton1: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        let getAnswer = sender.titleLabel?.text
        nextStory = storyBrain.generateNextStory(answer: getAnswer!)
        sender.backgroundColor = .purple
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
    }
    
    @objc func updateUI() {
        choiceButton1.backgroundColor = .blue
        choiceButton2.backgroundColor = .blue
        nextStory = storyBrain.getCurrentStoryObj()
        StoryLabel.text = nextStory!.title
        choiceButton1.setTitle(nextStory!.choice1, for: .normal)
        choiceButton2.setTitle(nextStory!.choice2, for: .normal)
    }

}

