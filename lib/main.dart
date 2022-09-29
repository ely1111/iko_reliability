import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iko_reliability/routes/route.gr.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'admin/asset_storage.dart';
import 'admin/db_drift.dart';
import 'admin/end_drawer.dart';
import 'admin/observation_list_storage.dart';
import 'admin/template_notifier.dart';

MyDatabase? database;
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AssetAdapter());
  Hive.registerAdapter(ObservationsAdapter());
  Hive.registerAdapter(ObservationListAdapter());
  await Hive.openBox('assets');
  await Hive.openBox('pmNumber');
  await Hive.openBox('jpNumber');
  await Hive.openBox('routeNumber');
  await Hive.openBox('observationList');
  var box = Hive.box('jpNumber');
  box.clear();
  box = Hive.box('pmNumber');
  box.clear();
  box = Hive.box('routeNumber');
  box.clear();
  database = MyDatabase();
  runApp(
    MyApp(),
  );
}

class MaximoServerNotifier extends ChangeNotifier {
  String maximoServerSelected = 'TEST';

  void setServer(String server) {
    maximoServerSelected = server;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter(navigatorKey);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TemplateNotifier()),
        ChangeNotifierProvider(create: (context) => MaximoServerNotifier()),
      ],
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: 'Flutter Demo',
        theme: ThemeData(
            useMaterial3: true, colorSchemeSeed: const Color(0xFFFF0000)),
        darkTheme: ThemeData.dark().copyWith(useMaterial3: true),
        themeMode: ThemeMode.system,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IKO Reliability Maximo Tool (beta)"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'IKO Reliability Maximo',
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'display name...',
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text('userid'),
                Text('Status'),
                Text('environment'),
              ],
            )),
            const ListTile(
              leading: Icon(Icons.message),
              title: Text('Home'),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Test'),
              onTap: () {
                context.router.pushNamed("/test");
                // change app state...
                Navigator.pop(context); // close the drawer
              },
            ),
            ExpansionTile(
              title: const Text("Request PMs"),
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Assets'),
                  onTap: () {
                    context.router.pushNamed("/asset");
                    // change app state...
                    Navigator.pop(context); // close the drawer
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: const Text("Maximo Admin"),
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Validate PMs'),
                  onTap: () {
                    context.router.pushNamed("/pm/check");
                    // change app state...
                    Navigator.pop(context); // close the drawer
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Create Assets'),
                  onTap: () {
                    context.router.pushNamed("/asset");
                    // change app state...
                    Navigator.pop(context); // close the drawer
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Create Contractors'),
                  onTap: () {
                    context.router.pushNamed("/contractor");
                    // change app state...
                    Navigator.pop(context); // close the drawer
                  },
                ),
              ],
            )
          ],
        ),
      ),
      body: ListView(children: const <Widget>[
        ListTile(
          // a spacer
          title: Text(
              'Open the menu on the right, then select a module to get started'),
        ),
        ListTile(
          // a spacer
          title: Text(
              'For Asset Criticality Generator, save the processed breakdown data into sharepoint'),
        )
      ]),
      endDrawer: const EndDrawer(),
    );
  }
}

showDataAlert(List<String> messages, String title) {
  showDialog(
    context: navigatorKey.currentContext!,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              20.0,
            ),
          ),
        ),
        contentPadding: const EdgeInsets.only(
          top: 10.0,
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 24.0),
        ),
        content: SizedBox(
          height: 400,
          width: 400,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Text(
                  //   "Mension Your ID ",
                  // ),
                  // const TextField(
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       hintText: 'Enter Id here',
                  //       labelText: 'ID'),
                  // ),
                  ...messageListTile(messages),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "OK",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

List<Widget> messageListTile(List<String> messages) {
  List<Widget> list = [];
  for (final msg in messages) {
    list.add(Text(msg));
  }
  return list;
}
