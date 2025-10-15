import 'package:flutter/material.dart';

class Widgetdados extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final bool obscureText;
  final VoidCallback? toggleObscure;

  const Widgetdados({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.obscureText = false,
    this.toggleObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          obscureText: obscureText,
          style: const TextStyle(color: Colors.green),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 92, 17, 128),
                width: 2,
              ),
            ),
            labelText: label,
            hintText: hint,
            labelStyle: const TextStyle(color: Colors.white),
            hintStyle: const TextStyle(color: Colors.white70),
            prefixIcon: Icon(icon, color: Colors.white),
            suffixIcon: obscureText
                ? IconButton(
                    onPressed: toggleObscure,
                    icon: const Icon(Icons.visibility, color: Colors.white),
                  )
                : null,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
