
import 'package:flutter/material.dart';
import 'package:formulir_app_with_flutter/custom_dialog.dart';
import 'package:formulir_app_with_flutter/saved_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _nama;
  String _alamat;
  String _notelp;
  String _email ;
  String _jk = "";
  String _hobi = "";
  bool baca = false;
  bool renang = false;
  bool game = false;



  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNama(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'Nama',
            border: OutlineInputBorder(),
        ),
        validator: (String value){
          if(value.isEmpty){
            return 'Nama tidak boleh kosong';
          }
        },
        onSaved: (String value){
          _nama = value;
        },
      ),
    );
  }

  Widget _buildAlamat(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Alamat',
          border: OutlineInputBorder(),
        ),
        maxLines: 3,
        validator: (String value){
          if(value.isEmpty){
            return 'Alamat tidak boleh kosong';
          }
        },
        onSaved: (String value){
          _alamat = value;
        },
      ),
    );
  }

  Widget _buildnotelp(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'No. Telepon',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.phone,
        validator: (String value){
          if(value.isEmpty){
            return 'Nomor telepon tidak boleh kosong';
          }
        },
        onSaved: (String value){
          _notelp = value;
        },
      ),
    );
  }

  Widget _buildEmail(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (String value){
          if(value.isEmpty){
            return 'Email tidak boleh kosong';
          }
        },
        onSaved: (String value){
          _email = value;
        },
      ),
    );
  }

  Widget _buildGender(){
    return Padding(
        padding: EdgeInsets.all(12),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Jenis Kelamin"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text("Laki-Laki"),
                    Radio(
                      value: "Laki-laki",
                      groupValue: _jk,
                      onChanged: (String value){
                        setState(() {
                          _jk = value;
                        });
                      }
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Perempuan"),
                    Radio(
                        value: "Perempuan",
                        groupValue: _jk,
                        onChanged: (String value){
                          setState(() {
                            _jk = value;
                          });
                        }
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
    );
  }

  Widget _buildHobi(){
    return Padding(
        padding: EdgeInsets.only(top: 6, left: 12, right: 12, bottom: 2),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Hobi"),
            Row(
              children: [
                Checkbox(
                    value: baca,
                    onChanged: (bool value){
                      setState(() {
                        baca = value;
                      });
                    }
                ),
                Text("Membaca"),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: renang,
                    onChanged: (bool value){
                      setState(() {
                        renang = value;
                      });
                    }
                ),
                Text("Berenang"),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: game,
                    onChanged: (bool value){
                      setState(() {
                        game = value;
                      });
                    }
                ),
                Text("Main Games"),
              ],
            )
          ],
        ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Form App"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildNama(),
                  _buildAlamat(),
                  _buildEmail(),
                  _buildnotelp(),
                  _buildGender(),
                  _buildHobi(),
                  SizedBox(
                    height: 90,
                  ),
                  ElevatedButton(
                      onPressed: (){
                        if(!_formKey.currentState.validate()){
                          return;
                        }

                        _formKey.currentState.save();

                        _hobi = (baca ? 'Membaca, ' : '')+
                            (renang ? 'Berenang, ' : '') +
                            ( game ? 'Bermain games' : '');

                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => SavedScreen(_nama, _alamat, _email, _notelp, _jk, _hobi))
                        // );
                       showDialog(context: context,
                       builder: (BuildContext context){
                         return CustomDialog(
                           nama: _nama,
                           alamat: _alamat,
                           email: _email,
                           notelp: _notelp,
                           jk: _jk,
                           hobi: _hobi,
                         );
                       });
                      },

                      child: Text("Submit"))
                ],
            ),
          ),
        ),
      ),
    );
  }
}
