import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:spacex_wiki/models/UpcomingLaunches.dart';



const baseUrl = "https://api.spacexdata.com/v3/";


class ApiService {
  Future<List<UpcomingLaunches>> getRequest(String url) async {
    return http
      .get(baseUrl + url)
      .then((http.Response response) {
      final res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        return null;
      }
      return upcomingLaunchesFromJson(res);
    });
  }

}