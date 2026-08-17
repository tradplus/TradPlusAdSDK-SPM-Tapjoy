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
            .exact("15.13.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Tapjoy/releases/download/15.13.0/TPTapjoyAdapter-15.13.0.xcframework.zip",
            checksum: "5fb5d4352ce5c3a5d26a27b3cef2e6b299301d637f2f3b96e5a87041e2f18696"
        ),
    ]
)
