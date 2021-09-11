import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {

  final String _nama;
  final String _alamat;
  final String _email;
  final String _notelp;
  final String _jk;
  final String _hobi;

  SavedScreen(
      this._nama,
      this._alamat,
      this._email,
      this._notelp,
      this._jk,
      this._hobi,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              Text("Nama : "),
              Text(_nama),
            ],
          ),
          Row(
            children: [
              Text("Alamat : "),
              Text(_alamat),
            ],
          ),
          Row(
            children: [
              Text("Email : "),
              Text(_email),
            ],
          ),
          Row(
            children: [
              Text("No Telepon : "),
              Text(_notelp),
            ],
          ),
          Row(
            children: [
              Text("Jenis Kelamin : "),
              Text(_jk),
            ],
          ),
          Row(
            children: [
              Text("Hobi : "),
              Text(_hobi),
            ],
          ),
          OutlinedButton(
            child: Text('Kembali'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
