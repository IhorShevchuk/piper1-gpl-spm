// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "piper1-gpl",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "piper1-gpl",
            targets: ["piper"])
    ],
    dependencies: [
        .package(url: "https://github.com/IhorShevchuk/espeak-ng-spm.git",
                 from: "2025.9.17"
                 )
    ],
    targets: [
        .target(name: "piper",
                dependencies: [
                    .product(name: "libespeak-ng", package: "espeak-ng-spm"),
                    .target(name: "onnxruntime")
                ],
                path: "",
                sources: [
                    "piper1-gpl/libpiper/src/piper.cpp"
                ],
                publicHeadersPath: "piper1-gpl/libpiper/include",
                cxxSettings: [
                    .headerSearchPath("piper-spm/headers")
                ]
               ),
        .binaryTarget(name: "onnxruntime",
                            url: "https://download.onnxruntime.ai/pod-archive-onnxruntime-c-1.22.0.zip",
                            // SHA256 checksum
                            checksum: "90d9de5a139087a6b05a18125d01d01d198820e1731e6f0f11b38749b2ab181f")
    ],
    cxxLanguageStandard: .cxx17
)

