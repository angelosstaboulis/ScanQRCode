//
//  ContentView.swift
//  ScanQRCode
//
//  Created by Angelos Staboulis on 5/3/24.
//

import SwiftUI
import CodeScanner
struct ContentView: View {
    var body: some View {
        VStack {
            CodeScannerView(codeTypes: [.qr]) { response in
                    switch response {
                        case .success(let result):
                            debugPrint("Signature=",printQRCodeSignature(qr: result.string))
                        case .failure(let error):
                            debugPrint(error.localizedDescription)
                    }
            }
        }
        .padding()
    }
    func printQRCodeSignature(qr:String)->String{
        let sig = qr.components(separatedBy: "?")
        let getSig = sig[1].components(separatedBy: "=")
        let printSig = getSig[1]
        return printSig
    }
}

#Preview {
    ContentView()
}
