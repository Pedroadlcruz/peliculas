import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:pelisapp/src/models/pelicula_model.dart';

class PeliculasProvider {

String _apikey   = 'd15b0fbc16bef0a1795a98ee1eae5f79';
String _url       = 'api.themoviedb.org';
String _language  = 'es-ES';

Future<List<Pelicula>> getEnCines() async{
  
final url = Uri.https(_url, '3/movie/now_playing',{
  'api_key'  : _apikey,
  'language' : _language,
});

final resp = await http.get(url);
final decodeData = json.decode(resp.body);

final peliculas = new Peliculas.fromJsonList(decodeData['results']);



return peliculas.items;

}

}