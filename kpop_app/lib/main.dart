import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'K-Pop App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

// ================= HOME PAGE =================

class HomePage extends StatelessWidget {

  final List<Map<String, String>> idolList = [
    {
      "name": "Jennie",
      "group": "BLACKPINK",
      "image": "assets/image/jennie.jpeg",
      "desc": "Main rapper dan fashion icon dari BLACKPINK."
    },
    {
      "name": "Wonwoo",
      "group": "SEVENTEEN",
      "image": "assets/image/wonwoo.jpeg",
      "desc": "Member SEVENTEEN dengan suara deep voice."
    },
    {
      "name": "Karina",
      "group": "aespa",
      "image": "assets/image/karina.jpeg",
      "desc": "Leader aespa dengan visual yang terkenal."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("K-Pop Idol"),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: idolList.length,
        itemBuilder: (context, index) {

          final idol = idolList[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    name: idol['name']!,
                    group: idol['group']!,
                    image: idol['image']!,
                    desc: idol['desc']!,
                  ),
                ),
              );
            },

            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),

              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(15),
              ),

              child: Row(
                children: [

                  // GAMBAR
                  Container(
                    width: 100,
                    height: 100,

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),

                      child: Image.asset(
                        idol['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(width: 15),

                  // TEXT
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          idol['name']!,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          idol['group']!,
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          idol['desc']!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormPage(),
            ),
          );
        },
      ),
    );
  }
}

// ================= DETAIL PAGE =================

class DetailPage extends StatelessWidget {

  final String name;
  final String group;
  final String image;
  final String desc;

  DetailPage({
    required this.name,
    required this.group,
    required this.image,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),

                child: Image.asset(
                  image,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 20),

            Text(
              name,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              "Group: $group",
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 15),

            Text(
              desc,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= FORM PAGE =================

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  TextEditingController biasController = TextEditingController();

  String hasilBias = "";

  void submitData() {

    setState(() {
      hasilBias = biasController.text;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Bias favorit berhasil disimpan!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Form Bias"),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextField(
              controller: biasController,

              decoration: InputDecoration(
                labelText: "Masukkan nama bias",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: submitData,
              child: Text("Submit"),
            ),

            SizedBox(height: 30),

            Text(
              "Bias Favorit Kamu:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              hasilBias,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}