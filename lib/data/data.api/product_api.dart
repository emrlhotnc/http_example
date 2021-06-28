// ignore: unused_import
//import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class ProductApi {
  Future getProducts() {
    return Dio().get("10.0.2.2:3000/products");
  }

  Future getProductsByCategoryId(int categoryId) {
    return Dio().get("10.0.2.2:3000/products?categoryId=$categoryId");
  }
}
