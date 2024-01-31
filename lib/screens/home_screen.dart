import 'package:face_and_tech_id_test_app/services/local_auth_services.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool authenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!authenticated)
              ElevatedButton(
                onPressed: () async {
                  final authenticate = await LocalAuth.authenticate();
                  setState(() {
                    authenticated = authenticate;
                  });
                },
                child: const Text("Authenticate"),
              ),
            if (authenticated) const Text("U are authenticated"),
            if (authenticated)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    authenticated = false;
                  });
                },
                child: const Text("Log out"),
              ),
          ],
        ),
      ),
    );
  }
}

