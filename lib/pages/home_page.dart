import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String cityName = "Jakarta";
    int currTemp = 32;
    int maxTemp = 35;
    int minTemp = 31;

    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    List<Map<String, dynamic>> forecastData = [
      {
        "time": "Hari ini",
        "icon": FontAwesomeIcons.solidSun,
        "temp": "2°C",
        "windSpeed": "20 km/h",
        "precipitation": "0%"
      },
      {
        "time": "15:00",
        "icon": FontAwesomeIcons.cloud,
        "temp": "1°C",
        "windSpeed": "10 km/h",
        "precipitation": "40%"
      },
      {
        "time": "16:00",
        "icon": FontAwesomeIcons.cloudShowersHeavy,
        "temp": "0°C",
        "windSpeed": "25 km/h",
        "precipitation": "80%"
      },
      {
        "time": "17:00",
        "icon": FontAwesomeIcons.snowflake,
        "temp": "-2°C",
        "windSpeed": "28 km/h",
        "precipitation": "60%"
      },
    ];

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : Colors.white,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.width * 0.05,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.bars,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                          Align(
                            child: Text(
                              "Weather App",
                              style: GoogleFonts.questrial(
                                color: isDarkMode ? Colors.white : Colors.black,
                                fontSize: size.height * 0.025,
                              ),
                            ),
                          ),
                          FaIcon(
                            FontAwesomeIcons.circlePlus,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.01),
                      child: Align(
                        child: Text(
                          cityName,
                          style: GoogleFonts.questrial(
                            color: isDarkMode ? Colors.white : Colors.black,
                            fontSize: size.height * 0.07,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Align(
                        child: Text(
                          "Hari ini",
                          style: GoogleFonts.questrial(
                            color: isDarkMode ? Colors.white : Colors.black54,
                            fontSize: size.height * 0.035,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: Align(
                        child: Text(
                          "$currTemp° C",
                          style: GoogleFonts.questrial(
                            color: currTemp <= 0
                                ? Colors.blue[100]
                                : currTemp > 0 && currTemp <= 26
                                    ? Colors.blue
                                    : currTemp > 27 && currTemp <= 32
                                        ? Colors.blue[900]
                                        : Colors.red[900],
                            fontSize: size.height * 0.1,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Align(
                        child: Text(
                          "Cerah",
                          style: GoogleFonts.questrial(
                            color: isDarkMode ? Colors.white : Colors.black54,
                            fontSize: size.height * 0.03,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: Align(
                        child: Text(
                          "$minTemp° C/$maxTemp° C",
                          style: GoogleFonts.questrial(
                            color: minTemp + maxTemp <= 0
                                ? Colors.blue[100]
                                : minTemp + maxTemp > 0 && minTemp <= 26
                                    ? Colors.blue
                                    : minTemp + maxTemp > 27 && minTemp <= 32
                                        ? Colors.blue[900]
                                        : Colors.red[900],
                            fontSize: size.height * 0.03,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.width * 0.05,
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ramalan Hari Ini",
                            style: GoogleFonts.questrial(
                              fontSize: size.height * 0.03,
                              fontWeight: FontWeight.w600,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: forecastData.map((forecast) {
                              return Column(
                                children: [
                                  Text(
                                    forecast['time'],
                                    style: GoogleFonts.questrial(
                                      fontSize: size.height * 0.02,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  FaIcon(forecast['icon'],
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black),
                                  SizedBox(height: size.height * 0.01),
                                  SizedBox(height: size.height * 0.005),
                                  Text(
                                    forecast['temp'],
                                    style: GoogleFonts.questrial(
                                      fontSize: size.height * 0.028,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.wind,
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black38,
                                  ),
                                  Text(
                                    forecast['windSpeed'],
                                    style: GoogleFonts.questrial(
                                      fontSize: size.height * 0.022,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black54,
                                    ),
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.umbrella,
                                    color:
                                        isDarkMode ? Colors.white : Colors.blue,
                                  ),
                                  Text(
                                    forecast['precipitation'],
                                    style: GoogleFonts.questrial(
                                      fontSize: size.height * 0.022,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.blue,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Text(
                        'Ramalan 7 hari',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: size.width * 0.05),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey[300]!,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hari ini',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          FaIcon(
                            FontAwesomeIcons.cloud,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                          Text(
                            "$minTemp°C",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "$maxTemp°C",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
