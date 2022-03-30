// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "ZendeskChatSDK",
    platforms: [
        .iOS(.v10)
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
                 .exact("2.11.3")),
        .package(name: "ZendeskMessagingSDK",
                 url: "https://github.com/zendesk/messaging_sdk_ios",
                 .exact("3.8.4"))
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
