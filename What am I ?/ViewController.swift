///  ViewController.swift

//  ItemIdentifier

//

//  Created by Theophilos Aravanis on 8/19/17.

// Adapted by Vin Ratford April 20, 2018

//  Copyright © 2017 Theophilos Aravanis. All rights reserved.

//

import UIKit

import CoreML

import Vision

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    typealias modelResults = (conf: Float, ident: String)
    
    enum modelClasses {
        
        case Inceptionv3
        
        case Resnet50
        
        case SqueezeNet
        
        case VGG16
        
        case MobileNet
        
        case GoogLeNetPlaces
        
    }
    
    var modelArray = [modelClasses.Inceptionv3, modelClasses.GoogLeNetPlaces, modelClasses.MobileNet, modelClasses.Resnet50, modelClasses.SqueezeNet, modelClasses.VGG16]
    
    var aRequest:VNRequest?
    
    func theHandler(image:CIImage, aRequest:VNRequest) {
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            
            try handler.perform([aRequest])
            
        }
            
        catch {
            
            print(error)
            
        }
        
    }
    
    func getAModel(image: CIImage) {
        
        var confidenseIdentiferArray = [modelResults]()
        
        var cofidenceAndIdentifier : modelResults = (conf:0.0,ident:"")  // a tuple that will contain the cofidence level and the idenity
        
        for model in modelArray {
            
            switch model {
                
            case .Inceptionv3:
                
                guard  let model = try? VNCoreMLModel(for: Inceptionv3() .model) else {
                    
                    fatalError("Loading CoreML Model Failed.")
                    
                } //End of Guard
                
                let aRequest = VNCoreMLRequest(model: model) { (request, error) in
                    
                    guard let results = request.results as? [VNClassificationObservation] else {
                        
                        fatalError("Model Failed to Process Image")
                        
                    } //End of Guard
                    
                    if let firstResult = results.first {
                        
                        cofidenceAndIdentifier.conf = firstResult.confidence
                        
                        cofidenceAndIdentifier.ident = firstResult.identifier
                        
                        confidenseIdentiferArray.append((cofidenceAndIdentifier))
                        
                    }// End of If let
                    
                }// End of Clouser
                
                theHandler(image: image, aRequest: aRequest)
                
            case .Resnet50:
                
                guard  let model = try? VNCoreMLModel(for: Resnet50() .model) else {
                    
                    fatalError("Loading CoreML Model Failed.")
                    
                }// End of Guard
                
                let aRequest = VNCoreMLRequest(model: model) { (request, error) in
                    
                    guard let results = request.results as? [VNClassificationObservation] else {
                        
                        fatalError("Model Failed to Process Image")
                        
                    } //End of Guard
                    
                    if let firstResult = results.first {
                        
                        cofidenceAndIdentifier.conf = firstResult.confidence
                        
                        cofidenceAndIdentifier.ident = firstResult.identifier
                        
                        confidenseIdentiferArray.append((cofidenceAndIdentifier))
                        
                    }// End of If let
                    
                }// End of Clouser
                
                theHandler(image: image, aRequest: aRequest)
                
            case .GoogLeNetPlaces:
                
                guard  let model = try? VNCoreMLModel(for: GoogLeNetPlaces() .model) else {
                    
                    fatalError("Loading CoreML Model Failed.")
                    
                } //End of Guard
                
                let aRequest = VNCoreMLRequest(model: model) { (request, error) in
                    
                    guard let results = request.results as? [VNClassificationObservation] else {
                        
                        fatalError("Model Failed to Process Image")
                        
                    } //End of Guard
                    
                    if let firstResult = results.first {
                        
                        cofidenceAndIdentifier.conf = firstResult.confidence
                        
                        cofidenceAndIdentifier.ident = firstResult.identifier
                        
                        confidenseIdentiferArray.append((cofidenceAndIdentifier))
                        
                    }// End of If let
                    
                }// End of Clouser
                
                theHandler(image: image, aRequest: aRequest)
                
            case .MobileNet:
                
                guard  let model = try? VNCoreMLModel(for: MobileNet() .model) else {
                    
                    fatalError("Loading CoreML Model Failed.")
                    
                } //End of Guard
                
                let aRequest = VNCoreMLRequest(model: model) { (request, error) in
                    
                    guard let results = request.results as? [VNClassificationObservation] else {
                        
                        fatalError("Model Failed to Process Image")
                        
                    } //End of Guard
                    
                    if let firstResult = results.first {
                        
                        cofidenceAndIdentifier.conf = firstResult.confidence
                        
                        cofidenceAndIdentifier.ident = firstResult.identifier
                        
                        confidenseIdentiferArray.append((cofidenceAndIdentifier))
                        
                    }// End of If let
                    
                }// End of Clouser
                
                theHandler(image: image, aRequest: aRequest)
                
            case .SqueezeNet:
                
                guard  let model = try? VNCoreMLModel(for: SqueezeNet() .model) else {
                    
                    fatalError("Loading CoreML Model Failed.")
                    
                } //End of Guard
                
                let aRequest = VNCoreMLRequest(model: model) { (request, error) in
                    
                    guard let results = request.results as? [VNClassificationObservation] else {
                        
                        fatalError("Model Failed to Process Image")
                        
                    } //End of Guard
                    
                    if let firstResult = results.first {
                        
                        cofidenceAndIdentifier.conf = firstResult.confidence
                        
                        cofidenceAndIdentifier.ident = firstResult.identifier
                        
                        confidenseIdentiferArray.append((cofidenceAndIdentifier))
                        
                    }// End of If let
                    
                }// End of Clouser
                
                theHandler(image: image, aRequest: aRequest)
                
            case .VGG16:
                
                guard  let model = try? VNCoreMLModel(for: VGG16() .model) else {
                    
                    fatalError("Loading CoreML Model Failed.")
                    
                } //End of Guard
                
                let aRequest = VNCoreMLRequest(model: model) { (request, error) in
                    
                    guard let results = request.results as? [VNClassificationObservation] else {
                        
                        fatalError("Model Failed to Process Image")
                        
                    } //End of Guard
                    
                    if let firstResult = results.first {
                        
                        cofidenceAndIdentifier.conf = firstResult.confidence
                        
                        cofidenceAndIdentifier.ident = firstResult.identifier
                        
                        confidenseIdentiferArray.append((cofidenceAndIdentifier))
                        
                    }// End of If let
                    
                }// End of Clouser
                
                theHandler(image: image, aRequest: aRequest)
                
            }// End of Switch
            
        }//End of For Loop
        
        confidenseIdentiferArray = confidenseIdentiferArray.sorted(by: {$0.conf  > $1.conf})
        
        
        
        cofidenceAndIdentifier = confidenseIdentiferArray[0]
        
        navigationItem.title = "There is a \(Int(cofidenceAndIdentifier.conf * 100) )% chance that this is a \(cofidenceAndIdentifier.ident)"
        
        // print("element o in the array contains \(confidenseIdentiferArray[0])")
        
    }// End of Method
    
    
    
    @IBOutlet weak var screenImage: UIImageView!
    
    let imagePicker = UIImagePickerController ()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        imagePicker.sourceType = .camera
        
        imagePicker.allowsEditing = false
        
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let userPickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            screenImage.image = userPickedImage
            
            guard  let  ciImage = CIImage(image: userPickedImage) else {
                
                fatalError("Could not pnvert to CIImage")
                
            }
            
            //            detectImage(image: ciImage)
            
            getAModel(image: ciImage)
            
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func camaraTapped(_ sender: UIBarButtonItem) {
        
        present(imagePicker, animated: true, completion: nil)
        
        
        
    }
    
}  // End of Class ViewController

