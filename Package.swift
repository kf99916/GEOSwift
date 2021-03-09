// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "GEOSwift",
    platforms: [.iOS(.v9), .macOS("10.9"), .tvOS(.v9)],
    products: [
        .library(name: "GEOSwift", targets: ["GEOSwift"])
    ],
    targets: [
        .target(
            name: "GEOSwift",
            path: "./GEOSwift/"
        ),
        .testTarget(
            name: "GEOSwiftTests",
            dependencies: ["GEOSwift"],
            path: "./GEOSwiftTests/"
        )
    ]
)
