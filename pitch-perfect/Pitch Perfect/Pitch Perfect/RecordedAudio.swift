//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Hassan on 2015-04-07.
//  Copyright (c) 2015 Hassan. All rights reserved.
//

import Foundation
import AVFoundation


class RecordedAudio: NSObject{
    var filePathUrl: NSURL!
    var title: String!
    
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    init(filePathUrl: NSURL, title: String) {
        self.filePathUrl = filePathUrl
        self.title = title
        
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: filePathUrl, error: nil)
    }
    
    func play(pitch: Float) {
        playAudioWithVariablePitch(pitch)
    }
    
    func stopPlaying() {
        audioEngine.stop()
        audioEngine.reset()
    }
    
    private func playAudioWithVariablePitch(pitch: Float){
        //Used Udacity resources for the following block of code
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    

}