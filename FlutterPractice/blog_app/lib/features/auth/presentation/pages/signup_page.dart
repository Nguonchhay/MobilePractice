import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/auth/presentation/pages/signin_page.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/gradient_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const routeName = '/signup';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onPressed() {
    formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign Up.',
                style: TextStyle(
                  color: AppPallete.whiteColor,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              AuthTextField(
                  hintText: 'Full Name', fieldController: fullNameController),
              const SizedBox(
                height: 15.0,
              ),
              AuthTextField(
                hintText: 'Email',
                fieldController: emailController,
              ),
              const SizedBox(
                height: 15.0,
              ),
              AuthTextField(
                hintText: 'Password',
                fieldController: passwordController,
                isObscureText: true,
              ),
              const SizedBox(
                height: 15.0,
              ),
              AuthGradientButton(
                label: 'Sign Up',
                onPress: _onPressed,
              ),
              const SizedBox(
                height: 15.0,
              ),
              RichText(
                text: TextSpan(
                  text: "Already have an account?",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: ' Sign In',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppPallete.gradient2,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).pushNamed(SignInPage.routeName),
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
