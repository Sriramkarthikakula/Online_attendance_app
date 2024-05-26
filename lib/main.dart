
import 'package:attendance/screens/faculty_main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:attendance/screens/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() async {

  // Ensure that Firebase is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyCeMmJDX1d2rM7lqvZTpraRI4CI1y4PY4k',
      appId: '1:91348246199:android:882747af209aacc67e7732',
      messagingSenderId: '91348246199',
      projectId: 'attendance-e35d5',
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isLoggedIn ? Faculty_main() : LoginPage(),
    );
  }
}
