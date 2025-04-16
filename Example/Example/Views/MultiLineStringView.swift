import Foundation
import SwiftUI
import GEOSwift

struct MultiLineStringView: View {
    var identifiableMultiLineString: IdentifiableMultiLineString
    var gridGeometry: GeometryProxy
    
    var body: some View {
        ZStack {
            ForEach(identifiableMultiLineString.lineStrings, id: \.id) { lineString in
                LineStringView(identifiableLineString: lineString, gridGeometry: gridGeometry)
            }
        }
    }
}
