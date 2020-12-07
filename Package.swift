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
            targets: [ "ZendeskChatSDKTargets" ]
        )
    ],
    dependencies: [
        .package(name: "ZendeskChatProvidersSDK",
                 url: "https://github.com/zendesk/chat_providers_sdk_ios",
                 from: "2.10.0"),
        .package(name: "ZendeskMessagingSDK",
                 url: "https://github.com/zendesk/messaging_sdk_ios",
                 from: "3.8.1")
    ],
    targets: [
        .binaryTarget(
            name: "ZendeskChatSDK",
            path: "ChatSDK.xcframework"
        ),
        .target(name: "ZendeskChatSDKTargets",
                dependencies: [
                    .target(name: "ZendeskChatSDK"),
                    .product(name: "ZendeskChatProvidersSDK", package: "ZendeskChatProvidersSDK"),
                    .product(name: "ZendeskMessagingSDK", package: "ZendeskMessagingSDK")
                ],
                path: "Sources"
        )
    ]
)
