//
//  ViewController.swift
//  AmplifyPinpoint
//
//  Created by Anjum, Zeeshan on 28/05/2021.
//

import UIKit
import Amplify
import AmplifyPlugins

class ViewController: UIViewController {
    @IBAction func publishEvents(_ sender: Any) {
        var i = 0
        while i < 2 {
            i+=1
            recordEvents()
            print("recording event now !!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        identifyUser()
    }

    func recordEvents() {
        let properties: AnalyticsProperties = [
            "eventPropertyStringKey": "Lets see how it goes",
            "Address":"sdsdsdsdsd",
            "eventPropertyIntKey": 123,
            "eventPropertyDoubleKey": 12.34,
            "eventPropertyBoolKey": true
        ]
        let event = BasicAnalyticsEvent(name: "eventName", properties: properties)
        Amplify.Analytics.record(event: event)
    }
}

func identifyUser() {

//    guard let user = Amplify.Auth.getCurrentUser() else {
//        print("Could not get user, perhaps the user is not signed in")
//        return
//    }

    let location = AnalyticsUserProfile.Location(latitude: 47.606209,
                                                 longitude: -122.332069,
                                                 postalCode: "98122",
                                                 city: "Seattle",
                                                 region: "WA",
                                                 country: "USA")

    let properties: AnalyticsProperties = ["phoneNumber": "+11234567890", "age": 25]

    let userProfile = AnalyticsUserProfile(name: "zeerox",
                                           email: "zeerox@example.com",
                                           location: location,
                                           properties: properties)

    Amplify.Analytics.identifyUser("56565656565656565656", withProfile: userProfile)

}

