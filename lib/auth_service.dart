import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media_integration/HomePage.dart';
import 'package:social_media_integration/detailPage.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

String userEmail = "";

class Firebaseservices {
  var userDetails;
  final _auth = FirebaseAuth.instance;
  final _GoogleSignIn = GoogleSignIn();
  sigInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _GoogleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  signOut() async {
    await _auth.signOut();
    await _GoogleSignIn.signOut();
    await FacebookAuth.instance.logOut();
  }

  //facebook

  signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    print("Function is called");
    if (loginResult.status == LoginStatus.success) {
      var _accessToken = loginResult.accessToken;
      final userInfo = await FacebookAuth.instance.getUserData();
      userDetails = userInfo;
      print(userDetails);
      return userDetails;
    } else {
      print('ResultStatus: ${loginResult.status}');
      print('Message: ${loginResult.message}');
    }
  }
}
