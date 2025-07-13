// // import 'package:flutter/material.dart';
// // import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
// // import 'cometchat_config.dart';
// // import 'package:cometchat_calls_uikit/cometchat_calls_uikit.dart';

// // void main() {
// //   WidgetsFlutterBinding.ensureInitialized();

// //   UIKitSettings uiKitSettings = (UIKitSettingsBuilder()
// //     ..subscriptionType = CometChatSubscriptionType.allUsers
// //     ..autoEstablishSocketConnection = true
// //     ..region = CometChatConfig.region
// //     ..appId = CometChatConfig.appId
// //     ..authKey = CometChatConfig.authKey
// //     ..extensions = CometChatUIKitChatExtensions.getDefaultExtensions()
// //     ..callingExtension = CometChatCallingExtension() // Optional
// //   ).build();

// //   CometChatUIKit.init(
// //     uiKitSettings: uiKitSettings,
// //     onSuccess: (message) {
// //       debugPrint("CometChat Initialized");

// //       runApp(MyApp());
// //     },
// //     onError: (e) {
// //       debugPrint("CometChat Initialization failed: ${e.message}");
// //     },
// //   );
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'CometChat Demo',
// //       debugShowCheckedModeBanner: false,
// //       home: LoginPage(),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
// import 'package:cometchat_calls_uikit/cometchat_calls_uikit.dart';
// import 'cometchat_config.dart';
// import 'login_page.dart'; // <- create this screen

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Define UIKit settings
//   UIKitSettings uiKitSettings = (UIKitSettingsBuilder()
//     ..subscriptionType = CometChatSubscriptionType.allUsers
//     ..autoEstablishSocketConnection = true
//     ..region = CometChatConfig.region
//     ..appId = CometChatConfig.appId
//     ..authKey = CometChatConfig.authKey
//     ..extensions = CometChatUIKitChatExtensions.getDefaultExtensions()
//     ..callingExtension = CometChatCallingExtension()
//   ).build();

//   // Initialize CometChat BEFORE runApp
//   await CometChatUIKit.init(
//     uiKitSettings: uiKitSettings,
//     onSuccess: (message) {
//       debugPrint("✅ CometChat Initialized");
//     },
//     onError: (e) {
//       debugPrint("❌ CometChat Init Failed: ${e.message}");
//     },
//   );

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'CometChat Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: LoginPage(), // Your login screen
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'package:cometchat_calls_uikit/cometchat_calls_uikit.dart';
import 'cometchat_config.dart';
import 'conversations_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  UIKitSettings uiKitSettings = (UIKitSettingsBuilder()
    ..subscriptionType = CometChatSubscriptionType.allUsers
    ..autoEstablishSocketConnection = true
    ..region = CometChatConfig.region
    ..appId = CometChatConfig.appId
    ..authKey = CometChatConfig.authKey
    ..extensions = CometChatUIKitChatExtensions.getDefaultExtensions()
    ..callingExtension = CometChatCallingExtension()
  ).build();

  await CometChatUIKit.init(
    uiKitSettings: uiKitSettings,
    onSuccess: (message) async {
      debugPrint("✅ CometChat Initialized");

      await CometChatUIKit.login(
        'cometchat-uid-1',
        onSuccess: (_) => debugPrint('✅ Login Successful'),
        onError: (err) => debugPrint('Login Failed: ${err.message}'),
      );
    },
    onError: (e) => debugPrint("❌ CometChat Initialization Failed: ${e.message}"),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CometChat Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const ConversationsPage(),
    );
  }
}