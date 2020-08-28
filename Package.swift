// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let _package = Package(
    name: "mapbox-gl-native-ios",
    products: [
        .library(name: "mapbox-gl-native-ios", targets: ["Mapbox"]),
    ],
    dependencies: [
        .package(url: "https://github.com/skelpo/mapbox-events-ios.git", .branch("master")),
        .package(url: "https://github.com/skelpo/MBGLCore.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "Mapbox",
            dependencies: [
                .product(name: "mapbox-events-ios", package: "mapbox-events-ios"),
                .product(name: "MBGLCore", package: "MBGLCore")
            ],
            path: "platform/",
            exclude: [
                "darwin/app/",
                "darwin/docs/",
                "darwin/include/mbgl/util/image+MGLAdditions.hpp",
                "darwin/resources/",
                "darwin/scripts/",
                "darwin/src/MGLStyleLayer.mm.ejs",
                "darwin/src/MGLLight.mm.ejs",
                "darwin/src/MGLStyleLayer.h.ejs",
                "darwin/src/CFHandle.hpp",
                "darwin/src/MGLLight.h.ejs",
                "darwin/src/MGLStyleLayer_Private.h.ejs",
                "darwin/test/",
                "darwin/ci.xcconfig",
                "darwin/darwin.xcconfig",
                "darwin/loop-files.json",
                "darwin/README.md",

                "ios/app/",
                "ios/benchmark/",
                "ios/framework/Info-static.plist",
                "ios/framework/Info.plist",
                "ios/framework/strip-framwork.sh",
                "ios/framework/modulemap",
                "ios/docs/",
                "ios/framework/strip-frameworks.sh",
                "ios/Integration Test Harness/",
                "ios/Integration Tests/",
                "ios/originals/",
                "ios/resources/",
                "ios/scripts/",
                "ios/test/",
                "ios/vendor/mapbox-accounts-ios/libmbxaccounts.a",
                "ios/Mapbox/",
                "ios/CHANGELOG.md",
                "ios/DEVELOPING.md",
                "ios/INSTALL.md",
                "ios/README.md",
                "ios/config.cmake",
                "ios/toolchain.cmake",
                "ios/ios.xcconfig",
                "ios/jazzy.yml",
                "ios/core-files.json",
                "ios/sdk-files.json",
                "ios/Mapbox-iOS-SDK-snapshot-dynamic.podspec",
                "ios/Mapbox-iOS-SDK-stripped.podspec",
                "ios/Mapbox-iOS-SDK.podspec",
                "ios/WorkspaceSettings.xcsettings",

                "macos/"
            ],
            publicHeadersPath: "platform/",
            swiftSettings: [
                .unsafeFlags([
                    "--build-system", "xcode",
                    "-Xxcbuild", "--buildParametersFile",
                    "-Xxcbuild", "$PWD/swift_package_manager_build_parameters.json"
                ])
            ]
        )
    ]
)
