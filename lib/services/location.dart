import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longituge;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longituge = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
