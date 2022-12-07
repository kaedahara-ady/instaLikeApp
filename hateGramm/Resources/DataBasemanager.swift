//
//  DataBasemanager.swift
//  hateGramm
//
//  Created by OverPowerPWND Keeper83 on 5/12/22.
//

import FirebaseDatabase

public class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    // MARK: - Public
    
    /// Check if username and email is available
    ///  - Parameters
    ///     -email: String represanting email
    ///     -username: String represanting username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    /// Inserts new user to database
    ///  - Parameters
    ///     -email: String represanting email
    ///     -username: String represanting username
    ///     -completion: Async callback for result if database entry succeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                completion(true)
                return
            } else {
                completion(false)
                return
            }
        }
    }
}
