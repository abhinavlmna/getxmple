
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:getxmple/ApiProducts.dart';

import 'Products.dart';

class Apiservice{
  // Apiservice api=Apiservice();
  Future<List<Products>?>fetchdata() async {
    var response = await http.get(Uri.parse('https://dummyjson.com/products'));
    var Json = jsonDecode(response.body);
    var resp = ApiProducts.fromJson(Json);
    var list = resp.products;
    return list;
  }
}