//
//  ContentView.swift
//  facebook-app
//
//  Created by Pablo on 09/07/21.
//

import SwiftUI

/**
 Comments added to this class.
 */
struct ContentView: View {
    
    @Binding var text: String
    
    let images = ["img1", "img2", "img3", "img4", "img5", "img6", "img7", "img8", "img9"]
    let facebookBlue  = UIColor(red: 23/255.0, green: 120/255.0, blue: 242/255.0, alpha:1)
    
    var body: some View {
        VStack {
            HStack {
                Text("Ian Book")
                    .font(.system(size: 48, weight: .bold, design: .default))
                    .foregroundColor(Color(facebookBlue))
                
                Spacer()
                
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .foregroundColor(Color(.secondaryLabel))
            }
            .padding()
            
            TextField("Busca a tus primos...", text: $text )
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(5, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, 15)
            
            ZStack{
                Color(.secondarySystemBackground)
                
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                    VStack {
                     
                        ScrollView(.horizontal, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 3, content: {
                                
                                ForEach(images, id: \.self ) { name in
                                    
                                 Image(name)
                                    .resizable()
                                    .frame(width: 220, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .background(Color(.systemBlue))
                                    .cornerRadius(13, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                }
                                
                            })
                            .padding(5)
                        })
                    }
                    
                    
                    FBPost(profilePic: "ian-profile", profileName: "Ian Pablo", postComment: "Hola, primos, miren la app de facebook que me acaba de hacer mi papá con su nueva Mac M1.", postTimeComment: "Hace 10 minutos")
                    
                    FBPost(profilePic: "angel-profile", profileName: "Angel", postComment: "Que bien, me diverti mucho cuando fuimos a la explanada!!", postTimeComment: "Hace 8 minutos")
                    
                    FBPost(profilePic: "naho-profile", profileName: "Nahomi", postComment: "El Angel, andaba corriendo mucho y se caia a cada rato!!", postTimeComment: "Hace 5 minutos")
                    
                    Spacer()
                    
                })
            }
            .cornerRadius(13, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .padding(10)
            
            Spacer()
            
        }
        .padding(10)
    }
}


struct FBPost : View {
    
    @State var isLiked: Bool = false
    
    var profilePic: String
    var profileName: String
    var postComment: String
    var postTimeComment: String
    
    var body: some View {
        VStack {
            HStack {
                Image(profilePic)
                    .resizable()
                    .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .cornerRadius(30)
                
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 3, content: {
                    HStack {
                        Text(profileName)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            
                        Spacer()
                    }
                    HStack {
                        Text(postTimeComment)
                            .font(.system(size: 12, weight: .light, design: .default))
                            .foregroundColor(Color(.secondaryLabel))
                        Spacer()
                    }
                })
                
                Spacer()
            }
            
            HStack {
                Text(postComment)
                    .font(.system(size: 24, weight: .regular, design: .default))
                    .multilineTextAlignment(.leading)
            }
            Spacer()
            HStack {
                Button(action: {
                    isLiked.toggle()
                }, label: {
                    Text( isLiked ? "Liked" : "Like")
                })
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Comment")
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Share")
                })

            }
            .padding()
            
        }
        .padding(5)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: .constant(""))
    }
}
