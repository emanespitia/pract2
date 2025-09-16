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
        let segmentedControl
            = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0

        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        //defined constraints
        let topConstraint =
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
        let leadingConstraint =
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint =
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print("MapViewController loaded its view.")
    }

}
