// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusTapjoyAdapter",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "TradPlusTapjoyAdapter",
            targets: ["TradPlusTapjoyAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.14.0")
        ),
        .package(
            url: "https://github.com/Tapjoy/swift-packages.git",
            .exact("13.4.0")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusTapjoyAdapter",
            dependencies: [
                .target(name: "TPTapjoyAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "Tapjoy", package: "swift-packages"),
            ],
            path: ".",
            sources: ["Sources/TradPlusTapjoyAdapter/TradPlusTapjoyAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPTapjoyAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Tapjoy/releases/download/15.14.0/TPTapjoyAdapter-15.14.0.xcframework.zip",
            checksum: "0240eb183bbb6c7b34669d5dbba266f9d7c2cb9d081cbf132e8ac3762216aafc"
        ),
    ]
)
