//
//  ProfileView.swift
//  TestOnboarding
//
//  Created by Дмитрий Спичаков on 24.06.2022.
//

import SwiftUI

struct ProfileView: View {
    
    // MARK: PROPERTIES
    
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signedIn") var currentUserSignedIn: Bool = false
    
    // MARK: BODY
    
    var body: some View {
        VStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150, alignment: .center)
            Text(currentUserName ?? "Jora")
            Text("\(currentUserAge ?? 18)")
            Text(currentUserGender ?? "cheburek")
            
            Text("SIGN OUT")
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.black)
                .cornerRadius(10)
                .onTapGesture {
                    signOut()
                }
        }
        .font(.title)
        .foregroundColor(.purple)
        .padding()
        .padding(.vertical, 30)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }

    func signOut() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        withAnimation(.spring()) {
            currentUserSignedIn = false
        }
    }
    
}

// MARK: PREVIEW

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
