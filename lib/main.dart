import "package:flutter/material.dart";
import "theme.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: NotesPage(),
    );
  }
}

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  TextEditingController titleCtr = TextEditingController();
  TextEditingController noteCtr = TextEditingController();
  List<String> titles = [];
  List<String> notes = [];
  List<String> dates = [];

  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  List<Color> colors = [
    Color(0xff4a8fe7),
    Color(0xff5faf7f),
    Color(0xfff5a23a),
  ];
  List<Color> lightColors = [
    Color(0xffe6f0fc),
    Color(0xffe8f3ec),
    Color(0xfffdf0e4),
  ];

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu_book, size: 30),
        title: Text("My Notes"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff8b7fe8), Color(0xff7fb8f0)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Small steps every day lead to big results.",
                            style: textTheme.headlineSmall,
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Keep going! 🚀",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.auto_stories, size: 75, color: Colors.white),
                  ],
                ),
              ),
              SizedBox(height: 25),

              Text("Add a New Note", style: textTheme.titleLarge),
              SizedBox(height: 12),
              TextField(
                controller: titleCtr,
                decoration: InputDecoration(
                  hintText: "Title",
                  prefixIcon: Icon(Icons.description_outlined),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: noteCtr,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Write your note here...",
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Icon(Icons.edit),
                  ),
                ),
              ),
              SizedBox(height: 14),
              ElevatedButton.icon(
                onPressed: () {
                  if (titleCtr.text.isEmpty) return;
                  DateTime now = DateTime.now();
                  setState(() {
                    titles.insert(0, titleCtr.text);
                    notes.insert(0, noteCtr.text);
                    dates.insert(
                      0,
                      "${months[now.month - 1]} ${now.day}, ${now.year}",
                    );
                    titleCtr.clear();
                    noteCtr.clear();
                  });
                },
                icon: Icon(Icons.add),
                label: Text("Add Note"),
              ),
              SizedBox(height: 28),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Your Notes", style: textTheme.titleLarge),
                  Text("${titles.length} notes", style: textTheme.bodySmall),
                ],
              ),
              SizedBox(height: 12),

              for (int i = 0; i < titles.length; i++)
                Container(
                  margin: EdgeInsets.only(bottom: 14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(18, 16, 4, 16),
                      decoration: BoxDecoration(
                        color: lightColors[i % 3],
                        border: Border(
                          left: BorderSide(color: colors[i % 3], width: 6),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.description,
                            color: colors[i % 3],
                            size: 28,
                          ),
                          SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(titles[i], style: textTheme.titleMedium),
                                SizedBox(height: 4),
                                Text(notes[i], style: textTheme.bodyMedium),
                                SizedBox(height: 10),
                                Text(dates[i], style: textTheme.bodySmall),
                              ],
                            ),
                          ),
                          PopupMenuButton(
                            icon: Icon(Icons.more_vert, color: greyText),
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Text("Delete"),
                                onTap: () {
                                  setState(() {
                                    titles.removeAt(i);
                                    notes.removeAt(i);
                                    dates.removeAt(i);
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
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
