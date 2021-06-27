//
//  ContentView.swift
//  SFSymbolColor
//
//  Created by Steven Lipton on 6/23/21.
//

import SwiftUI



struct ContentView: View {
    @State var index:Int = 0
    let gradient = LinearGradient(colors: [.blue,.indigo], startPoint: .leading, endPoint: .bottom)
    let gradient2 = LinearGradient(colors: [.yellow,.orange,.red], startPoint: .top, endPoint: .bottom)
    let model:[String] = ["person","bell.badge","person.2","person.3","person.3.sequence"]
    var body: some View {
        VStack {
            Text("SF Symbol Color Demo")
                .font(.title)
            
            Image(systemName: model[index])
                .resizable()
                .scaledToFit()
                .padding(10)
                .symbolVariant(.circle)
                .symbolVariant(.fill)
                //.symbolRenderingMode(.palette)
                .foregroundStyle(.regularMaterial,.green,gradient2)
            
            Label(model[index], systemImage:model[index])
                .imageScale(.large)
                
            Spacer()
            HStack{
                Button {
                    index = (index <= 0) ? model.count - 1 : index - 1
                } label: {
                    Image(systemName: "arrow.left")
                }
                Spacer()
                        ForEach (0..<model.count){ item in
                            Button {
                               index = item
                            } label: {
                                Image(systemName: model[item])
                                    .imageScale(.small)
                            }
                            Spacer()
                        }
                Button {
                    index = (index >= (model.count - 1)) ? 0 : index + 1
                } label: {
                    Image(systemName: "arrow.right")
                }
            }
            .font(.title)
            .padding()
            .background(.bar)
            
        }
        .background(gradient)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
