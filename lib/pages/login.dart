import 'package:flutter/material.dart';
import 'package:flutter_application_latihan_kuis_mobile/models/animals_data.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController= TextEditingController();

  bool isLoggiedIn = false;

  void _login(){
    String username = usernameController.text;
    String password = passwordController.text;

    if(username == user1.username && password == user1.password ){
      setState(() {
        isLoggiedIn = true;
      });
      
      // Navigator.pushReplacement(context, 
      //   MaterialPageRoute(builder: (context) => Root(username: username))
      // );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text("login berhasil"))
        );

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("login gagal username atau password salah"))
        );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: const Text( 'Login Page'), 
        backgroundColor: Colors.black45, 
        foregroundColor: Colors.white,
      ),
      body: 
      Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("This is Login Page"),

              SizedBox(height: 30,),

              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "username", 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))
                  ) 
                ),
              ),
              
              SizedBox(height: 10,),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "password", 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))
                  ) 
                ),
              ),
              
              SizedBox(height: 20,),

              ElevatedButton(onPressed: (){_login();}, child: Text("login"))

            ],
          ),
        ),
      ), 
    ); 
  }
}