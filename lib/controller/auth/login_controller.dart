import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var obscurePassword = true.obs;
  var rememberMe = false.obs;
  var formKey = GlobalKey<FormState>().obs;

  void togglePasswordVisibility() {
    obscurePassword.toggle();
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  void signIn() {
    if (formKey.value.currentState!.validate()) {
      // Validation passed
      Get.offAllNamed("/homeScreen");
    }
  }
}
