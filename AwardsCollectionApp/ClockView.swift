//
//  ClockView.swift
//  AwardsCollectionApp
//
//  Created by Nadzeya Shpakouskaya on 16/11/2021.
//

import SwiftUI

///Should be define with square frame (equal height and width)
struct ClockView: View {
    let color: Color
    
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let size = min(width, height)
            let middle = size / 2
            let lineWidth = size * 0.025
 
            LeftTopButton(width: width, height: height)
                .stroke(color, style: StrokeStyle(lineWidth: lineWidth))
    
            RightTopButton(width: width, height: height)
                .stroke(color, style: StrokeStyle(lineWidth: lineWidth))
            
            Path { path in
                path.addArc(center: CGPoint(x: middle, y: middle),
                            radius: size / 4.5,
                            startAngle: .degrees(0),
                            endAngle: .degrees(360),
                            clockwise: true)
            }.stroke(color, style: StrokeStyle(lineWidth: lineWidth))
            
            ClockBottom(width: width, height: height)
                .stroke(color, style: StrokeStyle(lineWidth: lineWidth))
            
            Path { path in
                path.move(to: CGPoint(x: middle + 2, y: middle))
                path.addLine(to: CGPoint(x: middle - middle/2.75, y: middle))
            }.stroke(color, style: StrokeStyle(lineWidth: lineWidth))
            
            Path { path in
                path.move(to: CGPoint(x: middle, y: middle + 2))
                path.addLine(to: CGPoint(x: middle, y: middle - middle/3))
            }.stroke(color, style: StrokeStyle(lineWidth: lineWidth))
            
        }
    }
}
struct ClockBottom: Shape {
    let width: Double
    let height: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: width * 0.35, y: height * 0.675))
        path.addLine(to: CGPoint(x: width * 0.3, y: height * 0.775))
        path.addQuadCurve(
            to: CGPoint(x: width * 0.35, y: height * 0.8),
            control: CGPoint(x: width * 0.25, y: height * 0.875)
        )
        path.addLine(to: CGPoint(x: width * 0.4, y: height * 0.75))
        path.addLine(to: CGPoint(x: width * 0.6, y: height * 0.75))
        path.addLine(to: CGPoint(x: width * 0.65, y: height * 0.8))
        path.addQuadCurve(
            to: CGPoint(x: width * 0.7, y: height * 0.775),
            control: CGPoint(x: width * 0.75, y: height * 0.8755)
        )
        path.addLine(to: CGPoint(x: width * 0.65, y: height * 0.675))
        return path
    }
    
}


struct RightTopButton: Shape {
    let width: Double
    let height: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: width * 0.575, y: height * 0.3))
        path.addLine(to: CGPoint(x:width * 0.625, y: height * 0.25))
        path.addQuadCurve(
            to: CGPoint(x: width * 0.75, y: height * 0.375),
            control: CGPoint(x: width * 0.725, y: height * 0.275)
        )
        path.addLine(to: CGPoint(x: width * 0.7, y: height * 0.425))
        return path
    }
    
}


struct LeftTopButton: Shape {
    let width: Double
    let height: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: width * 0.425, y: height * 0.3))
        path.addLine(to: CGPoint(x: width * 0.375, y: height * 0.25))
        path.addQuadCurve(
            to: CGPoint(x:width * 0.25, y: height * 0.375),
            control: CGPoint(x: width * 0.275, y: height * 0.275)
        )
        path.addLine(to: CGPoint(x: width * 0.3, y: height * 0.425))
        return path
    }
}


struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView(color: .red)
            .frame(width: 400, height: 400)
    }
}
