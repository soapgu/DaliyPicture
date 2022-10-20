//
//  ContentView.swift
//  DaliyPicture
//
//  Created by guhui on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        VStack{
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 500)
            }
            Text("\(viewModel.message)")
                .padding()
            Button("Tap me"){
                viewModel.load()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
