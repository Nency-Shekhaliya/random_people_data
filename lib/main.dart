import 'package:flutter/material.dart';
import 'package:random_people_data/models/helper/api_helper.dart';

void main() {
  runApp(const MyRandom_App());
}

class MyRandom_App extends StatefulWidget {
  const MyRandom_App({Key? key}) : super(key: key);

  @override
  State<MyRandom_App> createState() => _MyRandom_AppState();
}

class _MyRandom_AppState extends State<MyRandom_App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: Apihelper.apihelper.Getdata(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else if (snapshot.hasData) {
                        Map? p = snapshot.data;
                        return Column(
                          children: [
                            Container(
                              height: 180,
                              padding: const EdgeInsets.all(5),
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xff645CBB),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: 160,
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: NetworkImage(p!['results'][0]
                                            ['picture']['large']),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(top: 20),
                              height: 350,
                              width: 330,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xffECF2FF)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${p!['results'][0]['name']['title']}',
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff645CBB)),
                                      ),
                                      Text(
                                        '  ${p!['results'][0]['name']['first']}',
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff645CBB)),
                                      ),
                                      Text(
                                        '  ${p['results'][0]['name']['last']}',
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff645CBB)),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text.rich(TextSpan(children: [
                                    const TextSpan(
                                        text: "Geneder :",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff645CBB))),
                                    TextSpan(
                                        text: " ${p!['results'][0]['gender']}",
                                        style: const TextStyle(fontSize: 15)),
                                  ])),
                                  Text.rich(TextSpan(children: [
                                    const TextSpan(
                                        text: "DOB        :",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff645CBB),
                                        )),
                                    TextSpan(
                                        text:
                                            " ${p['results'][0]['dob']['date']}",
                                        style: const TextStyle(
                                          fontSize: 15,
                                        )),
                                  ])),
                                  Text.rich(TextSpan(children: [
                                    const TextSpan(
                                        text: "Email      :",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff645CBB))),
                                    TextSpan(
                                        text: " ${p['results'][0]['email']}",
                                        style: const TextStyle(fontSize: 15)),
                                  ])),
                                  Text.rich(TextSpan(children: [
                                    const TextSpan(
                                        text: "Phone    :",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff645CBB))),
                                    TextSpan(
                                        text: " ${p['results'][0]['phone']}",
                                        style: const TextStyle(fontSize: 15)),
                                  ])),
                                  Text.rich(TextSpan(children: [
                                    const TextSpan(
                                        text: "City         :",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff645CBB))),
                                    TextSpan(
                                        text:
                                            " ${p['results'][0]['location']['city']}",
                                        style: const TextStyle(fontSize: 15)),
                                  ])),
                                  Text.rich(TextSpan(children: [
                                    const TextSpan(
                                        text: "State      :",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff645CBB))),
                                    TextSpan(
                                        text:
                                            " ${p['results'][0]['location']['state']}",
                                        style: const TextStyle(fontSize: 15)),
                                  ])),
                                  Text.rich(TextSpan(children: [
                                    const TextSpan(
                                        text: "Country  :",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff645CBB))),
                                    TextSpan(
                                        text:
                                            " ${p['results'][0]['location']['country']}",
                                        style: const TextStyle(fontSize: 15)),
                                  ])),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 20),
                                height: 50,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: const Color(0xff645CBB),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Text(
                                  "Refresh",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            )
                          ],
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
