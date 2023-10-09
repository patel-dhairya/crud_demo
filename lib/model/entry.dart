class Entry {
  final int id;
  final String? farmerName;
  final String? language;
  final String? farmerType;
  final String? number;
  final String? irrigationSource;
  final String? irrigationType;
  final String? crops;

  const Entry(
      {required this.id,
      this.farmerName,
      this.language,
      this.farmerType,
      this.number,
      this.irrigationSource,
      this.irrigationType,
      this.crops});

  factory Entry.fromMap(Map<String, dynamic> json) => Entry(
      id: json["id"],
      farmerName: json["farmerName"],
      language: json["language"],
      farmerType: json["farmerType"],
      number: json["number"],
      irrigationSource: json["irrigationSource"],
      irrigationType: json["irrigationType"],
      crops: json["crops"]);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'farmerName': farmerName,
      'language': language,
      'farmerType': farmerType,
      'number': number,
      'irrigationSource': irrigationSource,
      'irrigationType': irrigationType,
      'crops': crops,
    };
  }
}
