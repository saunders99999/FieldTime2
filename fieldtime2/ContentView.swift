//
//  ContentView.swift
//  fieldtime2
//
//  Created by Mark Saunders on 3/6/20.
//  Copyright © 2020 Mark Saunders. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var alertIsVisible = false
    
    @State private var counter = 0
    @State private var alvinCounter = 0
    @State private var nateCounter = 0
    
    @State private var masterSwitch = false
    @State private var alvinSwitch = true
    @State private var nateSwitch = true
        
    func resetTimers() {
        print("reset pushed")
        masterSwitch = false
        counter = 0
        alvinCounter = 0
        nateCounter = 0
    }
    
    func updateCounters() {
        if (masterSwitch) {
            counter += 1
            
            if (alvinSwitch) {
                alvinCounter += 1
            }
            
            if (nateSwitch) {
                nateCounter += 1
            }

        }
    }
    
    var body: some View {
        VStack {
            VStack {
                Text("Field Time!")
                    .onReceive(timer) { time in
                        self.updateCounters()
                    }
                    .padding(.top, 3)
                HStack {
                    Spacer()
                    Text("Us: 0")
                    Spacer()
                    Text("Them: 0")
                    Spacer()
                }
            }
            Spacer()
            VStack {
                HStack {
                    Text("\(self.nateCounter)")
                        .padding()
                    Toggle(isOn: $nateSwitch) {
                        Text("Nate")
                    }
                        .padding()
                }
                HStack {
                    Text("\(self.alvinCounter)")
                        .padding()
                    Toggle(isOn: $alvinSwitch) {
                        Text("Alvin")
                    }
                        .padding()
                }
            }
            Spacer()
            VStack {
                HStack {
                    Text("\(self.counter)")
                        .padding()
                    Toggle(isOn: $masterSwitch) {
                        Text("master switch")
                    }
                        .padding()
                }
                HStack {
                    Button(action: {
                        self.alertIsVisible.toggle()
                    }) {
                      Text("Reset")
                        .padding()
                    }.alert(isPresented: $alertIsVisible) {
                        Alert(title: Text("Reset Timers"), message: Text("Are you sure?  Did you record the time?"), primaryButton: .destructive(Text("Yes")) {
                                self.resetTimers()
                            }, secondaryButton: .cancel()
                        )
                    }
                }
            }
        }
    }
}


//struct ContentView: View {
//    @State var currentDate = Date()
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//
//    var body: some View {
//        Text("\(currentDate)")
//            .onReceive(timer) { input in
//                self.currentDate = input
//            }
//    }
//}


// bbah 2
//struct ContentView: View {
//    @State private var showGreeting = true
//
//    var body: some View {
//        VStack {
//            Toggle(isOn: $showGreeting) {
//                Text("Show welcome message")
//            }.padding()
//
//            if showGreeting {
//                Text("Hello World!")
//            }
//        }
//    }
//}





/// bbaah 3
//struct ContentView: View {
//    @State var alertIsVisible: Bool = false;
//    @State var alvin = true;
//
//    var body: some View {
//        VStack {
//            Text("Hello, World2!")
//            Button(action: {
//              print("Button pressed!")
//            }) {
//              Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
//            }
//            Toggle(isOn: @alvin,
//                   label: <#T##() -> ToggleStyleConfiguration.Label#>)
////            VStack {
////                Toggle(isOn: @alvin) {
////                    "alvin"
////                }
////            }
////            HStack {
////                Spacer()
////                Toggle(isOn: $alvin) {
////                    Print("toggle is"); // \(String(alvin)) ");
////                }
////                Spacer()
////            }
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
