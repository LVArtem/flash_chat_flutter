import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_flutter/screens/welcome_screen.dart';
import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flash_chat_flutter/screens/chat_screen.dart';

// void main() => runApp(FlashChat());
// WidgetsFlutterBinding.ensureInitialized();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          textTheme: TextTheme(
              bodyText2: TextStyle(color: Colors.black54),
              subtitle1: TextStyle(
                  color: Colors
                      .black)), //меняет цвет заполненного текста в TextField
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
                color:
                    Colors.black54), //меняет цвет текста подсказки в TextField
          )),
      initialRoute: WelcomeScreen.id,
      // home: WelcomeScreen(),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
