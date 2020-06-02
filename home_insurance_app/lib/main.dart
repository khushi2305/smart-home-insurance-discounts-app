import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:homeinsuranceapp/components/rounded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

void main() => runApp(MaterialApp(
  title: 'Smart Home',
  home: SignInDemo(),
));

class SignInDemo extends StatefulWidget {
  @override
  _SignInDemoState createState() => _SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo> {
  GoogleSignInAccount _currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account){
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Home'),
      ),
      body: Center(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    if (_currentUser != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: GoogleUserCircleAvatar(
              identity: _currentUser,
            ),
            title: Text(_currentUser.displayName ?? ''),
            subtitle: Text(_currentUser.email ?? ''),
          ),
          RoundedButton(
            title: 'Log Out',
            colour: Colors.lightBlueAccent,
            onPressed: _handleSignOut,
          ),
          RoundedButton(
            title : 'Get Started',
            colour:Colors.blueAccent,
            onPressed: auth,

          ),
        ],
      );
    }
    else{
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          TypewriterAnimatedTextKit(
            text: ['Smart Home'],
            textStyle: TextStyle(
              fontSize: 45.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Text('You are not logged in..'),
          SizedBox(
            height: 24.0,
          ),

          RoundedButton(
            title: 'Log In',
            colour: Colors.lightBlueAccent,
            onPressed: _handleSignIn,
          ),
        ],
      );
    }
  }

  Future<void> _handleSignIn() async{
    try{
      await _googleSignIn.signIn();
    }catch(error){
      print(error);
    }
  }

  Future<void> _handleSignOut() async{
    _googleSignIn.disconnect();
  }
  Future<void> auth ( )async{

  }

}


