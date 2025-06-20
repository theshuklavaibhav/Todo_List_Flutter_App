import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/task_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => TaskProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final TextEditingController inputText = TextEditingController();
//   String displayInput = '';

//   void display() {
//     setState(() {
//       displayInput = inputText.text;
//       print('$displayInput');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Textfield Controler Demo'),
//           centerTitle: true,
//           backgroundColor: Color.fromARGB(255, 15, 139, 255),
//           foregroundColor: Colors.white,
//         ),

//         body: Center(
//           child: Column(
//             children: [
//               const SizedBox(height: 200),
//               Text('TextField Widget Below'),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: inputText,
//                 decoration: InputDecoration(
//                   labelText: 'Username',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               FloatingActionButton(
//                 onPressed: display,
//                 child: Icon(Icons.add),
//               ),
//               const SizedBox(height: 20),

//               Text(
//                 'Input Text : $displayInput ',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
