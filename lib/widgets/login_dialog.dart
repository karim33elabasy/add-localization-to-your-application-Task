import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_screen/pages/home_screen.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("${tr("wellDone")} !"),
      content: Text("${tr("accountCreated")}."),
      actions: [
        OutlinedButton(
          onPressed: (){
            // for closing the dialog.
            Navigator.pop(context);
            // Navigation to home screen.
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context)=> const HomeScreen())
            );
          },
          child: Text(tr("close"))
        )
      ],
    );
  }
}
