//
//  MapViewController.swift
//  pract2
//
//  Created by emanuel espitia on 9/11/25.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!

    override func loadView() {
        // Create a map view
        mapView = MKMapView()

        // Set it as *the* view of this view controller
        view = mapView
        
        //segmented controls
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let satelliteString
                = NSLocalizedString("Satellite", comment: "Satellite map view")

        let segmentedControl
                = UISegmentedControl(items: [standardString, hybridString, satelliteString])
        
        
            segmentedControl.backgroundColor = UIColor.systemBackground
            segmentedControl.selectedSegmentIndex = 0
        
            segmentedControl.addTarget(self,action: #selector(mapTypeChanged(_:)),for: .valueChanged)

            segmentedControl.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(segmentedControl)
        
        //defined constraints
        let topConstraint =
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let leadingConstraint =
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)
        let trailingConstraint =
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        
        let heightConstraint =
            segmentedControl.heightAnchor.constraint(equalToConstant: 32)
        
        //activate constraints
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        heightConstraint.isActive = true
        
        // Label for POIs
        let poiLabel = UILabel()
        poiLabel.text = "Points of Interest"
        poiLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(poiLabel)

        // Switch for POIs
        let poiSwitch = UISwitch()
        poiSwitch.isOn = true   // start with POIs visible
        poiSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(poiSwitch)

        poiSwitch.addTarget(self,
                            action: #selector(togglePOIs(_:)),
                            for: .valueChanged)

        // Constraints for label + switch
        NSLayoutConstraint.activate([
            poiLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 12),
            poiLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            poiSwitch.centerYAnchor.constraint(equalTo: poiLabel.centerYAnchor),
            poiSwitch.leadingAnchor.constraint(equalTo: poiLabel.trailingAnchor, constant: 8)
        ])
        
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print("MapViewController loaded its view.")
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    @objc func togglePOIs(_ sender: UISwitch) {
        if sender.isOn {
               mapView.pointOfInterestFilter = .includingAll
           }
        else {
               mapView.pointOfInterestFilter = .excludingAll
           }
       }

}
