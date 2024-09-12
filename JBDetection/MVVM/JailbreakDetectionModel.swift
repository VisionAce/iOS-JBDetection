//
//  JailbreakDetectionModel.swift
//  JBDetection
//
//  Created by 褚宣德 on 2024/9/12.
//

import Foundation
import UIKit


class JailbreakDetectionModel {
    
    // 檢查常見越獄文件路徑
    private func isJailbroken() -> Bool {
        let fileManager = FileManager.default
        let jailbreakFilePaths = [
            "/Applications/Cydia.app",          // Cydia 安裝路徑
            "/Library/MobileSubstrate/MobileSubstrate.dylib",  // Mobile Substrate 路徑
            "/bin/bash",                        // bash shell，一般越獄設備會安裝
            "/usr/sbin/sshd",                   // SSH 守護進程
            "/etc/apt",                         // APT 包管理器
            "/var/lib/apt/",                    // APT 軟件源配置
            "/usr/bin/ssh",                     // SSH 路徑
            "/private/var/lib/apt",             // 常見越獄工具配置目錄
            "/var/jb",                          // palera1n Rootless Jailbreak Path
            "/private/var/jb"                   // palera1n Rootful Jailbreak Path
        ]
        
        for path in jailbreakFilePaths {
            if fileManager.fileExists(atPath: path) {
                return true
            }
        }
        return false
    }
    
    
    // 檢查 Substrate 函式庫
    private func isSubstratePresent() -> Bool {
        let handle = dlopen("/usr/lib/libsubstrate.dylib", RTLD_NOW)
        if handle != nil {
            dlclose(handle)
            return true
        }
        return false
    }
    
    
    // 綜合檢測
    func isJailbrokenDevice() -> Bool {
        return isJailbroken() || isSubstratePresent()
    }
}

