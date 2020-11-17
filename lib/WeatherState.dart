import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyWeatherState extends StatelessWidget {
	http.Client httpClient = new http.Client();
	String _temp;
  	var _description;
	

	final String apiUrl = "http://api.openweathermap.org/data/2.5/weather?q=taipei&appid=7bf8cec48e8a6deec18afe54b571d22c";

	Future<String> fetchTemp() async {
		var result = await http.get(apiUrl);
		double temp = json.decode(result.body)['main']['temp'];
		double tempDouble = (temp - 273.15);
		_temp = " " + tempDouble.floor().toString() + '˚C';
		List desJson = json.decode(result.body)['weather'];
		String description = desJson[0]["description"];
		switch (description) {
			case "clear sky":
				_description = Icons.wb_sunny;
				break;
			case "few clouds":
				_description = Icons.wb_sunny;
				break;
			case "scattered clouds":
				_description = Icons.cloud;
				break;
			case "broken clouds":
				_description = Icons.cloud;
				break;
			case "shower rain":
				_description = Icons.cloud;
				break;
			case  "rain":
				_description = Icons.cloud;
				break;
			case "thunderstorm":
				_description = Icons.cloud;
				break;
			case "snow":
				_description = Icons.cloud;
				break;
			case "mist":
				_description = Icons.cloud;
				break;
			default:
				_description = Icons.sentiment_very_dissatisfied;
		}
		return _temp;
  	}

	@override
	Widget build(BuildContext context) {
		return Container(
			child: FutureBuilder<String>(
				future: fetchTemp(),
				builder: (context, snapshot) {
					if(snapshot.hasData) {
						return Row(
							children: <Widget>[
								Icon(
									_description,
									color: Colors.white,
									size: 16
								),
								Text(
									_temp,
									style: TextStyle(
										color: Colors.white
									)
								)
							],
						);
						
						
					}
					else {
						return Text(
							"X",
							style: TextStyle(
								color: Colors.white
							)
						);
					}
				},
			)
			
    	);
	}
}