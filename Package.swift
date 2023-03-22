// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "ZendeskChatSDK",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "ZendeskChatSDK",
            targets: [
                "ZendeskChatSDKTargets"
            ]
        )
    ],
    dependencies: [
        .package(name: "ZendeskChatProvidersSDK",
                 url: "https://github.com/zendesk/chat_providers_sdk_ios",
                 .exact("chat_providers_sdk_ios_version")),
        .package(name: "ZendeskMessagingSDK",
                 url: "https://github.com/zendesk/messaging_sdk_ios",
                 .exact("messaging_sdk_ios_version"))
    ],
    targets: [
        .binaryTarget(
            name: "ChatSDK",
            path: "ChatSDK.xcframework"
        ),
        .target(name: "ZendeskChatSDKTargets",
                dependencies: [
                    .target(name: "ChatSDK"),
                    .product(name: "ZendeskChatProvidersSDK", package: "ZendeskChatProvidersSDK"),
                    .product(name: "ZendeskMessagingSDK", package: "ZendeskMessagingSDK")
                ],
                path: "Sources"
        )
    ]
)
