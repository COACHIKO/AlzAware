import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance =>Get.find();
  var formKey = GlobalKey<FormState>().obs;

  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isChecked = false.obs;
  var passwordController = TextEditingController().obs;

  @override
  void onClose() {
    passwordController.value.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }

  void signUp() {
    if (formKey.value.currentState!.validate()) {
      // Validation passed
     // Get.offAllNamed("/homeScreen");
    }
  }
}
