//
//  ContentView.swift
//  When2Sleep
//
//  Created by Dominick Lee on 2/25/20.
//  Copyright © 2020 Domogami. All rights reserved.
//

import SwiftUI
import AVKit

struct ContentView: View {
  @State var selected = 0
  @State private var wakeUp = Date()
  @State var audioPlayer: AVAudioPlayer!
  @State var count = 1
  @State var playing = false
  
  let dateFormatter = DateFormatter()
  
  func getTime(cycle: Double) -> String {
    dateFormatter.timeZone = .current
    dateFormatter.dateFormat = "h:mm a"
    return dateFormatter.string(from: Date().addingTimeInterval(((90.0 * cycle)+15) * 60.0))
  }
  
  
  var body: some View {
    
    ZStack {
      if (self.selected == 0) {
        
        ZStack {

          //Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
          Color(#colorLiteral(red: 0.10591764, green: 0.08147127181, blue: 0.3474177122, alpha: 1))
          //Color(#colorLiteral(red: 0.04614045471, green: 0.04587155581, blue: 0.04697836936, alpha: 1))
          .edgesIgnoringSafeArea(.all)
          
          GeometryReader {g in
            ScrollView {
              VStack {
                Spacer()
              }
              .frame(height: 100)
                
              WhenToWake()
                .padding(.vertical)
                .frame(width: screen.width - 40, height: 500)
                .modifier(ShadowModifier())
                .frame(maxWidth: .infinity, maxHeight: screen.height)
                .offset(y:-25)
                .frame(width: g.size.width)
              
              VStack {
                  Spacer()
                  Text("Figure out when you should go to sleep in order to wake up at the end of a sleep cycle. Select the time you want to wake up at:")
                  .foregroundColor(Color.white)
                  .font(.system(size: 22, weight: .light))
                  .padding(.horizontal, 20)
                  .padding(.vertical, 10)
                  .background(Color("Accent1"))
                  .cornerRadius(20)
                  .frame(maxWidth: screen.width - 85)
                  
                  Spacer()
                  
                  DatePicker("Please enter a date", selection: self.$wakeUp, displayedComponents: .hourAndMinute)
                    .colorInvert()
                    .colorMultiply(Color.white)
                    .foregroundColor(Color.white)
                    .labelsHidden()
                  Spacer()
                  HStack {
                    Spacer()
                    TimeBoxReverse(cycle:1.0, date: self.$wakeUp)
                    Spacer()
                    TimeBoxReverse(cycle:2.0, date: self.$wakeUp)
                    Spacer()
                  }
                  .padding(10)
                  HStack {
                    Spacer()
                    TimeBoxReverse(cycle:3.0, date: self.$wakeUp)
                    Spacer()
                    TimeBoxReverse(cycle:4.0, date: self.$wakeUp)
                    Spacer()
                  }
                  .padding(10)
                  HStack {
                    Spacer()
                    TimeBoxReverse(cycle:5.0, date: self.$wakeUp)
                    Spacer()
                    TimeBoxReverse(cycle:6.0, date: self.$wakeUp)
                    Spacer()
                  }
                  .padding(10)
                  Spacer()
                }
                .frame(width: screen.width - 40, height: 600)
                .modifier(ColorModifier())
                .cornerRadius(30)
                .shadow(color: Color(#colorLiteral(red: 0.3706487417, green: 0.1442098618, blue: 0.8079112172, alpha: 1)).opacity(0.3), radius: 100, x:0, y:40)
                .padding(.top, 50)
                .animation(.easeInOut)
                .frame(width: g.size.width)
            }
          }

          HomeHeader()
        }
        .animation(.spring())
        
      }
      else if self.selected == 1 {
        ZStack {
          Color(#colorLiteral(red: 0.10591764, green: 0.08147127181, blue: 0.3474177122, alpha: 1))
            .edgesIgnoringSafeArea(.all)
          Spacer()
                 HomeHeader()
        }
        
       
      }
        
      else if self.selected == 2 {
        ZStack {
          Color(#colorLiteral(red: 0.10591764, green: 0.08147127181, blue: 0.3474177122, alpha: 1))
            .edgesIgnoringSafeArea(.all)
          
          VStack {

            Spacer()
            
            ScrollView(showsIndicators: false) {
              Button(action: {
                if(!self.playing) {
                  self.playing = true
                } else {
                  self.audioPlayer.pause()
                }
                self.count = 1
                let sound = Bundle.main.path(forResource: "Song\(self.count)", ofType: "mp3")
                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                self.audioPlayer.play()
              }) {
                HStack {
                  Text("White Noise")
                  Spacer()
                  Image(systemName: "play.circle.fill")
                }
              }
              .font(.system(size: 22, weight: .light))
              .padding(.horizontal, 35)
              .foregroundColor(Color.white)
              .frame(width: 400, height: 50, alignment: .center)
              .frame(maxWidth: screen.width - 25)
              .modifier(ColorModifier())
              .cornerRadius(25)
              
              Button(action: {
                if(!self.playing) {
                  self.playing = true
                } else {
                  self.audioPlayer.pause()
                }
                self.count = 2
                let sound = Bundle.main.path(forResource: "Song\(self.count)", ofType: "mp3")
                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                self.audioPlayer.play()
              }) {
                HStack {
                  Text("Tranquility")
                  Spacer()
                  Image(systemName: "play.circle.fill")
                }
              }
              .font(.system(size: 22, weight: .light))
              .padding(.horizontal, 35)
              .foregroundColor(Color.white)
              .frame(width: 400, height: 50, alignment: .center)
              .frame(maxWidth: screen.width - 25)
              .modifier(ColorModifier())
              .cornerRadius(25)
              
              Button(action: {
                 if(!self.playing) {
                   self.playing = true
                 } else {
                   self.audioPlayer.pause()
                 }
                 self.count = 3
                 let sound = Bundle.main.path(forResource: "Song\(self.count)", ofType: "mp3")
                 self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                 self.audioPlayer.play()
              }) {
                HStack {
                  Text("Meditation")
                  Spacer()
                  Image(systemName: "play.circle.fill")
                }
              }
              .font(.system(size: 22, weight: .light))
              .padding(.horizontal, 35)
              .foregroundColor(Color.white)
              .frame(width: 400, height: 50, alignment: .center)
              .frame(maxWidth: screen.width - 25)
              .modifier(ColorModifier())
              .cornerRadius(25)
              
              Button(action: {
                if(!self.playing) {
                  self.playing = true
                } else {
                  self.audioPlayer.pause()
                }
                self.count = 4
                let sound = Bundle.main.path(forResource: "Song\(self.count)", ofType: "mp3")
                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                self.audioPlayer.play()
              }) {
                HStack {
                  Text("Rainforest")
                  Spacer()
                  Image(systemName: "play.circle.fill")
                }
              }
              .font(.system(size: 22, weight: .light))
              .padding(.horizontal, 35)
              .foregroundColor(Color.white)
              .frame(width: 400, height: 50, alignment: .center)
              .frame(maxWidth: screen.width - 25)
              .modifier(ColorModifier())
              .cornerRadius(25)
            }
            .frame(width:screen.width - 25,height:400)
            .padding(.top, 30)
            
            Spacer()
            
            HStack {
              
              Button(action: {
                if(self.count > 1) {
                  self.count -= 1
                } else {
                  self.count = 4
                }
                if(self.playing) {
                  self.audioPlayer.pause()
                }
                let sound = Bundle.main.path(forResource: "Song\(self.count)", ofType: "mp3")
                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                self.audioPlayer.play()
                 
               }) {
                 Image(systemName: "backward.end").resizable()
                 .frame(width: 35, height: 35)
                 .foregroundColor(Color.white)
                 .aspectRatio(contentMode: .fit)
                 .foregroundColor(Color.black)
              }
              
              Button(action: {
                if (!self.playing) {
                  self.audioPlayer.play()
                  self.playing.toggle()
                } else {
                  self.audioPlayer.pause()
                  self.playing.toggle()
                }
                self.audioPlayer.numberOfLoops = NSIntegerMax
              }) {
                Image(systemName: !self.playing ? "play.circle.fill" : "pause.circle.fill").resizable()
                  .animation(.easeInOut)
                  .frame(width: 45, height: 45)
                  .foregroundColor(Color.white)
                  .aspectRatio(contentMode: .fit)
                  .foregroundColor(Color.black)
              }
              
              Button(action: {
                if(self.count < 4) {
                  self.count += 1
                } else {
                  self.count = 1
                }
                if(self.playing) {
                  self.audioPlayer.pause()
                }
                let sound = Bundle.main.path(forResource: "Song\(self.count)", ofType: "mp3")
                self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                self.audioPlayer.play()
                self.audioPlayer.numberOfLoops = NSIntegerMax
                 
               }) {
                 Image(systemName: "forward.end")
                  .resizable()
                  .frame(width: 35, height: 35)
                  .foregroundColor(Color.white)
                  .aspectRatio(contentMode: .fit)
                  .foregroundColor(Color.black)
               }
            }
            .padding(.vertical)
            .frame(maxWidth: screen.width - 35)
            .modifier(ColorModifier())
            .cornerRadius(25)
            
            Spacer()
          }
          
            
          HomeHeader()
        }
        .modifier(ShadowModifier())
        .onAppear {
          let sound = Bundle.main.path(forResource: "Song1", ofType: "mp3")
          self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
          self.audioPlayer.numberOfLoops = NSIntegerMax
          
          // Fire Beach rain waterfall wind thunderstorm
        }
        
        
      }
      else {
        ZStack {
          Color(#colorLiteral(red: 0.10591764, green: 0.08147127181, blue: 0.3474177122, alpha: 1))
            .edgesIgnoringSafeArea(.all)
        
          Text("Settings")
          .padding()
          .foregroundColor(Color.white)
          .modifier(ColorModifier())
          .cornerRadius(25)
          .modifier(ShadowModifier())
        }
        //AboutMe()
      }
      
      VStack{
        Spacer()
        FloatingTabbar(selected: self.$selected)
          .padding(.bottom, 100)
          .frame(width: screen.width, height: 20)
      }
      .edgesIgnoringSafeArea(.all)
      
      
    }.statusBar(hidden: true)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
       ContentView()
          .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
          .previewDisplayName("iPhone SE")

       ContentView()
          .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
          .previewDisplayName("iPhone 11 Pro Max")
    }
  }
}

let screen = UIScreen.main.bounds

struct FloatingTabbar : View {
  
  @Binding var selected : Int
  @State var expand = false
  
  var body : some View {
    
    HStack {
      
    
      HStack {
        
        if !self.expand {
          Button(action: {
            self.expand.toggle()
          }) {
            Image(systemName: "arrow.right")
            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .padding()
            .modifier(ShadowModifier())
          }
        }
        else {
          Button(action: {
            self.selected = 0
          }) {
            Image(systemName: "moon").foregroundColor(self.selected == 0 ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))).padding(.horizontal)
            .font(.system(size: 25, weight: .regular))
          }
          
          Spacer(minLength: 15)
          
          Button(action: {
            self.selected = 1
          }) {
            Image(systemName: "sun.max").foregroundColor(self.selected == 1 ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))).padding(.horizontal)
            .font(.system(size: 25, weight: .regular))
          }
          
          Spacer(minLength: 15)
          
          Button(action: {
            self.selected = 2
          }) {
            Image(systemName: "music.note").foregroundColor(self.selected == 2 ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))).padding(.horizontal)
            .font(.system(size: 25, weight: .regular))
          }
          
          Spacer(minLength: 15)
          
          Button(action: {
            self.selected = 3
          }) {
            Image(systemName: "gear").foregroundColor(self.selected == 3 ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))).padding(.horizontal)
            .font(.system(size: 25, weight: .regular))
          }
        }
        
      }
      
        .padding(.vertical,self.expand ? 20 : 8)
        .padding(.horizontal, self.expand ? 25: 8)
        .modifier(ColorModifier())
        .clipShape(Capsule())
        .padding(.horizontal, 20)
        .onTapGesture {
          self.expand.toggle()
        }
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
        .offset(y:10)
    Spacer(minLength: 0)
    }
  }
}


struct TimeBox: View {
  var cycle : Double
  let dateFormatter = DateFormatter()

   func getTime(cycle: Double) -> String {
     dateFormatter.timeZone = .current
     dateFormatter.dateFormat = "h:mm a"
     return dateFormatter.string(from: Date().addingTimeInterval(((90.0 * cycle)+15) * 60.0))
   }
  var body: some View {
    Text("\(self.getTime(cycle: cycle))")
      .font(.system(size: 22, weight: .regular))
      .foregroundColor(Color.white)
      .frame(maxWidth:screen.width, maxHeight:60)
      .background(Color("Accent1"))
      .cornerRadius(20)
  }
}

struct TimeBoxReverse: View {
  var cycle : Double
  @Binding var date : Date
  let dateFormatter = DateFormatter()

   func getTime(cycle: Double) -> String {
     dateFormatter.timeZone = .current
     dateFormatter.dateFormat = "h:mm a"
     return dateFormatter.string(from: date.addingTimeInterval(-((90.0 * cycle)+15) * 60.0))
   }
  var body: some View {
    Text("\(self.getTime(cycle: cycle))")
      .font(.system(size: 25, weight: .regular))
      .foregroundColor(Color.white)
      .frame(maxWidth:screen.width, maxHeight:60)
      .background(Color("Accent1"))
      .cornerRadius(20)
  }
}



extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct HomeHeader: View {
  
  let dateFormatter = DateFormatter()

  func getCurrentTime(cycle: Double) -> String {
    dateFormatter.timeZone = .current
    dateFormatter.dateFormat = "h:mm a"
    return dateFormatter.string(from: Date())
  }
  
  var body: some View {
    
    ZStack {
      VStack() {
        Text("")
        .frame(maxWidth: .infinity)
        .frame(height: 140)
        .modifier(ColorModifier())
        .cornerRadius(50, corners: [.bottomLeft])
        .modifier(ShadowModifier())
        Spacer()
      }
      .edgesIgnoringSafeArea(.all)
      VStack {
        VStack {
          Text("Good Evening")
            .font(.system(size: 45, weight: .semibold))
            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
          Text("The time is  \(getCurrentTime(cycle: 0.0))")
            .font(.system(size: 22, weight: .light))
            .foregroundColor(.white)
        }
        
        Spacer()
      }
    }
  }
}

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct ColorModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
    .background(
      LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3706487417, green: 0.1442098618, blue: 0.8079112172, alpha: 1)), Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))]), startPoint: .bottomLeading, endPoint: .trailing)
      //Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
    )
  }
}

struct WhenToWake: View {
  var body: some View {
    VStack {
      
      Spacer()
      
      Text("If you go to sleep now, wake up at one of these times:")
        .foregroundColor(Color.white)
        .font(.system(size: 22, weight: .regular))
        .frame(maxWidth:screen.width - 110, maxHeight: 75)
        .padding()
        .background(Color("Accent1"))
        .cornerRadius(20)
      
      
      Spacer()
      
      HStack {
        Spacer()
        TimeBox(cycle:1.0)
        Spacer()
        TimeBox(cycle:2.0)
        Spacer()
      }
      .padding(10)
      HStack {
        Spacer()
        TimeBox(cycle:3.0)
        Spacer()
        TimeBox(cycle:4.0)
        Spacer()
      }
      .padding(10)
      HStack {
        Spacer()
        TimeBox(cycle:5.0)
        Spacer()
        TimeBox(cycle:6.0)
        Spacer()
      }
      .padding(10)
      
      Spacer()
    }
    .frame(maxWidth:.infinity)
    .modifier(ColorModifier())
    .cornerRadius(30)
    .offset(y: 50)
  }
}

struct AboutMe: View {
  var body: some View {
    ZStack {
      Color(#colorLiteral(red: 0.10591764, green: 0.08147127181, blue: 0.3474177122, alpha: 1))
        .edgesIgnoringSafeArea(.all)
      VStack {
        
        Text("About The Developer")
          .font(.system(size: 35, weight: .semibold))
          .padding(.top, 30)
          .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
          .padding()
          .frame(maxWidth: .infinity)
          .background(
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3706487417, green: 0.1442098618, blue: 0.8079112172, alpha: 1)), Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1))]), startPoint: .bottomLeading, endPoint: .trailing)
        )
          .cornerRadius(50, corners: [.bottomLeft])
          .modifier(ShadowModifier())
        
        
        Image("CasualAvatar").resizable()
          .frame(width: 200, height: 200, alignment: .center)
          .aspectRatio(contentMode: .fill)
          .cornerRadius(100)
          .padding(.bottom, 30)
          .modifier(ShadowModifier())
        
        VStack {
          Text("My name is Dominick Lee and I am a student at UC San Diego. I built this app as a personal project and I would love your feedback!")
            .padding(20)
        }
        .foregroundColor(Color.white)
        .modifier(ColorModifier())
        .cornerRadius(25)
        .multilineTextAlignment(.center)
        .lineSpacing(10)
        .frame(width:screen.width - 30)
        .modifier(ShadowModifier())
        
        
        VStack {
          Button("Check out my website here") {
            UIApplication.shared.open(URL(string: "https://dominicklee.net")!)
          }
          .foregroundColor(Color.white)
          .padding()
          .background(
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)), Color(#colorLiteral(red: 0.09411764706, green: 0.4392156863, blue: 0.6274509804, alpha: 1))]), startPoint: .bottomLeading, endPoint: .trailing)
          )
            .cornerRadius(25)
            .modifier(ShadowModifier())
        }
        .padding()
        
        Spacer()
      }.edgesIgnoringSafeArea(.top)
      
    }
  }
}
