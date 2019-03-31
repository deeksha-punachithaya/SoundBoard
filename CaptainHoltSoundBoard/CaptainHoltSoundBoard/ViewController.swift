//
//  ViewController.swift
//  CaptainHoltSoundBoard
//
//  Created by ADG RIT 18 on 30/03/19.
//  Copyright © 2019 ADG RIT 18. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var sounds = [NSString]()
    var audioPlayer : AVAudioPlayer?
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sounds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HoltCell", for: indexPath) as! HoltTableViewCell
        cell.TrackNumber.text = "\(indexPath.row + 1)"
        cell.TrackName.text = sounds[indexPath.row] as String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        do {
            if let fileURL = Bundle.main.path(forResource: "\(sounds[indexPath.row])",ofType:"m4a") {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
                audioPlayer?.play()
            }
            
            
        }
        catch{
            print(error.localizedDescription)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSongs()
        
    }
        func getSongs() {
            let fm = FileManager.default
            let path = Bundle.main.resourcePath!
            
            do  {
                let items : [NSString] = try fm.contentsOfDirectory(atPath: path) as [NSString]
                for item in items  {
                    if item.pathExtension == "m4a" {
                        sounds.append(item.deletingPathExtension as NSString)
                        print(item)
                }
            }
            }
            catch{
                print(error.localizedDescription)
                }
            }
        
        // Do any additional setup after loading the view, typically from a nib.
}
    
    




