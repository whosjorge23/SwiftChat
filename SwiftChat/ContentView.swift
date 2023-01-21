//
//  ContentView.swift
//  SwiftChat
//
//  Created by Giorgio Giannotta on 21/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var messages: [Message] = []
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(messages) { message in
                    HStack {
                        if message.sender == "You" {
                            Spacer()
                            Text(message.text)
                                .padding()
//                                .background(Color.blue)
                                .cornerRadius(10)
                                .foregroundColor(.blue)
                        } else {
                            Text(message.text)
                                .padding()
//                                .background(Color.gray)
                                .cornerRadius(10)
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                }
            }
            HStack {
                TextField("Enter message", text: $text)
                Button(action: {
                    self.messages.append(Message(sender: "You", text: self.text))
                    self.text = ""
                }) {
                    Text("Send")
                }
            }
            .padding()
        }
    }
}

struct Message: Identifiable {
    let id = UUID()
    let sender: String
    let text: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
