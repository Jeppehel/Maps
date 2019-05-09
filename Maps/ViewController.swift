//
//  ViewController.swift
//  Maps
//
//  Created by admin on 18/04/2019.
//  Copyright © 2019 Helholm. All rights reserved.
//

import UIKit
import MapKit

class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D){
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}
class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let location = CLLocationCoordinate2D(latitude: 55.676098, longitude: 12.568337)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        self.mapView.setRegion(region, animated: true)
        let pin = customPin(pinTitle: "Copenhagen", pinSubTitle: "Capital", location: location)
        self.mapView.addAnnotation(pin)
    }

    @IBAction func addPin(_ sender: UILongPressGestureRecognizer) {
        
        let location = sender.location(in: self.mapView)
        let locCord = self.mapView.convert(location, toCoordinateFrom: self.mapView)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locCord
        annotation.title = ""
        annotation.subtitle = ""
        self.mapView.addAnnotation(annotation)
        
    }
}

