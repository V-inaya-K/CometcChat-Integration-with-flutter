import 'package:flutter/material.dart';
import 'package:cometchat_chat_uikit/cometchat_chat_uikit.dart';
import 'messages_screen.dart';

class ConversationsPage extends StatelessWidget {
  const ConversationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CometChatConversations(
          showBackButton: true,
          onItemTap: (conversation) {
            final target = conversation.conversationWith;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MessagesScreen(
                  user: target is User ? target : null,
                  group: target is Group ? target : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
