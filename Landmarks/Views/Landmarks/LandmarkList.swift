//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Kanji Yomoda on 2022/01/03.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modalData: ModalData
    @State private var showFavroitesOnly =  false
    
    var filteredLandmarks: [Landmark] {
        modalData.landmarks.filter { landmark in
            (!showFavroitesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List() {
                Toggle(isOn: $showFavroitesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModalData())
    }
}
