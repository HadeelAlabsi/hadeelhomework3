import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;
  final isPasswordVisible = false.obs;

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;

      if (email.isEmpty || !GetUtils.isEmail(email)) {
        throw 'الرجاء إدخال بريد إلكتروني صحيح';
      }

      if (password.isEmpty || password.length < 6) {
        throw 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
      }

      await Future.delayed(const Duration(seconds: 1));

      Get.offNamed('/home');
      showSuccessMessage('تم تسجيل الدخول بنجاح');
    } catch (e) {
      showErrorMessage(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void showSuccessMessage(String message) {
    Get.snackbar(
      'نجاح',
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

  void showErrorMessage(String message) {
    Get.snackbar(
      'خطأ',
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void logout() {
    Get.offAllNamed('/login');
    showSuccessMessage('تم تسجيل الخروج بنجاح');
  }
}
