import 'dart:convert';
import 'package:crud_with_rest_rest_api/Style/Style.dart';
import 'package:http/http.dart' as http;

Future<bool> ProductCreateRequest(FormValues) async{
  var URL=Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var PostBody= json.encode(FormValues);
  var PostHeader = {"Content-Type":"application/json"};
  var response= await http.post(URL, headers:PostHeader,body: PostBody);
  var ResultCode=response.statusCode;
  var ResultBody=json.decode(response.body);

  if(response.statusCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail ! try again");
    return false;
  }
}