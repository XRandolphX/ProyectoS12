import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practica_s12/modelPostulante.dart';

class FireStoreHelper {
  static Stream<List<PostulanteModel>> read() {
    final postulanteCollection =
        FirebaseFirestore.instance.collection('Postulante');
    return postulanteCollection.snapshots().map((QuerySnapshot) => QuerySnapshot
        .docs
        .map((e) => PostulanteModel.fromSnapshot(e))
        .toList());
  }

  static Future create(PostulanteModel postulante) async {
    final postulanteCollection =
        FirebaseFirestore.instance.collection('Postulante');

    final docRef = postulanteCollection.doc();

    final newPostulante = PostulanteModel(
      ID: postulante.ID,
      ApellidoP: postulante.ApellidoP,
      ApellidoM: postulante.ApellidoM,
      Nombres: postulante.Nombres,
      Nacimiento: postulante.Nacimiento,
      Sexo: postulante.Sexo,
      Domicilio: postulante.Domicilio,
      Telefono: postulante.Telefono,
      Email: postulante.Email,
      EstadoCivil: postulante.EstadoCivil,
      Discapacidad: postulante.Discapacidad,
      Area: postulante.Area,
      Descripcion: postulante.Descripcion,
    ).toJson();

    try {
      await docRef.set(newPostulante);
    } catch (e) {
      print('Ocurrió un Error $e');
    }
  }
}
