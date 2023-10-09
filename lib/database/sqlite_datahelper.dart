import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:developer' as developer;

import '../model/entry.dart';

class SqLiteDataHelper {
  final String _tableName = "demoEntries";

  // Get
  Future<Database> getDataBase() async {
    return openDatabase(
      join(await getDatabasesPath(), "entries.db"),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $_tableName ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "farmerName TEXT, "
          "language TEXT, "
          "farmerType TEXT, "
          "number TEXT, "
          "irrigationSource TEXT, "
          "irrigationType TEXT, "
          "crops TEXT)",
        );
      },
      version: 1,
    );
  }

  // Create
  Future<int> insertEntry(Entry entry) async {
    try {
      final Database db = await getDataBase();
      final int id = await db.insert(_tableName, entry.toMap());
      return id;
    } catch (e) {
      // Handle any exceptions that might occur during the insertion process.
      // You can log the error or throw it to the calling code for further handling.
      developer.log("Error inserting entry: $e");
      return -1; // Return a failure indicator or throw an exception as needed.
    }
  }

  // Read
  Future<List<Entry>> getAllEntries() async {
    Database db = await getDataBase();
    List<Map<String, dynamic>> entriesMap = await db.query(_tableName);
    return List.generate(entriesMap.length, (index) {
      return Entry(
        id: entriesMap[index]["id"],
        farmerName: entriesMap[index]["farmerName"],
        language: entriesMap[index]["language"],
        farmerType: entriesMap[index]["farmerType"],
        number: entriesMap[index]["number"],
        irrigationSource: entriesMap[index]["irrigationSource"],
        irrigationType: entriesMap[index]["irrigationType"],
        crops: entriesMap[index]["crops"],
      );
    });
  }
}
