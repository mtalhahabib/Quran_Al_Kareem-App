
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AyaatPage extends StatelessWidget {
  final data;
  final text;
  final index;
  final type;
  const AyaatPage({Key? key,required this.data,required this.text,required this.index,required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,

          title: Row(

            children: [
              // Text(type.toString(),style: TextStyle(
              //   fontSize: 10,
              // ),),
              Expanded(child: Container()),
              Text(data.toString(),style: TextStyle(
                fontFamily: 'qalam',
                fontSize: 28
              )
                ,),

            ],
          ),

        ),
        body: ListView.builder(itemCount:text.length,itemBuilder: (context,i){
          return Card(
            elevation: 0.5,
            child: ListTile(
              title: Container(
                child: Flexible(
                  fit: FlexFit.tight,
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:[

                      Text(
                        ((){
                          if(text[i].sajda==false){return '';}else{return 'سجدة';}
                        })(),
                        style: TextStyle(
                            fontFamily: 'mushaf',
                            color: Colors.green,
                            fontSize: 25
                        ),
                      ),
                      SizedBox(width: 7,),
                      Container(

                        width: 15, // adjust this according to your needs
                        height: 15, // adjust this according to your needs
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            border: Border.all(
                                color: Colors.black26

                            )

                          // adjust the color to your preference
                        ),
                        child: Center(
                          child: Text(
                            text[i].numberInSurah.toString(),// replace this with your desired number
                            style: TextStyle(
                              color: Colors.green, // adjust the text color to your preference
                              fontSize: 10, // adjust the font size to your preference
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:[ Text(text[i].text.toString(),textAlign: TextAlign.right,style: TextStyle(
                          fontFamily: 'majeed',
                          fontSize: 20

                        ),),


                      ]),
                    ),

                    ]
                  ),



                    ]),
                ),
              ),
            ),
          );

        },
        ));
  }
}


