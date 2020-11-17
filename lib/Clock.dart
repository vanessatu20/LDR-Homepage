import 'package:flutter/material.dart';
import 'dart:async';

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