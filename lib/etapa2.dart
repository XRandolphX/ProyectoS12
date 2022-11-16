// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practica_s12/FireStoreHelper.dart';
import 'package:practica_s12/modelPostulante.dart';

class ProyectoS12 extends StatefulWidget {
  //final PostulanteModel postulanteModel;
  const ProyectoS12({super.key});

  @override
  State<ProyectoS12> createState() => _ProyectoS12();
}

String _vista = 'Selecciona una opción';
/*
var listaCombo = [
  'Logistica',
  'Talento Humano',
  'Vigilancia',
  'Transporte',
  'Gerencia',
  'Soporte Oti'
];
*/

class _ProyectoS12 extends State<ProyectoS12> {
  //GLOBAL KEY PARA LAS VALIDACIONES
  final formKey = GlobalKey<FormState>();

  //LOS CONTROLADORES PARA PODER REGISTRAR
  TextEditingController _IDController = TextEditingController();
  TextEditingController _APController = TextEditingController();
  TextEditingController _AMController = TextEditingController();
  TextEditingController _NombreController = TextEditingController();
  TextEditingController _NacimientoController = TextEditingController();
  TextEditingController _SexoController = TextEditingController();
  TextEditingController _DomicilioController = TextEditingController();
  TextEditingController _TelefonoController = TextEditingController();
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _EstadoCivilController = TextEditingController();
  TextEditingController _DiscapacidadController = TextEditingController();
  TextEditingController _AreaController = TextEditingController();
  TextEditingController _DescripcionController = TextEditingController();

  @override
  void dispose() {
    _IDController.dispose();
    _APController.dispose();
    _AMController.dispose();
    _NombreController.dispose();
    _NacimientoController.dispose();
    _SexoController.dispose();
    _DomicilioController.dispose();
    _TelefonoController.dispose();
    _EmailController.dispose();
    _EstadoCivilController.dispose();
    _DiscapacidadController.dispose();
    _AreaController.dispose();
    _DescripcionController.dispose();
    super.dispose();
  }

  //CUERPO
  @override
  Widget build(BuildContext context) {
    //DECLARAMOS LA SCAFFOLD KEY
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      key: _scaffoldKey,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Postulación al trabajo'),
          centerTitle: true,
          leading: const BackButton(),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ))
          ],
          backgroundColor: Colors.blueAccent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(8, 60, 8, 8),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _IDController,
                    decoration: const InputDecoration(labelText: 'DNI'),
                    validator: ((value) {
                      return value!.isEmpty ||
                              !RegExp(r'^(\d{10}|\d{8})$').hasMatch(value)
                          ? 'Ingrese un ID válido'
                          : null;
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _APController,
                    decoration:
                        const InputDecoration(labelText: 'Apellido Paterno'),
                    validator: ((value) {
                      return value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                          ? 'Ingrese un apellido válido'
                          : null;
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _AMController,
                    decoration:
                        const InputDecoration(labelText: 'Apellido Materno'),
                    validator: ((value) {
                      return value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                          ? 'Ingrese un apellido válido'
                          : null;
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _NombreController,
                    decoration: const InputDecoration(labelText: 'Nombre'),
                    validator: ((value) {
                      return value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                          ? 'Ingrese un nombre válido'
                          : null;
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _NacimientoController,
                    decoration: const InputDecoration(labelText: 'Nacimiento'),
                    validator: ((value) {
                      return value!.isEmpty ||
                              !RegExp(r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$')
                                  .hasMatch(value)
                          ? 'Ingrese una formato de Fecha válido'
                          : null;
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _SexoController,
                    decoration: const InputDecoration(labelText: 'Sexo'),
                    validator: ((value) {
                      return value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                          ? 'Llene correctamente el campo'
                          : null;
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _DomicilioController,
                    decoration: const InputDecoration(labelText: 'Domicilio'),
                    validator: ((value) {
                      return value!.isEmpty ||
                              !RegExp(r'^(.*)$').hasMatch(value)
                          ? 'Ingrese un domicilio'
                          : null;
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _TelefonoController,
                    decoration: const InputDecoration(labelText: 'Teléfono'),
                    validator: ((value) {
                      return value!.isEmpty ||
                              !RegExp(r'^([2-9])(\d{2})(-?|\040?)(\d{4})( ?|\040?)(\d{1,4}?|\040?)$')
                                  .hasMatch(value)
                          ? 'Ingrese un teléfono válido'
                          : null;
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _EmailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: ((value) {
                      return value!.isEmpty ||
                              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                  .hasMatch(value)
                          ? 'Ingrese un correo válido'
                          : null;
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _EstadoCivilController,
                    decoration:
                        const InputDecoration(labelText: 'Estado Civil'),
                    validator: ((value) {
                      return value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                          ? 'Ingrese un estado civil'
                          : null;
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _DiscapacidadController,
                    decoration:
                        const InputDecoration(labelText: 'Discapacidad'),
                    validator: ((value) {
                      return value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                          ? 'Ingrese una discapacidad'
                          : null;
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //DATOS ADICIONALES DEL ÁREA Y DESCRIPCIÓN DEL POSTULANTE QUE SE MOSTRARÁN EN EL CUADRO
                  const Text(
                    'Por último...',
                    style: TextStyle(fontSize: 20),
                  ),

                  TextFormField(
                    controller: _AreaController,
                    decoration: const InputDecoration(labelText: 'Área'),
                    validator: ((value) {
                      return value!.isEmpty ||
                              !RegExp(r'^(.*)$').hasMatch(value)
                          ? 'Ingrese la Área a que postulará'
                          : null;
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _DescripcionController,
                    decoration: const InputDecoration(labelText: 'Descripción'),
                    validator: ((value) {
                      return value!.isEmpty ||
                              !RegExp(r'^(.*)$').hasMatch(value)
                          ? 'Ingrese una breve Descripción sobre usted'
                          : null;
                    }),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //BOTÓN REGISTRAR
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        final snackBar =
                            SnackBar(content: Text('Postulante Registrado'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        FireStoreHelper.create(PostulanteModel(
                          ID: _IDController.text,
                          ApellidoM: _AMController.text,
                          ApellidoP: _APController.text,
                          Nombres: _NombreController.text,
                          Nacimiento: _NacimientoController.text,
                          Sexo: _SexoController.text,
                          Domicilio: _DomicilioController.text,
                          Telefono: _TelefonoController.text,
                          Email: _EmailController.text,
                          EstadoCivil: _EstadoCivilController.text,
                          Discapacidad: _DiscapacidadController.text,
                          Area: _AreaController.text,
                          Descripcion: _DescripcionController.text,
                        ));
                      } else {
                        openDialog();
                      }
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueAccent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          Text(
                            "Registrar",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),

                  /*
                  DropdownButton(
                    items: listaCombo.map((String a) {
                      return DropdownMenuItem(value: a, child: Text(a));
                    }).toList(),
                    onChanged: (_value) => {
                      setState(() {
                        _vista = _value!;
                      })
                    },
                    hint: Text(_vista),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
            
                  
                  Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FractionColumnWidth(0.3),
                      1: FractionColumnWidth(0.25),
                      2: FractionColumnWidth(0.3),
                    },
                    children: [
                      buildRow(['Postulante', 'Área', 'Fortalezas y Habilidades'],
                          isHeader: true),
                      buildRow(['Rodrigo', 'Marketing', 'Buenos diseños']),
                    ],
                  ),
                  
                  Table(
                    border: TableBorder.all(),
                    children: <TableRow>[_tableRow],
                  ),
                  */

                  //LISTVIEW
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'TABLA DE LOS POSTULANTES',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    children: const [
                      Text(
                        'POSTULANTE',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 50),
                      Text(
                        'ÁREA',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 50),
                      Text(
                        'DESCRIPCIÓN',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  StreamBuilder<List<PostulanteModel>>(
                      stream: FireStoreHelper.read(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }

                        if (snapshot.hasError) {
                          return const Text('Ocurrió un Error');
                        }
                        if (snapshot.hasData) {
                          final PostulanteData = snapshot.data;

                          return SizedBox(
                              height: 300,
                              width: 800,
                              child: ListView.builder(
                                  itemCount: PostulanteData!.length,
                                  itemBuilder: ((context, index) {
                                    final singlePostulante =
                                        PostulanteData[index];
                                    return Column(
                                      children: [
                                        Table(
                                          border: TableBorder.all(),
                                          children: [
                                            buildRow([
                                              (singlePostulante
                                                  .Nombres), //Postulante
                                              (singlePostulante.Area), //Área
                                              (singlePostulante
                                                  .Descripcion) //Descripción
                                            ], isHeader: true)
                                          ],
                                        ),
                                      ],
                                    );
                                  })));
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

/*
  TableRow _tableRow = TableRow(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(8),
        child: Text('Contenido 1'),
      ),
      Padding(
        padding: EdgeInsets.all(8),
        child: Text('Contenido 2'),
      ),
      Padding(
        padding: EdgeInsets.all(8),
        child: Text('Contenido 3'),
      ),
    ],
  );

*/
  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Por favor rellene todos los campos'),
            actions: [
              TextButton(
                child: Text('Ok'),
                onPressed: submit,
              )
            ],
          ));

  void submit() {
    Navigator.of(context).pop();
  }
}

TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
        children: cells.map((cell) {
      final style = TextStyle(
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        fontSize: 18,
      );
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
            child: Text(
          cell,
          style: style,
        )),
      );
    }).toList());
