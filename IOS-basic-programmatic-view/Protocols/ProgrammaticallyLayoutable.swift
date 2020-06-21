//
//  ProgrammaticallyLayoutable.swift
//  IOS-basic-programmatic-view
//
//  Created by c.pabon.cuellar on 26/04/2020.
//  Copyright © 2020 cristhia.pabon. All rights reserved.
//

import Foundation

public protocol ProgrammaticallyLayoutable {
    func setUpView()
    func buildViewHierarchy()
    func setUpConstraints()
    func setUpAdditionalConfigs()
}

public extension ProgrammaticallyLayoutable {
    
    func setUpView() {
        buildViewHierarchy()
        setUpConstraints()
        setUpAdditionalConfigs()
    }
    
    func setUpAdditionalConfigs() {}
}
