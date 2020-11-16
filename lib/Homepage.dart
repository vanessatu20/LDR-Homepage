import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:LDR_app/WeatherRepo.dart';
// import 'package:LDR_app/WeatherBloc.dart';
// import 'package:LDR_app/WeatherModel.dart';
import 'package:weather/weather.dart';


class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
		title: 'Homepage',
		theme: ThemeData(
			visualDensity: VisualDensity.adaptivePlatformDensity,
		),
		home: MyHomePage(),
		);
	}
	}

class MyHomePage extends StatefulWidget {
	@override
	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	int _dayNum = 36;
	String _eventName = 'we meet';
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				body: Container(
					child: Stack(
						children: <Widget>[
							Container(
								decoration: new BoxDecoration(
									image: new DecorationImage(
										image: new AssetImage("assets/background.jpg"), 
										fit: BoxFit.cover,
									),
								),
								margin: EdgeInsets.only(bottom: 80),
								child: Stack(
								children: <Widget>[
									Container(
										margin: EdgeInsets.only(top: 50, left: 60, right: 60),
										height: 35,
										decoration: BoxDecoration(
											color: Color.fromRGBO(255, 225, 213, 0.50),
											borderRadius: BorderRadius.circular(50),
											
										), 
										
										child: DefaultTabController(
											length: 3,
											child: new TabBar(
												unselectedLabelColor: Colors.black,
												labelColor: Colors.black,
												unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
												labelStyle: TextStyle(fontWeight: FontWeight.bold),
												indicator: BoxDecoration(),	
											tabs: [
												Tab(
													child: Container(
														decoration: BoxDecoration(
															borderRadius: BorderRadius.circular(50),
															
														),
														child: Align(
															alignment: Alignment.center,
															child: Text("home"),
														),
													),
												),
												Tab(
													child: Container(
														decoration: BoxDecoration(
															borderRadius: BorderRadius.circular(50),
														),
														child: Align(
															alignment: Alignment.center,
															child: Text("map"),
														),
													),
												),
												Tab(
													child: Container(
														decoration: BoxDecoration(
															borderRadius: BorderRadius.circular(50),
														),
														child: Align(
															alignment: Alignment.center,
															child: Text("goal"),
														),
													),
												),
											]),	
										),
									),
									Stack(
										children: <Widget>[
											Center(
												child: Container(
													margin: EdgeInsets.only(top: 40),
													child: Column(
													mainAxisAlignment: MainAxisAlignment.center,
													children: <Widget>[
														ProfileCard(),
														Image(
															image: new AssetImage("assets/timer.png"),
														),
														Text(
															'$_dayNum' + ' Days',
															style: TextStyle(
																fontSize: 30,
																color: Colors.black,
															),
														),
														Text(
															'until ' + '$_eventName',
															style: TextStyle(
																fontSize: 18,
																color: Colors.black,
															),
														),
														ProfileCard(),
													],
												),
												)
												
											),
										]
									),
									]
								),
						
							),
							Expanded(
								child: Align(
									alignment: FractionalOffset.bottomCenter,
									child: Padding(
										padding: EdgeInsets.only(bottom: 55.0),
										child: Container(
											child:
												FloatingActionButton(
													onPressed: (){},
													backgroundColor: Color(0xFF736464),
													child: Icon(Icons.chat_bubble_outline),
													elevation: 0.0,
												),
										),
									),
								),
							),
							Expanded(
									child: Align(
										alignment: FractionalOffset.bottomCenter,
										child: Padding(
											padding: EdgeInsets.only(bottom: 25.0),
											child: 
												Row(	
													crossAxisAlignment: CrossAxisAlignment.end,	
													mainAxisAlignment: MainAxisAlignment.spaceEvenly,
													children: <Widget>[
														IconButton(
															icon: Icon(
																Icons.home,
																color: Color(0xFF736464)
															),
															onPressed: () {},
														),
														IconButton(
															icon: Icon(
																Icons.calendar_today,
																color: Color(0xFF736464)
															),
															onPressed: () {},),
														Container(
															height: 90,
															child: CircleAvatar(
																backgroundColor: Colors.transparent,
															),
														),
														IconButton(
															icon: Icon(
																Icons.photo_library,
																color: Color(0xFF736464)
															),
															onPressed: () {},),
														IconButton(
															icon: Icon(
																Icons.person,
																color: Color(0xFF736464)
															),
															onPressed: () {},),
													],
												)	
										),
									),
								)
						]
					),
				),
				)
		);
	}
}

class ProfileCard extends StatefulWidget {
_ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
	@override
	Widget build(BuildContext context) {
		return Container(
				width: 180,
				height: 180,
				margin: EdgeInsets.all(30),
				child: new Stack(
					children: <Widget> [
						Container(
							decoration: new BoxDecoration(
								borderRadius: BorderRadius.circular(10.0),
								image: new DecorationImage(
									image: new AssetImage("assets/girl.png"),
									fit: BoxFit.cover,	
								),
							),
						),
						Padding(
							padding: EdgeInsets.all(12.0),
							child: Column(
								mainAxisAlignment: MainAxisAlignment.end,
								children: <Widget>[
									Row(
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: <Widget>[
											MyWeatherState(),
											Clock(),
										],
									)
								],
							),
						),
					],
				)
		);
			
	}	
				
}



class Clock extends StatefulWidget {
	_ClockState createState() => _ClockState();
}
class _ClockState extends State<Clock> {
	String _now;
	Timer _everySecond;
	@override
	void initState() {
		super.initState();
		_now = _timeToString(DateTime.now());
		_everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
			if (!mounted) return;
			setState(() {
				_now = _timeToString(DateTime.now());
			});
		});
	}
	String _timeToString(DateTime now) {
		String timeString =
			"${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
		return timeString;

	}
	@override
	Widget build(BuildContext context) {
		return Row(
			children: <Widget>[
				Icon(
					Icons.access_time,
					size: 18,
					color: Colors.white
				),
				Text(
					" " + _now,
					style: TextStyle(
						color: Colors.white,
					)
				)
			],
			
		);
	}
}
////////////////////////////////////////
///////////////////////////////////////
// Weather Test
///////////////////////////////////////
////////////////////////////////////////


class MyWeatherState extends StatelessWidget {
	http.Client httpClient = new http.Client();
	String _temp;
	

	final String apiUrl = "http://api.openweathermap.org/data/2.5/weather?q=taipei&appid=7bf8cec48e8a6deec18afe54b571d22c";

	Future<String> fetchTemp() async {
		var result = await http.get(apiUrl);
		double temp = json.decode(result.body)['main']['temp'];
		double tempDouble = (temp - 273.15);
		_temp = " " + tempDouble.floor().toString() + '˚C';
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
									Icons.wb_sunny,
									size: 18,
									color: Colors.white
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