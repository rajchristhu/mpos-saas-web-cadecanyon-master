import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCMmiMkUicsC89nyjLTTR3EsPE0phuOfsk',
    appId: '1:231089709140:web:b3f6eeb5539c5749748dc1',
    messagingSenderId: '231089709140',
    projectId: 'dbillz24',
    authDomain: 'dbillz24.firebaseapp.com',
    databaseURL: 'https://dbillz24-default-rtdb.firebaseio.com',
    storageBucket: 'dbillz24.appspot.com',
    measurementId: 'G-TN1G9YBV4R',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBQwluUV74vn9xzEA2bIqZuJewvtRegxFY',
    appId: '1:231089709140:ios:a5c1413997198212748dc1',
    messagingSenderId: '231089709140',
    projectId: 'dbillz24',
    databaseURL: 'https://dbillz24-default-rtdb.firebaseio.com',
    storageBucket: 'dbillz24.appspot.com',
    iosBundleId: 'com.maantheme.salesproAdmin',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQwluUV74vn9xzEA2bIqZuJewvtRegxFY',
    appId: '1:231089709140:ios:a5c1413997198212748dc1',
    messagingSenderId: '231089709140',
    projectId: 'dbillz24',
    databaseURL: 'https://dbillz24-default-rtdb.firebaseio.com',
    storageBucket: 'dbillz24.appspot.com',
    iosBundleId: 'com.maantheme.salesproAdmin',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAodaxrwPTaWlb7Pm9yOztUWIG-1-jsz_8',
    appId: '1:231089709140:android:de2b66e3fbcc1569748dc1',
    messagingSenderId: '231089709140',
    projectId: 'dbillz24',
    databaseURL: 'https://dbillz24-default-rtdb.firebaseio.com',
    storageBucket: 'dbillz24.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCMmiMkUicsC89nyjLTTR3EsPE0phuOfsk',
    appId: '1:231089709140:web:80a5ed075d254acd748dc1',
    messagingSenderId: '231089709140',
    projectId: 'dbillz24',
    authDomain: 'dbillz24.firebaseapp.com',
    databaseURL: 'https://dbillz24-default-rtdb.firebaseio.com',
    storageBucket: 'dbillz24.appspot.com',
    measurementId: 'G-285GEVHREV',
  );

}