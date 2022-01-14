import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_flutter/screens/welcome_screen.dart';
import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flash_chat_flutter/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

// void main() => runApp(FlashChat());
// WidgetsFlutterBinding.ensureInitialized();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

String getScreen() {
  if (FirebaseAuth.instance.currentUser != null) {
    return ChatScreen.id;
  } else {
    return WelcomeScreen.id;
  }
}

class FlashChat extends StatelessWidget {
  // final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // _auth.currentUser != null ? ChatScreen.id : WelcomeScreen.id,
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
      initialRoute: getScreen(),

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
