// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GTCommonSDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "GTCommonSDK",
            targets: ["GTCommonSDK"]
        )
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "GTCommonSDKBinary",  // 重命名二进制 target 以避免冲突
            path: "GTCommonSDK.xcframework"
        ),
        .target(
            name: "GTCommonSDK",
            dependencies: [
                "GTCommonSDKBinary"  // 让这个 wrapper target 依赖二进制文件
            ],
            linkerSettings: [
                .linkedLibrary("resolv")  // 在这里声明链接，它会随 target 传递
            ]
        )
    ]
)
