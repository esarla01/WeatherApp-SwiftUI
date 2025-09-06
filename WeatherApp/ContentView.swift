//
//  ContentView.swift
//  WeatherApp
//
//  Created by Erin Şarlak on 8/30/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack{
                Spacer()
                CityTextView(cityName: "Ankara, Turkiye")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" :  "cloud.sun.fill", temperature: 76)
                HStack (spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temparature: 74)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temparature: 88)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temparature: 55)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temparature: 60)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "snow", temparature: 25)
                }
                Spacer()
                Button {
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                Spacer()
            }
        
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temparature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size:16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temparature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
     
    var body: some View {
        
//        LinearGradient(
//            gradient: Gradient(colors: [
//                isNight ? .black : .blue,
//                isNight ? .gray : Color("lightBlue")
//            ]),
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing
//        )
//
//        .edgesIgnoringSafeArea(.all)
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient :  Color.blue.gradient)
            .ignoresSafeArea(.all)
    }
}


struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        
        Text(cityName)
            .font(.system(size: 32, weight: .medium , design: .default))
            .foregroundColor(.white)
        
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

