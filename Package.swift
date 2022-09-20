// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ShortcutRecorder",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_13)
    ],
    products: [
        .library(name: "ShortcutRecorder", targets: ["ShortcutRecorderTarget"])
    ],
    targets: [
		.target(
			name: "ShortcutRecorderTarget",
			dependencies: [.target(name: "ShortcutRecorder",
						  condition: .when(platforms: [.macOS]))],
			path: "SwiftPM-PlatformExclude/ShortcutRecorderWrap"
		),
        .target(
            name: "ShortcutRecorder",
            exclude: [
                "Info.plist",
                "Resources/ShortcutRecorder.sketch",
                "Resources/export-ShortcutRecorder-slices.py"
            ],
            resources: [
                .process("Resources"),
                .copy("../../LICENSE.txt"),
                .copy("../../ATTRIBUTION.md"),
            ],
            publicHeadersPath: "include"
        ),
        .testTarget(
            name: "ShortcutRecorderTests",
            dependencies: ["ShortcutRecorder"],
            exclude: [
                "Info.plist"
            ]
        )
    ]
)
