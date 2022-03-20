import 'package:bloc_login/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferencesData {
  Future<LogUser> logIn({String username, String password, String device}) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(username);
    if (value == password) {
      User user = User(email: username);
      return LogUser(user: user, token: device);
    } else {
      return null;
    }
  }

  Future<LogUser> forgetpassword({String username}) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(username);
    if (value != null) {
      User user = User(email: username);
      return LogUser(
        user: user,
      );
    } else {
      return null;
    }
  }

  Future<LogUser> register({String username, String password, String device}) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(username);
    if (value == null) {
      await prefs.setString(username, password);
      User user = User(email: username);
      return LogUser(user: user, token: device);
    } else {
      return null;
    }
  }

  Future<LogUser> reset({String username, String password, String device}) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(username);
    if (value != null) {
      await prefs.setString(username, password);
      User user = User(email: username);
      return LogUser(user: user, token: device);
    } else {
      return null;
    }
  }
}

class LogUser {
  final String token;
  final User user;
  LogUser({this.token, this.user});
}
