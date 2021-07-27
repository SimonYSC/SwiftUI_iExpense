//
//  ContentView.swift
//  iExpense
//
//  Created by YunShou Chao on 7/27/21.
//

import SwiftUI

//class User: ObservableObject {
//    @Published var firstName = "Bilbo"
//    @Published var lastName = "Baggins"
//}

//struct SecondView: View {
//    @Environment(\.presentationMode) var presentationMode
//    var name: String
//
//    var body: some View {
//        Button("Dismiss") {
//            self.presentationMode.wrappedValue.dismiss()
//        }
//    }
//}

struct ContentView: View {
//    @ObservedObject private var user = User()
//    @State private var showingSheet = false
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    // onDelete only works on ForEach
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add Number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
                .navigationBarItems(leading: EditButton())
            }
        }
        
//        Button("Show Sheet") {
//            self.showingSheet.toggle()
//        }
//        .sheet(isPresented: $showingSheet) {
//            SecondView(name: "Frodo")
//        }
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName)")
//            TextField("First name", text: $user.firstName)
//            TextField("Last name", text: $user.lastName)
//        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
