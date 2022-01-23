import 'package:flutter/material.dart';
import 'package:quizzapp/screens/login/login.dart';
import 'package:quizzapp/screens/topics/topics.dart';
import 'package:quizzapp/services/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapchot) {
        if (snapchot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text('Loading'),
          );
        } else if (snapchot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        } else if (snapchot.hasData) {
          return const TopicsScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
