import 'package:flutter/material.dart';
import 'package:foodpanda_sellers_app/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child:Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset("images/seller.png",
                height: 200,
                width: 200,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  data: Icons.email,
                  isObscure: false,
                ),
                CustomTextField(
                  controller: passwordController,
                  hintText: "Password",
                  data: Icons.lock,
                  isObscure: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),//adds space between the form and the button
          ElevatedButton(
            child: const Text(
              "LOGIN",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              side: const BorderSide(color: Colors.white, width: 1),
              backgroundColor: Colors.cyan,

              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
            ),
            onPressed: ()=>print("clicked"),
          ),
          const SizedBox(height: 30,),

        ],
      ),

    );
  }
}
