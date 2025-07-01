import 'package:editable/editable.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editable example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        extensions: const <ThemeExtension<dynamic>>[
          EditableThemeData(
            borderColor: Colors.blueGrey,
            tdStyle: TextStyle(fontWeight: FontWeight.bold),
            trHeight: 80,
            thStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            thAlignment: TextAlign.center,
            thVertAlignment: CrossAxisAlignment.end,
            thPaddingBottom: 3,
            tdAlignment: TextAlign.left,
            tdEditableMaxLines: 100,
            tdPaddingTop: 0,
            tdPaddingBottom: 14,
            tdPaddingLeft: 10,
            tdPaddingRight: 8,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
          ),
        ],
      ),
      home: MyHomePage(title: 'Editable example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Create a Key for EditableState
  final _editableKey = GlobalKey<EditableState>();

  /// NOTE: month column feels redundant, considering we have date
  List rows = [
    {
      "name": 'James LongName Joe',
      "date": '23/09/2020',
      "month": 'June',
      "status": 'completed',
    },
    {
      "name": 'Daniel Paul',
      "month": 'March',
      "status": 'new',
      "date": '12/4/2020',
    },
    {
      "month": 'May',
      "name": 'Mark Zuckerberg',
      "date": '09/4/1993',
      "status": 'expert',
    },
    {
      "name": 'Jack',
      "status": 'legend',
      "date": '01/7/1820',
      "month": 'December',
    },
  ];
  List cols = [
    {"title": 'Name', 'widthFactor': 0.2, 'key': 'name', 'editable': false},
    {"title": 'Date', 'widthFactor': 0.2, 'key': 'date'},
    {"title": 'Month', 'widthFactor': 0.2, 'key': 'month'},
    {"title": 'Status', 'key': 'status'},
  ];

  /// Function to add a new row
  /// Using the global key assigined to Editable widget
  /// Access the current state of Editable
  void _addNewRow() {
    ///  TODO: this can be improved to a dialog form that takes params and adds a new row
    ///  Reason for the above is row has empty values for Name column
    setState(() {
      _editableKey.currentState!.createRow();
    });
  }

  ///Print only edited rows.
  void _printEditedRows() {
    List editedRows = _editableKey.currentState!.editedRows;
    print(editedRows);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () => _printEditedRows(),
              child: Text(
                'Print Edited Rows',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 80,
              child: ElevatedButton.icon(
                icon: Icon(Icons.add, color: colors.onSecondary),
                label: Text('Add row'),
                onPressed: () async {
                  _addNewRow();
                  // final result = await showCreateDialog(context);
                  // if (result == true && context.mounted) {
                  //   onCreateSuccess?.call();
                  // }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.secondary,
                  foregroundColor: colors.onSecondary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  textStyle: const TextStyle(fontSize: 14),
                ),
              ),
            ),
            Expanded(
              child: Editable(
                key: _editableKey,
                columns: cols,
                rows: rows,
                zebraStripe: true,
                stripeColor1: Color.fromRGBO(100, 155, 200, 0.5),
                stripeColor2: Color.fromRGBO(165, 175, 185, 0.5),
                onRowSaved: (value) {
                  print(value);
                },
                onSubmitted: (value) {
                  print(value);
                },
                showSaveIcon: true,
                saveIconColor: Colors.black,
                showCreateButton: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
