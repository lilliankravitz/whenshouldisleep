import 'package:flutter/material.dart';

void main() {
  runApp(WhenShouldISleepApp());
}

class WhenShouldISleepApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'When Should I Sleep',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _departureController = TextEditingController();
  final TextEditingController _arrivalController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  String _sleepTime = '';

  void _calculateSleepTime() {
    // Add your sleep time calculation logic here
    setState(() {
      _sleepTime = 'Sleep from 2 hours after takeoff for 4 hours.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('When Should I Sleep'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _departureController,
                decoration: InputDecoration(labelText: 'Departure Time (HH:mm)'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the departure time';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _arrivalController,
                decoration: InputDecoration(labelText: 'Arrival Time (HH:mm)'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the arrival time';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _durationController,
                decoration: InputDecoration(labelText: 'Flight Duration (hours)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the flight duration';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _calculateSleepTime();
                  }
                },
                child: Text('Calculate Sleep Time'),
              ),
              SizedBox(height: 20),
              Text(
                _sleepTime,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}