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
            .exact("15.12.0")
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
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Tapjoy/releases/download/15.12.0/TPTapjoyAdapter-15.12.0.xcframework.zip",
            checksum: "a522ceb9ffc6737018f9db577e5ef59aaf26a3c647515aa39e79e955c5cdf44a"
        ),
    ]
)
