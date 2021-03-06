//
//  User.swift
//  labs-ios-starter
//
//  Created by Karen Rodriguez on 8/13/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import Foundation

class User {
    
    let id: String
    var firstName, lastName, email, password: String
    var middleName, title, company, phone, skype: String?
    var address: Address?
    var role: Role?
    var propertiesById: [String?] = []
    var hub: Hub?
    
    init() {
        self.id = "00u15tfyjl9AXGjxD4x7"
        self.firstName = "Miles"
        self.lastName = "Schmidt"
        self.email = "Miles.B.Schmidt.1602529359656@test.com"
        self.password = "1602529359656"
        self.role = .HOTEL
    }

    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String,
        let firstName = dictionary["firstName"] as? String,
        let lastName = dictionary["lastName"] as? String,
        let email = dictionary["email"] as? String,
        let password = dictionary["password"] as? String else {
            NSLog("Error unwrapping non-optional User properties:")
            NSLog("\tID: \(String(describing: dictionary["id"])) ")
            NSLog("\tFirst Name: \(String(describing: dictionary["firstName"])) ")
            NSLog("\tLast Name: \(String(describing: dictionary["lastName"])) ")
            NSLog("\tEmail: \(String(describing: dictionary["email"])) ")
            NSLog("\tPassword: \(String(describing: dictionary["password"]))")
            return nil
        }

        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password

        self.middleName = dictionary["middleName"] as? String
        self.title = dictionary["title"] as? String
        self.company = dictionary["company"] as? String
        self.phone = dictionary["phone"] as? String
        self.skype = dictionary["skype"] as? String

        if let addressContainer = dictionary["address"] as? [String: Any] {
            self.address = Address(dictionary: addressContainer)
        }
        
        if let roleString = dictionary["role"] as? String {
            self.role = Role(rawValue: roleString)
        } else {
            self.role = .HOTEL
        }

        if let properties = dictionary["properties"] as? [[String: Any]] {
            for property in properties {
                if let id = property["id"] as? String {
                    self.propertiesById.append(id)
                }
            }
        }
        
        if let hubContainer = dictionary["hub"] as? [String: Any] {
            self.hub = Hub(dictionary: hubContainer)
        } else {
            self.hub = nil
        }
    }
}
