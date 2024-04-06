import 'package:flutter/material.dart';
import 'package:betebet/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showRegisterPage = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _togglePage() {
    setState(() {
      _showRegisterPage = !_showRegisterPage;
    });
  }

  void _login() {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (_showRegisterPage) {
      // Register logic
      if (password == confirmPassword) {
        // Passwords match
        // Implement your registration logic here
        print('Registered: Name: $name, Email: $email, Password: $password');
      } else {
        // Passwords don't match
        print('Passwords do not match');
      }
    } else {
      // Login logic
      // Implement your login logic here
      print('Logged in: Name: $name, Password: $password');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FirstPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Welcome!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100),
            SizedBox(height: 20),
            Text(
              'BetEbet',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.all(10.0),
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: _showRegisterPage
                    ? [
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                      ]
                    : [
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                      ],
              ),
            ),
            ElevatedButton(
              child: Text(_showRegisterPage ? 'Register' : 'Login'),
              onPressed: _login,
            ),
            TextButton(
              child: Text(_showRegisterPage ? 'Sign in' : 'Register'),
              onPressed: _togglePage,
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}
