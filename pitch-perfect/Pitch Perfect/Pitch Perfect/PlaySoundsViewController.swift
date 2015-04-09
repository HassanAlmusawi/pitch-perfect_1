//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Hassan on 2015-04-07.
//  Copyright (c) 2015 Hassan. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    var receivedAudio:RecordedAudio!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
        playAudio(0.5)
    }

    @IBAction func playFastAudio(sender: UIButton) {
        playAudio(2.0)
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        audioPlayer.stop()
        receivedAudio.play(1000)
    }

    @IBAction func playDarthVAudio(sender: UIButton) {
        audioPlayer.stop()
        receivedAudio.play(-1000)
    }
    
    @IBAction func stopPlaying(sender: UIButton) {
        audioPlayer.stop()
        receivedAudio.stopPlaying()
        audioPlayer.currentTime = 0.0
    }
    
    func playAudio(rate: Float) {
        audioPlayer.currentTime = 0.0
        audioPlayer.stop()
        audioPlayer.rate = rate
        audioPlayer.play()
        receivedAudio.stopPlaying()

    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
