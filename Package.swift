// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ManualResume",
    platforms: [
        .iOS(.v13), // Minimum iOS version
        .macOS(.v10_15), // Adjust as needed for macOS
        .watchOS(.v6), // Adjust as needed for watchOS
        .tvOS(.v13) // Adjust as needed for tvOS
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ManualResume",
            targets: ["ManualResume"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ManualResume"),
        .testTarget(
            name: "ManualResumeTests",
            dependencies: ["ManualResume"]),
    ]
)
