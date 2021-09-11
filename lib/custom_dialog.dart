import 'package:flutter/material.dart';

import 'constants.dart';

class CustomDialog extends StatefulWidget {
  final String nama, alamat, email, notelp, jk, hobi, tanggal, waktu;

  const CustomDialog({Key key, this.nama, this.alamat, this.email, this.notelp, this.jk, this.hobi, this.tanggal, this.waktu}) : super(key: key);



  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: Constants.padding,top: 12
              + Constants.padding, right: Constants.padding,bottom: Constants.padding
          ),
          margin: EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(widget.nama,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
              SizedBox(height: 15,),
              Text("Alamat : "+widget.alamat,style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
              SizedBox(height: 15,),
              Text("Email : "+widget.email,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
              SizedBox(height: 15,),
              Text("No. Telepon : "+widget.notelp,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
              SizedBox(height: 15,),
              Text("Jenis Kelamin : "+widget.jk,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
              SizedBox(height: 15,),
              Text("Hobi : "+widget.hobi,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
              SizedBox(height: 15,),
              Text("Tanggal : "+widget.tanggal,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
              SizedBox(height: 15,),
              Text("Waktu : "+widget.waktu,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
              SizedBox(height: 22,),
              Align(
                alignment: Alignment.bottomRight,
                child: OutlinedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text("Kembali",style: TextStyle(fontSize: 18),)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
