//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Erin Şarlak on 9/3/25.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        VStack (spacing: 20) {
            Text(title)
                .frame(width: 200, height: 50)
                .background(backgroundColor.gradient)
                .cornerRadius(10)

                           
//            Text(title)
//                .frame(width: 200, height: 50)
//                .background(backgroundColor.gradient)
//                .cornerRadius(10)

                           
        }
        .foregroundColor(textColor)
        .font(.system(size:20, weight: .medium, design: .default))
        

    }
}
 

#Preview {
    WeatherButton(title: "Test Title",
                  textColor: .white,
                  backgroundColor: .blue
        
    )
}
