import 'package:flutter/cupertino.dart';
import 'package:quizzapp/screens/about/about.dart';
import 'package:quizzapp/screens/home/home.dart';
import 'package:quizzapp/screens/login/login.dart';
import 'package:quizzapp/screens/profile/profile.dart';
import 'package:quizzapp/screens/quiz/quiz.dart';
import 'package:quizzapp/screens/topics/topics.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/about': (context) => const AboutScreen(),
  '/login': (context) => const LoginScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/topics': (context) => const TopicsScreen()
};
