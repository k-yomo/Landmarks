//
//  ContentView.swift
//  Landmarks
//
//  Created by Kanji Yomoda on 2022/01/02.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var modalData = ModalData()
    
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModalData())
    }
}
