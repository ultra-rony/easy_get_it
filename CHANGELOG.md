## 0.0.1

* First version of the library.

## 0.0.6

### Added
- Improved internal architecture of service locator
- Added better type safety for `get<T>()`
- Added `isRegistered<T>()` utility method
- Added `unregister<T>()` method for removing dependencies
- Added `reset()` method to clear all registrations
- Optimized lazy singleton initialization behavior

### Changed
- Improved performance of dependency resolution
- Refactored internal storage for singletons, factories, and lazy singletons
- Updated API consistency for registration methods

### Fixed
- Fixed issue where lazy singletons were not properly cached after first initialization
- Fixed type casting edge cases in `get<T>()`

### Notes
- This version improves stability and prepares the package for production usage