// ignore_for_file: prefer_const_constructors

import 'package:flower/pages/checkout.dart';
import 'package:flower/pages/details_screen.dart';
import 'package:flower/pages/home.dart';
import 'package:flower/pages/sign_in.dart';
import 'package:flower/pages/register.dart';
import 'package:flower/pages/verify_email.dart';
import 'package:flower/provider/cart.dart';
import 'package:flower/provider/google_signin.dart';

import 'package:flower/shared/snackbar.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return Cart();
        }),
        ChangeNotifierProvider(create: (context) {
          return GoogleSignInProvider();
        }),
      ],
      child: MaterialApp(
          title: "myApp",
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              } else if (snapshot.hasError) {
                return showSnackBar(context, "Something went wrong");
              } else if (snapshot.hasData) {
                // return VerifyEmailPage();
                return Home(); // home() OR verify email
              } else {
                return Login();
              }
            },
          )),
    );
  }
}
