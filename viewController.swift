
import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController {
    
    @IBOutlet weak var myMap: MKMapView!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    let locationManager = CLLocationManager()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        myMap.setUserTrackingMode(.Follow, animated: true)
        
        //Above, setting the request for user location and following the user location with tracker.
        
        let bournemouthPier = CLLocationCoordinate2D(latitude: 50.716098 , longitude: -1.875780 )
        let bournemouthPierRegion = CLCircularRegion(center: bournemouthPier, radius: 50, identifier: "Bournemouth Pier")
        locationManager.startMonitoringForRegion(bournemouthPierRegion)
        
        let boscombePier = CLLocationCoordinate2D(latitude: 50.719914 , longitude: -1.843552 )
        let boscombePierRegion = CLCircularRegion(center: bournemouthPier, radius: 50, identifier: "Boscombe Pier")
        locationManager.startMonitoringForRegion(boscombePierRegion)

        
        // setting Bournemouth pier location so that when you go into the paracmeters that we've entered it will say entering and leaving region.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}





extension ViewController: CLLocationManagerDelegate {
    
    

    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        ImageView.image = UIImage(named: region.identifier)
        
    print("Entering \(region.identifier)")
    
    }

    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Leaving \(region.identifier)")
    }

}

     //Creating the feedback message which tells the user you are entering and leaving your region

