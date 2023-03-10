import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvc/data/app_exceptions.dart';
import 'package:mvvc/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiSerivices extends BaseApiServices {
  dynamic responseJson;
  @override
  Future getGetApiResponse(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
    } on SocketException {
      throw FetchDataException("No Internet Connection!");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    try {
      Response response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
    } on SocketException {
      throw FetchDataException("No Internet Connection!");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnauthorizedException(response.body.toString());

      default:
        throw FetchDataException(
            "Error occured while communicating with server with status code " +
                response.statusCode.toString());
    }
  }
}
