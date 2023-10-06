import 'package:flutter/material.dart';
import 'package:heartdisease/models/heart_data.dart';
import 'package:heartdisease/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  final _formKey = GlobalKey<FormState>();
  double? _score;

  // Variable para controlar si se muestra el formulario o el resultado
  bool _showForm = true;

  HeartData _heartData = HeartData(
    age: 0,
    sex: 0,
    cp: 0,
    trestbps: 0,
    chol: 0,
    fbs: 0,
    restecg: 0,
    thalach: 0,
    exang: 0,
    oldpeak: 0.0,
    slope: 0,
    ca: 0,
    thal: 0,
  );

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        final score = await _apiService.postHeartData(_heartData);
        setState(() {
          _score = score.score;
          _showForm = false; // Oculta el formulario
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al obtener el resultado'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heart-disease'),
        backgroundColor: Color(0xFFa3c04a), // Cambiar color del AppBar
        elevation: 0, // Eliminar sombra del AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Para que el formulario sea desplazable si es largo
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_showForm)
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Alinea el texto a la izquierda
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Edad',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _heartData.age = int.tryParse(value) ?? 0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Sexo',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _heartData.sex = int.tryParse(value) ?? 0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Cp',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _heartData.cp = int.tryParse(value) ?? 0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Trestbps',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _heartData.trestbps = int.tryParse(value) ?? 0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Chol',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _heartData.chol = int.tryParse(value) ?? 0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Fbs',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _heartData.fbs = int.tryParse(value) ?? 0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Restecg',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _heartData.restecg = int.tryParse(value) ?? 0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Thalach',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _heartData.thalach = int.tryParse(value) ?? 0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Exang',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _heartData.exang = int.tryParse(value) ?? 0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Oldpeak',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) {
                          _heartData.oldpeak = double.tryParse(value) ?? 0.0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Slope',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _heartData.slope = int.tryParse(value) ?? 0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Ca',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _heartData.ca = int.tryParse(value) ?? 0;
                        },
                      ),
                      SizedBox(height: 12), // Agregar espacio entre los campos
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Thal',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          _heartData.thal = int.tryParse(value) ?? 0;
                        },
                      ),
                      SizedBox(height: 16), // Agregar espacio entre los campos

                      ElevatedButton(
                        onPressed: _submitForm,
                        child: Text('Calcular'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(
                              0xFFa3c04a), // Cambiar color de fondo del botón
                        ),
                      ),
                    ],
                  ),
                ),
              if (!_showForm && _score != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 50.0), // Añadir espacio vertical
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Resultado: $_score',
                          style: TextStyle(
                            fontSize:
                                24, // Aumentar el tamaño del texto del resultado
                          ),
                        ),
                        SizedBox(
                            height:
                                24), // Espacio entre el resultado y el botón
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _showForm =
                                  true; // Muestra el formulario nuevamente
                            });
                          },
                          child: Text('Volver al formulario'),
                          style: ElevatedButton.styleFrom(
                            primary: Color(
                                0xFFa3c04a), // Cambiar color de fondo del botón
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
