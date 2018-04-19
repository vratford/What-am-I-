//
//  ViewController.swift
//  What am I ?
//
//  Created by Vincent Ratford on 4/17/18.
//  Copyright © 2018 Vincent Ratford. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var cameraSource : Bool = true
    
    
    @IBAction func imageSource(_ sender: UISwitch) {
        if sender.isOn {
            cameraSource = true
        } else {
            cameraSource = false
        }
    }
    
    
    @IBOutlet weak var cameraImage: UIImageView!
    
    @IBOutlet weak var myTopGuess: UITextField!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "What Am I ?"
        
        imagePicker.delegate = self
        
        imagePicker.allowsEditing = true
        if cameraSource == true {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        print("cameraSource = \(cameraSource)")
    
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let userPickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
  
            cameraImage.image = userPickedImage
            
            imagePicker.dismiss(animated: true, completion: nil)
            
            UIImageWriteToSavedPhotosAlbum(userPickedImage, nil, nil, nil) // Save to camera roll
            

            guard let ciimage = CIImage(image: userPickedImage) else {
                fatalError("Could not convert UIIamage to CIImage")
            }
            
            detect(image: ciimage)
            
        }
        
        
        
    }
    
    func detect(image: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Loading CoreML Model Failed.")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process image")
            }
            
            //            print(results)  // send to console to see what string was returned
            
            if let firstResult = results.first {
                
            
            self.myTopGuess.text = "\(firstResult.identifier) @ \(round(firstResult.confidence*1000) / 10)%"
            self.navigationItem.title = "Classify another picture ----->"
        
            }
            
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        }
        catch {
            print(error)
        }
        
        
    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        
            present(imagePicker, animated: true, completion: nil)
        
        imagePicker.delegate = self
        
        imagePicker.allowsEditing = true
        if cameraSource == true {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        print("cameraSource = \(cameraSource)")
        
    }
    
}

