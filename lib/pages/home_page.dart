import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../widgets/weather_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> cities = [
    "Ankara",
    "Istanbul",
    "Izmir",
    "Bursa",
    "Antalya",
    "Adana",
    "Trabzon",
    "Diyarbakir",
    "Bayburt",
    "Erzurum",
  ];

  String? selectedCityName;
  Future<WeatherModel>? weatherFuture;
  final WeatherService weatherService = WeatherService();

  void selectedCity(String city) {
    setState(() {
      selectedCityName = city;
      weatherFuture = weatherService.getWeather(city);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade200,
        centerTitle: true,
        title: const Text('Hava Durumu Uygulaması'),
      ),
      body: Column(
        children: [
          if (weatherFuture != null)
            FutureBuilder(
              future: weatherFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                if (snapshot.hasData) {
                  return WeatherCard(weatherModel: snapshot.data!);
                }
                return const SizedBox.shrink();
              },
            ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final isSelected = selectedCityName == cities[index];
                return GestureDetector(
                  onTap: () => selectedCity(cities[index]),
                  child: Card(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primaryContainer
                        : null,
                    child: Center(
                      child: Text(
                        cities[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: cities.length,
            ),
          ),
        ],
      ),
    );
  }
}
