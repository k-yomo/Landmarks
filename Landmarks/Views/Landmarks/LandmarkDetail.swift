//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Kanji Yomoda on 2022/01/03.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modalData: ModalData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modalData.landmarks.firstIndex(where: { $0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.black)
                    FavoriteButton(isSet: $modalData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modalData = ModalData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modalData.landmarks[0])
            .environmentObject(modalData)
    }
}
