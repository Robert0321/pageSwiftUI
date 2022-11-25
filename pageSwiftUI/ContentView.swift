//
//  ContentView.swift
//  pageSwiftUI
//
//  Created by robert on 2022/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var Currentpage = 0
    @State private var selectedIndex = 0
    let bags = ["FAUXSHEARLING","MATTEEFFECT","NYLON BUCKET"]
    
    var body: some View {
//
//        VStack{
//            Picker(selection: $selectedIndex){
//                ForEach(bags.indices){ item in
//                    Text(bags[item])
//                }
//            }label:{
//                Text("Chooses")
//            }
//            .pickerStyle(.segmented)
//
//            }
            

            ZStack{
                if Currentpage == 0{
                    Image("FAUXSHEARLING").resizable().frame(height: 350).cornerRadius(20).padding()
                    Text("Tote bag with two inner compartments.").position(x:200,y: 700)
                }
                else if Currentpage == 1{
                    Image("MATTEEFFECT").resizable().frame(height: 350).cornerRadius(20).padding()
                    Text("Long shoulder bag. Long tubular straps.").position(x:200,y: 700)
                }
                else{
                    Image("NYLON BUCKET").resizable().frame(height: 350).cornerRadius(20).padding()
                    Text("Minimalist leather crossbody bag").position(x:200,y: 700)
                    
                }
                pageControl(current:Currentpage).position(x:200,y: 570)
                
                HStack{
                    
            
                    Button(action: {
                        if self.Currentpage != 0{
                           self.Currentpage -= 1
                        }
                        
                    }) {
                        Text("Prev").padding(15)
                        
                    }.background(Color.orange)
                     .cornerRadius(10)
                     .foregroundColor(.black)
                     .position(x:100, y:600)
                    
                    Button(action: {
                        if self.Currentpage < 2{
                           self.Currentpage += 1
                        }
        
                    }) {
                        Text("Next").padding(15)
                        
                    }.background(Color.orange)
                     .cornerRadius(10)
                     .foregroundColor(.black)
                     .position(x:100, y:600)
                }.padding()

            }.animation(.spring())
        }
    }
    
        struct pageControl : UIViewRepresentable {
            
            var current = 0
            
            func makeUIView(context: UIViewRepresentableContext<pageControl>) -> pageControl.UIViewType {
                
                let page = UIPageControl()
                page.currentPageIndicatorTintColor = .black
                page.numberOfPages = 3
                page.pageIndicatorTintColor = .gray
                return page
            }
            
            func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<pageControl>) {
                uiView.currentPage = current
            }
        }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
