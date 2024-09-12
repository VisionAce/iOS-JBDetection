//
//  JailbreakDetectionViewModel.swift
//  JBDetection
//
//  Created by 褚宣德 on 2024/9/12.
//

import Foundation

class JailbreakDetectionViewModel: ObservableObject {
    private var jailbreakDetectionModel = JailbreakDetectionModel()
    
    @Published var isJailbroken: Bool = false
    
    init() {
        checkForJailbreak()
    }
    
    func checkForJailbreak() {
        isJailbroken = jailbreakDetectionModel.isJailbrokenDevice()
    }
}

