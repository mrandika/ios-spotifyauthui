//
//  ContentView.swift
//  SpotifyAuthUI
//
//  Created by Andika on 30/12/20.
//

import SwiftUI

struct ContentView: View {
    var thirdParty = ["Phone Number", "Facebook", "Apple", "Google"]
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                Image("Cover")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: reader.size.width)
                
                Rectangle()
                        .foregroundColor(.clear)
                    .background(LinearGradient(gradient: Gradient(colors: [.clear, Color(red: 18/255, green: 18/255, blue: 18/255)]), startPoint: .top, endPoint: .bottom))
                
                VStack {
                    Spacer()
                    Group {
                        Circle()
                            .frame(width: 50, height: 50)
                            .padding(.bottom, 16)
                        
                        Group {
                            Text("Millions of songs.").padding(.bottom, 4)
                            Text("Free on Spotify.")
                        }.font(.custom("Gotham-Bold", size: 24))
                    }.foregroundColor(.white)
                    
                    Group {
                        PrimaryButton(text: "Sign Up Free")
                            .padding(.top, 16)
                        
                        ForEach(thirdParty, id: \.self) {service in
                            SecondaryButton(text: service)
                                .padding(.top, 8)
                        }
                        
                        TertiaryButton(text: "Log In")
                            .padding(.bottom, reader.safeAreaInsets.bottom + 32)
                        
                    }.font(.custom("Gotham-Medium", size: 11))
                    .foregroundColor(.white)
                    .padding([.leading, .trailing], 32)
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct PrimaryButton: View {
    var text: String
    
    var body: some View {
        Button(action: {
            print("[AUTHVIEW] \(text) Button Pressed")
        }, label: {
            Text(text.uppercased())
                .frame(maxWidth: .infinity, maxHeight: 45)
                .background(Color.green)
                .cornerRadius(50)
        }).padding(.top, 16)
    }
}

struct SecondaryButton: View {
    var text: String
    
    var body: some View {
        Button(action: {
            print("[AUTHVIEW] \(text) Button Pressed")
        }, label: {
            HStack {
                Image(systemName: "circle").padding(.leading)
                Spacer()
                Text("CONTINUE WITH \(text.uppercased())")
                    .padding(.trailing)
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: 45)
            .overlay(
                    RoundedRectangle(cornerRadius: 50)
                    .stroke(lineWidth: 1)
                        .foregroundColor(.gray)
            )
        }).padding(.top, 8)
    }
}

struct TertiaryButton: View {
    var text: String
    
    var body: some View {
        Button(action: {
            print("[AUTHVIEW] \(text) Button Pressed")
        }, label: {
            HStack {
                Text(text.uppercased())
            }.frame(maxWidth: .infinity, maxHeight: 50)
        }).padding(.top, 8)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
