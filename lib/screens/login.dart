import 'package:flutter/material.dart';
import 'package:qr_original/screens/home.dart';
import 'package:qr_original/screens/signup.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please enter your email");
          }

          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please enter a valid email");
          }

          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,

        validator: (value){
          RegExp regex = new RegExp(r'^.{6,}$');
          if(value!.isEmpty){
            return ("Password is required for login");
          }

          if(!regex.hasMatch(value)){
            return ("Please enter a valid password(Min. 6 characters)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(7),
        color: Colors.blueAccent,
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width * 0.4,
          onPressed: () {
            //verificar desde aqui
            singIn(emailController.text, passwordController.text);
          },
          child: const Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));

    final escaner = InkWell(
      onTap: () {
        // Acción a realizar al hacer clic en la imagen del escáner
      },
      child: Image.asset(
        "assets/escaner.png",
        fit: BoxFit.contain,
        height: 60,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Original"),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                        child: Image.asset("assets/qr_logo.png",
                            fit: BoxFit.contain),
                      ),
                      const SizedBox(height: 80),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      emailField,
                      const SizedBox(height: 35),
                      passwordField,
                      const SizedBox(height: 40),
                      loginButton,
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Alineación de los botones y espacio entre ellos
                        children: <Widget>[
                          const Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const signUp()));
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 70),
                      escaner,
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  void singIn(String email, String password) async {
    if(_formKey.currentState!.validate()){
      /*await _auth.singInWithEmailAndPassword(email: email, password: password).then((uid) => {
        //Fluttertoast.showToast(msg: "Login successful"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>home())),
      }).catchError((e){
        //Flutteroast.showToast(msg: e!.message);
      });*/
    }
  }


}
