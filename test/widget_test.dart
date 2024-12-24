import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:hadeelhomework3/controllers/auth_controller.dart';
import 'package:hadeelhomework3/controllers/theme_controller.dart';
import 'package:hadeelhomework3/screens/login_screen.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    Get.put(AuthController());
    Get.put(ThemeController());
  });

  tearDown(() {
    Get.reset(); // تنظيف GetX بعد كل اختبار
  });

  testWidgets('Login screen shows correctly', (WidgetTester tester) async {
    // اختبار LoginScreen مباشرة بدلاً من MyApp
    await tester.pumpWidget(
      MaterialApp(
        home: LoginScreen(),
      ),
    );
    await tester.pump();

    // التحقق من وجود عناصر شاشة تسجيل الدخول
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('تسجيل الدخول'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
