//
//  TextButton.swift
//
//
//  Created by takasqr on 2024/04/06.
//

import Foundation
import SwiftUI

@available(macOS 12.0, *)
struct TextButton: View {
    
    let label: String
    let icon: String
    let color: Color
    
    init(_ label: String, _ icon: String, _ color: Color = Color(red: 47/255, green: 88/255, blue: 205/255)) {
        
        self.label = label
        self.icon = icon
        self.color = color
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Image(systemName: icon)
                .foregroundColor(color)
            Text(label)
                .foregroundColor(color)
                .font(.headline).bold()
        }
    }
}