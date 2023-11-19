import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late List<String> _filteredList;
  String _keywords = '';
  final List<String> _originList = [
    'Dog',
    'Cat',
    'Elephant',
    'Giraffe',
    'Lion',
    'Tiger',
    'Zebra',
    'Monkey',
    'Kangaroo',
    'Panda',
    'Hippo',
    'Rhino',
    'Bear',
    'Fox',
    'Deer',
    'Wolf',
    'Squirrel',
    'Rabbit',
    'Otter',
    'Hedgehog',
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _filteredList = _originList;
    _originList.sort();
    _searchController.addListener(_search);
    super.initState();
  }

  void _search() {
    setState(() {
      _keywords = _searchController.text;
      _filteredList = _originList
          .where((animal) =>
              animal.toLowerCase().contains(_keywords.toLowerCase()))
          .toList();
    });
  }

  Widget _buildList({required List<String> list}) => Expanded(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              color: Colors.lightGreenAccent, // Ubah warna latar belakang Card
              child: ListTile(
                title: Text(
                  list[index],
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                onTap: () {
                  // Tambahkan aksi ketika item dipilih (opsional)
                },
              ),
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Cari Hewan',
              hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 18),
              prefixIcon: const Icon(Icons.search, color: Colors.blueGrey),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(height: 20),
          _buildList(list: _keywords.isEmpty ? _originList : _filteredList),
        ],
      ),
    );
  }
}
