import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quantum_projects/services/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUpUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          backgroundColor: Colors.red,
          title: Text(
            'Social' "X",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ), // Creates border
                  color: Colors.white), //Change bac
              tabs: [
                new Container(
                  // height: 50.0,

                  child: new Tab(text: 'hello'),
                ),
                new Container(
                  // height: 50.0,
                  child: new Tab(text: 'hello'),
                ),
              ]),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 550,
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SignIn into your',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          ),
                          Text(
                            'account',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Email',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          // SizedBox(height: 10),
                          Container(
                            width: 300,
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.email,
                                    color: Colors.red,
                                  ),
                                  labelText: '123@gmail.com'),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Password',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Container(
                            width: 300,
                            child: TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.password,
                                    color: Colors.red,
                                  ),
                                  labelText: 'Password'),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 210,
                              ),
                              Text(
                                'Forget Password?',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Center(
                              child: Text('login With '),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 0,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                color: Colors.amber,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('do you have acccount?'),
                              InkWell(
                                child: Container(
                                  child: Text(
                                    "Resgister Now ",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 80,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: signUpUser,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Text(
                        'Login ',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.red,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40)),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
