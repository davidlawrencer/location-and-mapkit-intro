//
//  ViewController.swift
//  location-and-mapkit-intro
//
//  Created by David Rifkin on 11/1/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    
    let mapView = MKMapView(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(mapView)
        requestLocationAndAuthorizeIfNeeded()
        locationManager.delegate = self
        mapView.showsUserLocation = true
        // Do any additional setup after loading the view.
    }

    private func requestLocationAndAuthorizeIfNeeded() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.requestLocation()
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        default:
            break
        }
    }
}
