import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newflutterstart/provider/toggle_provider.dart';

class AuthPage extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer(builder: (context, ref, child) {
      final isLogin = ref.watch(loginProvider);
      final image = ref.watch(imageProvider);
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: ListView(
              children: [
                Text(
                  isLogin == true ? 'Login Form' : 'Sign Up Form',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 25,
                ),
                if (isLogin == false)
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(hintText: 'Username'),
                  ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: mailController,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passController,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    ref.read(imageProvider.notifier).imageSelect();
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: image == null
                        ? Center(child: Text('please select an image'))
                        : Image.file(File(image.path)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(onPressed: () {}, child: Text('Submit')),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(isLogin == true
                        ? 'Don\t have an account ?'
                        : 'Already Have an account'),
                    TextButton(
                        onPressed: () {
                          ref.read(loginProvider.notifier).toggle();
                        },
                        child: Text(isLogin == true ? 'Sign Up' : 'Login'))
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }));
  }
}
