import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import '../../../../../core/utils/helpers/helper_functions.dart';
 import '../../../../controller/auth/signp_controller.dart';
import '../../../../core/utils/validators/validation.dart';

class SignUpPage extends StatelessWidget {
  final SignUpController signUpController = Get.put(SignUpController());

  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: dark ? Colors.white : Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Form(key: signUpController.formKey.value,
                child: Column(
                  children: [
                     TextFormField(
                      validator: TValidator.validateUsername,
                      decoration: InputDecoration(
                        labelText: TTexts.username,
                        prefixIcon: const Icon(Iconsax.user),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                     TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 14,
                      validator: TValidator.validateSsn,
                      decoration: InputDecoration(
                        labelText: TTexts.ssn,
                        prefixIcon: const Icon(Iconsax.card),
                        counterText: '',
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                     TextFormField(
                      validator: TValidator.validateEmail,
                      decoration: InputDecoration(
                        labelText: TTexts.email,
                        prefixIcon: const Icon(Icons.email_outlined),
                      )),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    Obx(() => TextFormField(
                      controller: signUpController.passwordController.value,
                      validator: TValidator.validatePassword,
                      obscureText: !signUpController.isPasswordVisible.value,
                      decoration: InputDecoration(
                        labelText: TTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          icon: Icon(signUpController.isPasswordVisible.value ? Iconsax.eye : Iconsax.eye_slash),
                          onPressed: signUpController.togglePasswordVisibility,
                        ),
                      ),
                    )),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    Obx(() => TextFormField(
                      validator: (value) {
                        if (value != signUpController.passwordController.value.text) {
                          return 'Passwords do not match.';
                        }
                        return null;
                      },
                      obscureText: !signUpController.isConfirmPasswordVisible.value,
                      decoration: InputDecoration(
                        labelText: TTexts.confirmpassword,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          icon: Icon(signUpController.isConfirmPasswordVisible.value ? Iconsax.eye : Iconsax.eye_slash),
                          onPressed: signUpController.toggleConfirmPasswordVisibility,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Obx(() => Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Checkbox(
                      value: signUpController.isChecked.value,
                      onChanged: signUpController.toggleCheckbox,
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${TTexts.iAgreeTo} ",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: TTexts.privacyPolicy,
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark ? TColors.white : TColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: " ${TTexts.and} ",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: TTexts.termsOfUse,
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark ? TColors.white : TColors.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {

                    signUpController.signUp();
                  },
                  child: Text(TTexts.createAccount),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      color: dark ? TColors.darkGrey : TColors.grey,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Text(
                    TTexts.orSignUpWith,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Flexible(
                    child: Divider(
                      color: dark ? TColors.darkGrey : TColors.grey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 60,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: TColors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: TSizes.iconMd,
                        height: TSizes.iconMd,
                        image: AssetImage(TImages.google),
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: TColors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: TSizes.iconMd,
                        height: TSizes.iconMd,
                        image: AssetImage(TImages.facebook),
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: TColors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: TSizes.iconMd,
                        height: TSizes.iconMd,
                        image: AssetImage(TImages.appleLogo),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
