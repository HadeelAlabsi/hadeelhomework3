import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import '../controllers/auth_controller.dart';
import '../hadeel_button.dart';
import '../theme/hadeel_colors.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final authController = Get.find<AuthController>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top Wave
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: WaveWidget(
              config: CustomConfig(
                colors: [HadeelColors.primaryColor],
                durations: [5000],
                heightPercentages: [0.2],
              ),
              backgroundColor: Colors.transparent,
              size: const Size(double.infinity, 100),
              waveAmplitude: 20,
            ),
          ),
          // Login Form
          Center(
            child: Card(
              margin: const EdgeInsets.all(20),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'البريد الإلكتروني',
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'الرجاء إدخال البريد الإلكتروني';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'كلمة المرور',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'الرجاء إدخال كلمة المرور';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      HadeelButton(
                        text: 'تسجيل الدخول',
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            Get.to(() => const HomeScreen());
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Bottom Wave
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: WaveWidget(
              config: CustomConfig(
                gradients: [
                  [HadeelColors.secondaryColor, HadeelColors.primaryColor],
                ],
                durations: [5000],
                heightPercentages: [0.2],
              ),
              size: const Size(double.infinity, 100),
            ),
          ),
        ],
      ),
    );
  }
}
