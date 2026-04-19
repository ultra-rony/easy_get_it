library;

/// Global singleton instance (similar to GetIt.I)
final EasyGetIt getIt = EasyGetIt._internal();

class EasyGetIt {
  EasyGetIt._internal();

  final Map<Type, dynamic> _singletons = {};
  final Map<Type, Function> _lazySingletons = {};
  final Map<Type, Function> _factories = {};

  /// =====================
  /// REGISTRATION METHODS
  /// =====================

  /// Registers an already created instance as a singleton.
  /// The same instance will be returned every time.
  void registerSingleton<T>(T instance) {
    _singletons[T] = instance;
  }

  /// Registers a lazy singleton.
  /// The instance will be created only on the first call to [get].
  void registerLazySingleton<T>(T Function() factory) {
    _lazySingletons[T] = factory;
  }

  /// Registers a factory.
  /// A new instance will be created on every call to [get].
  void registerFactory<T>(T Function() factory) {
    _factories[T] = factory;
  }

  /// =====================
  /// RESOLUTION
  /// =====================

  /// Returns an instance of type [T].
  ///
  /// Resolution order:
  /// 1. Singleton
  /// 2. Lazy singleton (then cached as singleton)
  /// 3. Factory
  ///
  /// Throws an [Exception] if the type is not registered.
  T get<T>() {
    // Singleton
    if (_singletons.containsKey(T)) {
      return _singletons[T] as T;
    }

    // Lazy Singleton
    if (_lazySingletons.containsKey(T)) {
      final instance = _lazySingletons[T]!();
      _singletons[T] = instance;
      _lazySingletons.remove(T);
      return instance as T;
    }

    // Factory
    if (_factories.containsKey(T)) {
      return _factories[T]!() as T;
    }

    throw Exception('Service of type $T is not registered');
  }

  /// =====================
  /// UTILITIES
  /// =====================

  /// Returns `true` if a type [T] is registered.
  bool isRegistered<T>() {
    return _singletons.containsKey(T) ||
        _lazySingletons.containsKey(T) ||
        _factories.containsKey(T);
  }

  /// Unregisters a type [T] from all registries.
  void unregister<T>() {
    _singletons.remove(T);
    _lazySingletons.remove(T);
    _factories.remove(T);
  }

  /// Clears all registered dependencies.
  void reset() {
    _singletons.clear();
    _lazySingletons.clear();
    _factories.clear();
  }
}
