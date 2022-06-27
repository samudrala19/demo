//
//  ViewController.swift
//  MyCurrentLocation
//
//  Created by M1086198 on 29/04/22.
//
import UIKit

import MapKit

import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

   @IBOutlet var mapview: MKMapView!

    let manager = CLLocationManager()

    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

     override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)
         manager.requestWhenInUseAuthorization()
         manager.requestAlwaysAuthorization()
         manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyThreeKilometers



        manager.startUpdatingLocation()

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else{return}
        if let location = locations.first {

            manager.stopUpdatingLocation()

            render(location)

        }

    }

    func render(_ location: CLLocation){

            let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)

            let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)

            let region = MKCoordinateRegion(center: coordinate, span: span)

            mapview.setRegion(region, animated: true)

            let pin = MKPointAnnotation()

            pin.coordinate = coordinate

            mapview.addAnnotation(pin)
        

            }
     }

}

