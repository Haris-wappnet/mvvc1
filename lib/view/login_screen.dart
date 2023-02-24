import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:mvvc/view/home_screen.dart';

import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
            onTap: () {
              Utils.flushBarErrorMessage("Error message here", context);
              Utils.snackBar("Snackbar msg here", context);
              Utils.toastMessage("Psyche! That's the wrong number");
            },
            child: Center(child: Text('Login'))));
  }
}
