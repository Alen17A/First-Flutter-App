import 'package:first_flutter_app/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "First Flutter App",
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    const sizedBox = SizedBox(height: 20);
    final usernameController = TextEditingController();
    final passwrdController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(30),
          color: const Color.fromARGB(255, 233, 223, 194),
          // decoration: BoxDecoration(
          //   border: Border.all(
          //     width: 10,
          //     color: Colors.black,
          //   ),
          //   borderRadius: BorderRadius.circular(10),
          // ),
          child: Form(
            key: formKey,
            child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.all(30)),
                const Text("LOGIN"),
                sizedBox,
                TextFormField(
                  controller: usernameController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Username",
                    hintText: "Enter your username",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter the username";
                    }
                    return null;
                  },
                ),
                sizedBox,
                TextFormField(
                  controller: passwrdController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter the password";
                    }
                    return null;
                  },
                ),
                sizedBox,
                LoginButton(formKey: formKey, usernameController: usernameController, passwrdController: passwrdController),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.usernameController,
    required this.passwrdController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwrdController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()  {
        if (formKey.currentState!.validate()) {
          if(usernameController.text.trim() == "user" && passwrdController.text.trim() == "password"){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Logined Succesfully"),
                backgroundColor: Colors.green,));
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Homepage(),));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Invalid username or password"),
                backgroundColor: Colors.red,));
          }
        } },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        foregroundColor: const Color.fromRGBO(0, 0, 0, 1),
      ),
      child: const Text("Submit"),
    );
  }
}
