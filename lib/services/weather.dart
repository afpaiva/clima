import '../services/location.dart';
import '../services/networking.dart';

const String apiKey = "key";
const openWeatherMapURL = 'http://api.openweathermap.org';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherMapURL/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location myLocation = Location();
    await myLocation.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherMapURL/data/2.5/weather?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=$apiKey&units=metric');

    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
