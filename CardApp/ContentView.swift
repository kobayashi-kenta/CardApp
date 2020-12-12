//
//  ContentView.swift
//  CardApp
//
//  Created by Kenta on 2020/12/12.
//

import SwiftUI

struct ContentView: View {
    var cards = ["かばん": "bag",
                 "自動車" : "car",
                 "誕生日" : "birthday"]
    @State var japanese = "かばん"
    @State var isjapanese = true
    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.96, blue: 0.56)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        VStack {
            ZStack{
                Image("card")
                    .resizable()
                    .frame(width: 300.0, height: 133.0)
                    .shadow(radius: 3 )
                    .rotation3DEffect(
                        .degrees(isjapanese ? 0 : 180),
                        axis: (x: 0, y: 1, z: 0))
                    .animation(.spring())
                    .onTapGesture {
                        self.isjapanese.toggle()
                    }
            Text(isjapanese ? japanese : cards[japanese]!)
                .font(.largeTitle)
            }.padding()
            HStack {
                Group{
                Button(action: {
                    self.isjapanese.toggle()
                }) {
                    Image(systemName: "arrow.2.circlepath")
                    Text("裏返す")
                }
                Button(action: {
                    self.isjapanese = true
                    self.japanese = self.cards.randomElement()!.key
                }) {
                    Image(systemName: "forward.fill")
                    Text("次へ")
                }
                }.padding()
                .foregroundColor(.white)
                .background(Color(red: 0.86, green: 0.45, blue: 0.03))
                .cornerRadius(10)
            }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
