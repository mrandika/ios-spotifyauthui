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
                        Button(action: {
                            print("[AUTHVIEW] Signup Button Pressed")
                        }, label: {
                            Text("SIGN UP FREE")
                                .frame(maxWidth: .infinity, maxHeight: 45)
                                .background(Color.green)
                                .cornerRadius(50)
                        }).padding(.top, 16)
                        
                        ForEach(thirdParty, id: \.self) {service in
                            Button(action: {
                                print("[AUTHVIEW] \(service) Button Pressed")
                            }, label: {
                                HStack {
                                    Image(systemName: "circle").padding(.leading)
                                    Spacer()
                                    Text("CONTINUE WITH \(service.uppercased())").padding(.leading, -18)
                                    Spacer()
                                }.frame(maxWidth: .infinity, maxHeight: 45)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 50)
                                        .stroke(lineWidth: 1)
                                            .foregroundColor(.gray)
                                )
                            }).padding(.top, 8)
                        }
                        
                        Button(action: {
                            print("[AUTHVIEW] Login Button Pressed")
                        }, label: {
                            HStack {
                                Text("LOG IN")
                            }.frame(maxWidth: .infinity, maxHeight: 50)
                        }).padding(.top, 8)
                        .padding(.bottom, reader.safeAreaInsets.bottom + 32)
                    }.font(.custom("Gotham-Medium", size: 11))
                    .foregroundColor(.white)
                    .padding([.leading, .trailing], 32)
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
