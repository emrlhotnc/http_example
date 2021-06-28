import 'package:dio/dio.dart';

class CategoryApi {
  static Future getCategories() async {
    print('call;');
    return await Dio().get(
        "https://raw.githubusercontent.com/yasincaliskan/SuperMarket/master/api/db.json");
  }
}
