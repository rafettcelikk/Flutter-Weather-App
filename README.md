🌤️ Flutter Weather App
Flutter ile geliştirilmiş, OpenWeatherMap API kullanan şehir bazlı hava durumu uygulaması.
Kullanıcı seçtiği şehir için anlık sıcaklık, nem, rüzgar hızı ve hava durumu açıklamasını görebilir.

✨ Özellikler

- 📍 Türkiye’deki şehirler için hava durumu bilgisi
- 🌡️ Anlık sıcaklık, nem ve rüzgar hızı
- 🖼️ Hava durumuna göre dinamik kart tasarımı
- 🔑 API key yönetimi .env dosyası ile güvenli şekilde
- 🧩 Modüler yapı: services, widgets, pages, models

📂 Proje Yapısı

lib/
├── main.dart
├── models/
│ └── weather_model.dart
├── services/
│ └── weather_service.dart
├── pages/
│ └── home_page.dart
└── widgets/
└── weather_card.dart

🚀 Kurulum

- Repoyu klonla:

git clone https://github.com/rafettcelikk/flutter_weather_app.git

cd flutter_weather_app

- Paketleri yükle:

flutter pub get

- .env dosyası oluştur:

OPENWEATHER_API_KEY=YOUR_API_KEY_HERE

- ⚠️ .env dosyası .gitignore içinde olmalı. Repo’ya sadece .env.example ekleyebilirsin.

- Uygulamayı çalıştır:

flutter run

📸 Ekran Görüntüsü

## 📸 Ekran Görüntüsü

![Uygulama Ekran Görüntüsü](assets/images/screenshot.png)

🛠️ Kullanılan Teknolojiler

- Flutter
- Dio
- flutter_dotenv
- OpenWeatherMap API
