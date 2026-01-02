// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GTCommonSDK",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "GTCommonSDK",
            targets: ["GTCommonSDK"]
        ),
        .library(
            name: "GTCommonSDKResolv",
            targets: ["GTCommonSDKResolv"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        // 这是官方的 sdk 内容
        // .binaryTarget(name: "GTCommonSDKPackage", path: "GTCommonSDK.xcframework")
        .binaryTarget(name: "GTCommonSDK", path: "GTCommonSDK.xcframework"),
        // 添加系统的 resolv 依赖
        .target(
            name: "GTCommonSDKResolv",
            linkerSettings: [
                .linkedLibrary("resolv")
            ]
        )
    ]
)
