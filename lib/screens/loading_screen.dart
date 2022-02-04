import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = "804c5ff726fb8b52eb831f989a33ad6f";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location myLocation = Location();
    await myLocation.getCurrentLocation();
    latitude = myLocation.latitude;
    longitude = myLocation.longituge;
    getData();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));
    if (response.statusCode == 200) {
      String data = response.body;

      var temp = jsonDecode(data)['main']['temp'];
      var condidionId = jsonDecode(data)['weather'][0]['id'];
      var city = jsonDecode(data)['name'];

      print(temp);
      print(condidionId);
      print(city);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
