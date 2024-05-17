import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController fieldController;
  final bool isObscureText;
  
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.fieldController,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldController,
      obscureText: isObscureText,
      decoration: InputDecoration(
        hintText: hintText
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText is empty";
        }
        return null;
      },
    );
  }
}