import 'package:flutter/material.dart';
import './WeatherState.dart';
import './Clock.dart';


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
										
										child: 
											HomeTabBar()
									),
									CenterComponents(),
									]
								),
						
							),
							ChatButton(),
							BottomNavBar()
						]
					),
				),
				)
		);
	}
}

class CenterComponents extends StatelessWidget {
	int _dayNum = 36;
	String _eventName = 'we meet';
	String girlPic = "assets/girl.png";
	String guyPic = "assets/guy.png";
  
	@override
	Widget build(BuildContext context) {
		return (
			Stack(
				children: <Widget>[
					Center(
						child: Container(
							margin: EdgeInsets.only(top: 40),
							child: Column(
							mainAxisAlignment: MainAxisAlignment.center,
							children: <Widget>[
								ProfileCard(girlPic),
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
								ProfileCard(guyPic),
							],
						),
						)
						
					),
				]
			)
		);
	}
}

class ProfileCard extends StatefulWidget {
  final String pic;
  const ProfileCard(this.pic);

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
									image: new AssetImage(widget.pic),
									fit: BoxFit.cover,	
								),
							),
						),
						Padding(
							padding: EdgeInsets.all(15.0),
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

class HomeTabBar extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return (
			DefaultTabController(
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
			)
		);
	}
}


class ChatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
	);
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
	);
  }
}