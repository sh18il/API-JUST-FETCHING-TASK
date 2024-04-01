import 'dart:convert';

import 'package:task_api/model/category_model.dart';
import 'package:http/http.dart'as http;



class ServiceApi {
  Future<List<ModelCategory>> fetchingData() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => ModelCategory.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}