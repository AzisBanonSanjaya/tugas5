import 'package:flutter/material.dart';
import 'package:tugas5/page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formkey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() {
    if (formkey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("informasi"),
            content: Text("Berhasil Login"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("ok"))
            ],
          );
        },
      );
    }
  }

void _redirectToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              page()), // NewPage adalah halaman baru yang ingin Anda tuju
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: ListView(
        children: [
          Container(
            child: Form(
              key: formkey,
                child: Column(
              children: [
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(hintText: "Masukan Username"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username Harus Di Isi";
                    }
                  },
                ),
                SizedBox(height: 12,),
                TextFormField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(hintText: "Masukan Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password Harus Di Isi";
                    }
                  },
                ),SizedBox(height: 12,),
                ElevatedButton(
                        onPressed: () {
                          _redirectToNewPage(context);
                        },
                        child: Text("login"))
              ],
            )),
          )
        ],
      ),
    );
  }
}
