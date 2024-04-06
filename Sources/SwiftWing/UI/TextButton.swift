//
//  TextButton.swift
//
//
//  Created by takasqr on 2024/04/06.
//

import Foundation
import SwiftUI

public struct TextButton: View {
    
    let label: String
    let icon: String
    let color: Color
    
    public init(label: String, icon: String, color: Color) {
        self.label = label
        self.icon = icon
        self.color = color
    }
    
    init(_ label: String, _ icon: String, _ color: Color = Color(red: 47/255, green: 88/255, blue: 205/255)) {
        
        self.label = label
        self.icon = icon
        self.color = color
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            Image(systemName: icon)
                .foregroundColor(color)
            Text(label)
                .foregroundColor(color)
                .font(.headline).bold()
        }
    }
}
