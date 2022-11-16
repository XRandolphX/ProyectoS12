import 'package:cloud_firestore/cloud_firestore.dart';

class PostulanteModel {
  final String ID,
      ApellidoM,
      ApellidoP,
      Nombres,
      Nacimiento,
      Sexo,
      Domicilio,
      Telefono,
      Email,
      EstadoCivil,
      Discapacidad,
      Area,
      Descripcion;

  PostulanteModel({
    required this.ID,
    required this.ApellidoM,
    required this.ApellidoP,
    required this.Nombres,
    required this.Nacimiento,
    required this.Sexo,
    required this.Domicilio,
    required this.Telefono,
    required this.Email,
    required this.EstadoCivil,
    required this.Discapacidad,
    required this.Area,
    required this.Descripcion,
  });

  factory PostulanteModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return PostulanteModel(
      ID: snapshot['ID'],
      ApellidoM: snapshot['ApellidoM'],
      ApellidoP: snapshot['ApellidoP'],
      Nombres: snapshot['Nombres'],
      Nacimiento: snapshot['Nacimiento'],
      Sexo: snapshot['Sexo'],
      Domicilio: snapshot['Domicilio'],
      Telefono: snapshot['Telefono'],
      Email: snapshot['Email'],
      EstadoCivil: snapshot['EstadoCivil'],
      Discapacidad: snapshot['Discapacidad'],
      Area: snapshot['Area'],
      Descripcion: snapshot['Descripcion'],
    );
  }

  Map<String, dynamic> toJson() => {
        'ID': ID,
        'ApellidoM': ApellidoM,
        'ApellidoP': ApellidoP,
        'Nombres': Nombres,
        'Nacimiento': Nacimiento,
        'Sexo': Sexo,
        'Domicilio': Domicilio,
        'Telefono': Telefono,
        'Email': Email,
        'EstadoCivil': EstadoCivil,
        'Discapacidad': Discapacidad,
        'Area': Area,
        'Descripcion': Descripcion,
      };
}
