# EasyGetIt

<p align="center">
    <a href="https://pub.dev/packages/easy_get_it"><img src="https://img.shields.io/badge/pub-v0.0.6-blue" alt="Pub"></a>
    <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
    <a href="https://pub.dev/packages/easy_get_it/score"><img src="https://img.shields.io/badge/points-160/160-green" alt="Points"></a>
    <a href="https://www.donationalerts.com/r/ultra_rony"><img src="https://img.shields.io/badge/support-donate-yellow" alt="Donate"></a>
</p>

A lightweight and minimal service locator for Dart/Flutter, inspired by `GetIt`. It provides a simple way to register and resolve dependencies without unnecessary complexity.

<a href="https://github.com/ultra-rony/easy_get_it">repository</a>

---

## ✨ Features

* 🔹 Singleton support (pre-created instance)
* 🔹 Lazy Singleton (created on first request)
* 🔹 Factory (new instance every time)
* 🔹 No external dependencies
* 🔹 Simple and intuitive API
* 🔹 Utilities for checking, unregistering, and resetting dependencies

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  easy_get_it: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## 🚀 Quick Start

```dart
import 'package:easy_get_it/easy_get_it.dart';

void main() {
  // Register dependencies
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerFactory<UserController>(() => UserController());

  // Resolve dependencies
  final api = getIt.get<ApiService>();
  final auth = getIt.get<AuthService>();
  final controller1 = getIt.get<UserController>();
  final controller2 = getIt.get<UserController>(); // new instance
}
```

---

## 🧠 Registration Types

### 1. Singleton

A single shared instance is used throughout the app.

```dart
getIt.registerSingleton<MyService>(MyService());
```

---

### 2. Lazy Singleton

The instance is created only when it is first requested, then cached.

```dart
getIt.registerLazySingleton<MyService>(() => MyService());
```

---

### 3. Factory

A new instance is created every time it is requested.

```dart
getIt.registerFactory<MyService>(() => MyService());
```

---

## 🔍 Resolving Dependencies

```dart
final service = getIt.get<MyService>();
```

If the type is not registered, an exception is thrown:

```text
Exception: Service of type MyService is not registered
```

---

## 🛠 Utilities

### Check if registered

```dart
if (getIt.isRegistered<MyService>()) {
  // Do something
}
```

---

### Unregister a dependency

```dart
getIt.unregister<MyService>();
```

---

### Reset all dependencies

```dart
getIt.reset();
```

---

## ⚙️ Resolution Order

When calling `get<T>()`, dependencies are resolved in this order:

1. Singleton
2. Lazy Singleton (then cached as Singleton)
3. Factory

---

## 🌍 Global Access

EasyGetIt is designed as a global singleton:

```dart
final EasyGetIt getIt = EasyGetIt._internal();
```

You can access `getIt` anywhere in your app without additional setup.

---

## ⚠️ Limitations

* No scoped dependencies
* No async initialization support
* Not thread-safe (generally fine for Flutter apps)

---

## 💡 When to use

* Small to medium Flutter applications
* Prototyping and fast development
* When a full DI framework is unnecessary

---

## 📄 License

MIT

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome.
