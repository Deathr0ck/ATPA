import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
// Explicit

// Method

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    );
  }

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name :',
        labelStyle: TextStyle(
          color: Colors.blueAccent,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
        helperText: 'FirstName and LastName',
        helperStyle: TextStyle(
          color: Colors.lightBlueAccent,
          fontSize: 14.0,
          fontStyle: FontStyle.italic,
        ),
        icon: Icon(
          Icons.perm_identity,
          size: 48.0,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email :',
        labelStyle: TextStyle(
          color: Colors.greenAccent,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
        helperText: 'EmailAddress',
        helperStyle: TextStyle(
          color: Colors.greenAccent,
          fontSize: 14.0,
          fontStyle: FontStyle.italic,
        ),
        icon: Icon(
          Icons.email,
          size: 48.0,
          color: Colors.greenAccent,
        ),
      ),
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password :',
        labelStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
        helperText: 'PassWord',
        helperStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 14.0,
          fontStyle: FontStyle.italic,
        ),
        icon: Icon(
          Icons.vpn_lock,
          size: 48.0,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        actions: <Widget>[uploadButton()],
        backgroundColor: Colors.orange[700],
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30.0),
        alignment: Alignment.topCenter,
        child: Container(
          width: 250.0,
          child: Column(
            children: <Widget>[
              nameText(),
              emailText(),
              passwordText(),
            ],
          ),
        ),
      ),
    );
  }
}
