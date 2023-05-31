import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Original"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
                child: Image.asset("assets/qr_logo.png", fit: BoxFit.contain),
              ),
              const Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10
              ),
              const Text(
                "Name",
                style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500)
              ),
              const Text(
                "Email",style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500)
              ),
              const SizedBox(height: 15),
              ActionChip(label: const Text("Logout"), 
              onPressed: (){}
              ),
            ],
          ),
        ),
      ),
    );
  }
}
