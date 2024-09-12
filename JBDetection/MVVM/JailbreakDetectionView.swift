//
//  JailbreakDetectionView.swift
//  JBDetection
//
//  Created by 褚宣德 on 2024/9/12.
//

import SwiftUI

struct JailbreakDetectionView: View {
    @ObservedObject var viewModel = JailbreakDetectionViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isJailbroken {
                Text("您的設備已越獄")
                    .foregroundColor(.red)
                    .font(.largeTitle)
            } else {
                Text("您的設備未越獄")
                    .foregroundColor(.green)
                    .font(.largeTitle)
            }
        }
        .onAppear {
            viewModel.checkForJailbreak()
        }
        .padding()
    }
}


