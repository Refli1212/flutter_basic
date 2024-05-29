import 'package:flutter/material.dart';
import 'package:flutter_basic/mahasiswa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hello flutter basic '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isloading = true;
  List<Mahasiswa> listMahasiswa = [
    Mahasiswa(nim: 123, nama: 'suntu', asal: 'paguyaman'),
    Mahasiswa(nim: 124, nama: 'sinti', asal: 'marisa'),
    Mahasiswa(nim: 125, nama: 'sinta', asal: 'telaga'),
    Mahasiswa(nim: 127, nama: 'santi', asal: 'limboto'),
    Mahasiswa(nim: 128, nama: 'santo', asal: 'limboto2'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (contex, index) {
          return InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text('data mahasiswa'),
                      content: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('nama :'),
                            Text(listMahasiswa[index].nama)
                          ],
                        ),
                      ]),
                    );
                  });
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Text('${listMahasiswa[index].nim}'),
              ),
              title: Text('${listMahasiswa[index].nama}'),
              subtitle: Text('${listMahasiswa[index].asal}'),
            ),
          );
        },
        itemCount: listMahasiswa.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
