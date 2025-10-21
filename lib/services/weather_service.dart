import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_weather_app/models/weather_model.dart';

class WeatherService {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.openweathermap.org/data/2.5/",
      queryParameters: {
        "appid": dotenv.env['OPENWEATHER_API_KEY'],
        "units": "metric",
        "lang": "tr",
      },
    ),
  );

  Future<WeatherModel> getWeather(String city) async {
    final response = await dio.get("weather", queryParameters: {"q": city});

    var model = WeatherModel.fromJson(response.data);
    return model;
  }
}
