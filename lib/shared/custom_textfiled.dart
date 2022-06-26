// ignore_for_file: prefer_const_constructors, implementation_imports, unused_import, unnecessary_import

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
  final TextInputType textInputTypee;
  final bool isPassword;
  final String hinttexttt;

  MyTextFiled({
    super.key,
    required this.textInputTypee,
    required this.isPassword,
    required this.hinttexttt,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        keyboardType: textInputTypee,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hinttexttt,
          // To delete borders
          enabledBorder: OutlineInputBorder(
            borderSide: Divider.createBorderSide(context),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          // fillColor: Colors.red,
          filled: true,
          contentPadding: const EdgeInsets.all(8),
        ));
  }
}
