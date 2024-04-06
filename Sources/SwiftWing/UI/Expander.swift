//
//  Expander.swift
//
//
//  Created by takasqr on 2024/04/06.
//

import Foundation
import SwiftUI

@available(macOS 12.0, *)
struct Expander: View {
    /// タイトル
    let title: String
    /// 本文
    let content: String
    /// 詳細エリアを開くかどうか
    @State var showDetail: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    HStack {
                        Text(title)
                            .font(.title2)
                            .bold()
                        
                        Spacer()
                    }
                    
                    if showDetail == true {
                        
                        HStack {
                            //
                            Text(content)
                                .foregroundColor(Color(red: 51/255, green: 53/255, blue: 86/255))
                                .bold()
                            
                            Spacer()
                        }
                        .padding(.top, 5)
                        
                    }
                }
                Spacer()
            }
            .padding(15)
            .background(.white)
            .cornerRadius(30)
            .shadow(color: .gray.opacity(0.4), radius: 15)
            .onTapGesture(perform: {
                // 表示切り替え
                self.showDetail.toggle()
            })
        }
    }
}
