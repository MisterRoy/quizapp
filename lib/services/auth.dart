import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> anonLogin() async {
    print('Anonymous login ...');
    try {
      var credentials = await FirebaseAuth.instance.signInAnonymously();
      print('LOGGED USER: ${credentials.user}');
    } on FirebaseAuthException catch (e) {
      // handle error
      print('ERROR: ${e.message}');
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> googleLogin() async {
    try {
      print('Google login ...');
      final googleUser = await GoogleSignIn().signIn();
      print('Google signin ok ... $googleUser');

      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(authCredential);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
