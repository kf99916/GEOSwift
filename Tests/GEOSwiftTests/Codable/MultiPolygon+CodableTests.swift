import XCTest
import GEOSwift

extension MultiPolygon {
    static let testValue = MultiPolygon(
        polygons: [.testValueWithHole, .testValueWithoutHole])
    static let testJson = #"{"coordinates":[[[[2,2,0],[-2,2,0],[-2,-2,0],[2,-2,0],[2,2"#
        + #",0]],[[1,1,0],[1,-1,0],[-1,-1,0],[-1,1,0],[1,1,0]]],[[[7,2,0],[3,2,0],[3,-2,0],[7,-2"#
        + #",0],[7,2,0]]]],"type":"MultiPolygon"}"#
}

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
final class MultiPolygon_CodableTests: CodableTestCase {
    func testCodable() {
        verifyCodable(with: MultiPolygon.testValue, json: MultiPolygon.testJson)
    }

    func testDecodableThrowsWithTypeMismatch() {
        let json = #"{"coordinates":[1],"type":"Point"}"#

        verifyDecodable(with: MultiPolygon.self, json: json, expectedError: .mismatchedGeoJSONType)
    }

    func testDecodableThrowsWithInvalidType() {
        let json = #"{"coordinates":[1],"type":"p"}"#

        verifyDecodable(with: MultiPolygon.self, json: json, expectedError: .invalidGeoJSONType)
    }
}
