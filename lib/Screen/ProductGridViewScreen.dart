import 'package:crud_with_rest_rest_api/Style/Style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RestAPI/RestClient.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({super.key});
  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {

  List ProductList=[];
  bool Loading=true;

  void initState(){
    CallData();
    super.initState();


  }

  CallData() async {
    Loading=true;
    var data =  await ProductGridViewListRequest();
    setState(() {
      ProductList= data;
      Loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:AppBar(title: Text("List Product"),) ,
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: Loading?(Center(child: CircularProgressIndicator())):(

            GridView.builder(
              gridDelegate: ProductGridViewStyle(),
              itemCount: ProductList.length,
              itemBuilder: (context, index){
              return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: Image.network(ProductList[index]['Img'],fit: BoxFit.fill,)),
                  Container(
                    padding: EdgeInsets.fromLTRB(5,5,5,8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(ProductList[index]['ProductName']),
                        SizedBox(height: 7),
                        Text("Price "+ProductList[index]['UnitPrice']+" BDT"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton(onPressed: (){

                            }, child: Icon(CupertinoIcons.ellipsis_vertical_circle,size: 18,color: colorGreen)),

                            SizedBox(width: 4),
                            OutlinedButton(onPressed: (){

                            }, child: Icon(CupertinoIcons.delete,size: 18,color: colorRed)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),

              );
              }

              )
            ),
          )
        ],
      ),

    );
  }
}
