import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:social_media_integration/HomePage.dart';

import 'package:social_media_integration/auth_service.dart';

//child: Text("${FirebaseAuth.instance.currentUser?.displayName}"),
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Media Integration App'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "${FirebaseAuth.instance.currentUser?.photoURL}"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 20,
            ),
            Text("${FirebaseAuth.instance.currentUser?.displayName}"),
            SizedBox(
              height: 20,
            ),
            Text("${FirebaseAuth.instance.currentUser?.email}"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  await Firebaseservices().signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()));
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
