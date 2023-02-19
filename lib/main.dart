import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends HookWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  MyHomePage({super.key, required this.title});
  final String title;
  _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    final input = useState("");
    final checkBox = useState([]);
    final radio = useState([]);
    final dateTime = useState(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Padding(jsonSchema
        initialValue = 
        padding: const EdgeInsets.all(50),
        child: FormBuilder(
          key: _formKey,
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormBuilderTextField(
                name: "Input",
                decoration: const InputDecoration(
                  labelText: 'Label',
                ),
                onChanged: (value) => input.value = value as String,
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderCheckboxGroup<String>(
                name: "checkbox",
                validator: FormBuilderValidators.minLength(1),
                onChanged: (value) => checkBox.value = value as List<String>,
                decoration: const InputDecoration(
                  labelText: 'Label',
                ),
                options: const [
                  FormBuilderFieldOption(value: 'Dart'),
                  FormBuilderFieldOption(value: 'Kotlin'),
                  FormBuilderFieldOption(value: 'Java'),
                  FormBuilderFieldOption(value: 'Swift'),
                  FormBuilderFieldOption(value: 'Objective-C'),
                ],
              ),
              FormBuilderRadioGroup(
                name: "Radio",
                validator: FormBuilderValidators.required(),
                onChanged: (value) => radio.value = value as List<String>,
                decoration: const InputDecoration(
                  labelText: 'Label',
                ),
                options: const [
                  FormBuilderFieldOption(value: 'Dart'),
                  FormBuilderFieldOption(value: 'Kotlin'),
                  FormBuilderFieldOption(value: 'Java'),
                  FormBuilderFieldOption(value: 'Swift'),
                  FormBuilderFieldOption(value: 'Objective-C'),
                ],
              ),
              FormBuilderDateTimePicker(
                name: "date",
                decoration: const InputDecoration(
                  labelText: 'Label',
                ),
                validator: FormBuilderValidators.required(),
                initialValue: DateTime.now(),
                onChanged: (value) => dateTime.value = value as DateTime,
              ),
              Padding(
                  padding: const EdgeInsets.all(50),
                  child: ElevatedButton(
                      onPressed: () => _handleSubmit,
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.black),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
