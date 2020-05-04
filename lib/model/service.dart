import 'dart:convert';

import 'package:http/http.dart' as http;
class Service{
  Future getWeather() async{
    String url = "https://nepal-weather-api.herokuapp.com/api/?place=all";
    var response = await http.get(Uri.encodeFull(url),headers: {'Accept' : 'application/json'});
    var data = json.decode(response.body)['weather'];
    return data;
  }
}