import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherCard({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              weatherModel.name!,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              "${weatherModel.main!.temp!.round()} °C",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            Text(
              weatherModel.weather!.first.description!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Icon(Icons.water_drop),
                    const SizedBox(height: 4),
                    Text("Nem: ${weatherModel.main!.humidity!.round()}%"),
                  ],
                ),
                const SizedBox(width: 32),
                Column(
                  children: [
                    const Icon(Icons.wind_power),
                    const SizedBox(height: 4),
                    Text("Rüzgar: ${weatherModel.wind!.speed!.round()} m/s"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
