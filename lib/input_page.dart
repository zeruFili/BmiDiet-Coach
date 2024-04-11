import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Reusable.dart';
import 'CustomIcon.dart';
import 'result.dart';
import 'brain.dart';

const Color colo = Color(0xFF1D1E33);
const Color activeColor = Color(0xFF3B3F5B);
const Color inactiveColor = Color(0xFF111328);
const TextStyle numstyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  color: Colors.white,
);
const TextStyle stylea = TextStyle(
  fontSize: 18,
  color: Colors.white,
);

enum gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveColor;
  Color femaleCardColor = inactiveColor;
  gender? selected;

  void updateColor(gender selectedGender) {
    setState(() {
      selected = selectedGender;
      maleCardColor = selected == gender.male ? activeColor : inactiveColor;
      femaleCardColor = selected == gender.female ? activeColor : inactiveColor;
    });
  }

  int height = 180;
  int weight = 60;
  List<String> bloodTypes = [
    'A',
    'A-',
    'A+',
    'B',
    'B-',
    'B+',
    'O',
    'O-',
    'O+',
    'AB'
  ];
  int bloodTypeIndex = 0;

  void minus() {
    setState(() {
      weight = weight - 1;
    });
  }

  void plus() {
    setState(() {
      weight = weight + 1;
    });
  }

  gesture({gen, selected}) {
    String gen = '';

    return GestureDetector(
      onTap: () {
        updateColor(gender.male);
      },
      child: Reusable(
        colored: selected == gender.male ? activeColor : inactiveColor,
        card: CustomIcon(
          icon: FontAwesomeIcons.mars,
          gender: gen,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF1D1E33),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    updateColor(gender.male);
                  },
                  child: Reusable(
                    colored: maleCardColor,
                    card: CustomIcon(
                      icon: FontAwesomeIcons.mars,
                      gender: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    updateColor(gender.female);
                  },
                  child: Reusable(
                    colored: femaleCardColor,
                    card: CustomIcon(
                      icon: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: stylea,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: numstyle),
                      Text('cm', style: stylea)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTickMarkColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                buildMetricSection(
                  title: 'Weight',
                  value: weight,
                  increment: () {
                    setState(() {
                      weight++;
                    });
                  },
                  decrement: () {
                    setState(() {
                      weight--;
                    });
                  },
                ),
                buildMetricSectioned(
                  title: 'Blood Type',
                  value: bloodTypes[bloodTypeIndex],
                  increment: () {
                    setState(() {
                      bloodTypeIndex = (bloodTypeIndex + 1) % bloodTypes.length;
                    });
                  },
                  decrement: () {
                    setState(() {
                      bloodTypeIndex =
                          (bloodTypeIndex - 1 + bloodTypes.length) %
                              bloodTypes.length;
                    });
                  },
                  // Provide a default value for the new parameter
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calc brain = Calc(
                  height: height,
                  weight: weight,
                  bloodType: bloodTypes[bloodTypeIndex]);

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Result(
                    brain.Bmi(), brain.getResult(), brain.getInterpretation());
              }));
            },
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(color: Color(0xFFEB1555)),
              height: 80.0,
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 15),
              child: Center(
                child: Text(
                  'Calaculate',
                  style: numstyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Roundicon extends StatelessWidget {
  final IconData ico;
  final VoidCallback onPressed;

  Roundicon(this.ico, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      child: Icon(ico),
    );
  }
}

Expanded buildMetricSection({
  required String title,
  required int value,
  required void Function() increment,
  required void Function() decrement,
}) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: stylea,
          ),
          Text(
            value.toString(),
            style: numstyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Roundicon(
                FontAwesomeIcons.plus,
                onPressed: increment,
              ),
              SizedBox(
                width: 10.0,
              ),
              Roundicon(
                FontAwesomeIcons.minus,
                onPressed: decrement,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Expanded buildMetricSectioned({
  required String title,
  required String value,
  required void Function() increment,
  required void Function() decrement,
}) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color(0xFF1D1E33),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: stylea,
          ),
          Text(
            value.toString(),
            style: numstyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Roundicon(
                FontAwesomeIcons.plus,
                onPressed: increment,
              ),
              SizedBox(
                width: 10.0,
              ),
              Roundicon(
                FontAwesomeIcons.minus,
                onPressed: decrement,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
