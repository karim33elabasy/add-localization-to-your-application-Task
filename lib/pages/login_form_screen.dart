import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_screen/data/validation_methods.dart';
import 'package:shopping_app_screen/widgets/app_text_form.dart';
import 'package:shopping_app_screen/widgets/login_dialog.dart';

class LoginFormScreen extends StatelessWidget {
  const LoginFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Form Key variable for form validation:
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    // Text Editing Controllers of form items:
    TextEditingController fullNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
       appBar: AppBar(
        title: Text(tr("loginFormTitle"),style: const TextStyle(fontWeight: FontWeight.bold),),
         centerTitle: true,
       ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppTextForm(
                  labelText: tr('fullName'),
                  controller: fullNameController,
                  validator: ValidationMethods.validateName,
                  prefixIconData: Icons.person,
                ),
                const SizedBox(height: 20,),
                AppTextForm(
                  labelText: tr('email'),
                  controller: emailController,
                  validator: ValidationMethods.validateEmail,
                  prefixIconData: Icons.email,
                ),
                const SizedBox(height: 20,),
                AppTextForm(
                  labelText: tr('password'),
                  obscureText: true,
                  controller: passwordController,
                  validator: ValidationMethods.validatePassword,
                  prefixIconData: Icons.password,
                ),
                const SizedBox(height: 20,),
                AppTextForm(
                  labelText: tr('confirmPass'),
                  obscureText: true,
                  controller: confirmPasswordController,
                  validator: (content){
                    if(content!.isEmpty){
                      return 'Password is required';
                    } else if (passwordController.text != confirmPasswordController.text){
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  prefixIconData: Icons.password,
                ),
                const SizedBox(height: 20,),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  onPressed: (){
                    if (formKey.currentState!.validate()) {
                      showDialog(context: context, builder: (context)=>const LoginDialog());
                    }else{
                      // Show a snack bar if validation is not true.
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Please fill all the fields correctly'),
                          action: SnackBarAction(label: 'Ok', onPressed: (){ScaffoldMessenger.of(context).removeCurrentSnackBar();}),
                        )
                      );
                    }
                  },
                  child: Text(tr('signUp')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
