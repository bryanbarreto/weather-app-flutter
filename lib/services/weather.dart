import 'location.dart';
import 'networking.dart';
import 'networking.dart';
import 'networking.dart';

class WeatherModel {
  final String apiKey = 'b093d0314ea5429040cd69466f3ff46c';

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 35) {
      return 'É tempo para 🍦';
    } else if (temp > 28) {
      return 'Tempo para short e 👕';
    } else if (temp < 20) {
      return 'Você precisará de 🧣 e 🧤';
    } else {
      return 'Leve um 🧥 só para garantir';
    }
  }

  Future<dynamic> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkingHelper networkingHelper = NetworkingHelper(
        url:
            'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    dynamic weatherData = await networkingHelper.getData();

    return weatherData;
  }

  Future<dynamic> getWeatherByCityName(String cityName) async {
    NetworkingHelper networkingHelper = NetworkingHelper(
        url:
            'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    dynamic weatherData = await networkingHelper.getData();

    return weatherData;
  }
}
