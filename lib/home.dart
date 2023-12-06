import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class Home extends StatefulWidget {
  final Function(Locale) changeLanguage;
  const Home({Key? key, required this.changeLanguage}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isChecked = false;
  bool _isSwitch = false;
  int _radioValue = 0;

  final List<ChipData> _chipData = [
    ChipData(label: 'Chip 1'),
    ChipData(label: 'Chip 2'),
    ChipData(label: 'Chip 3'),
  ];

  final List<String> _dropdownOptions = ['Option A', 'Option B', 'Option C'];
  String _selectedDropdownValue = 'Option A';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar-s'.i18n()),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Select Language'),
                    content: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            widget.changeLanguage(const Locale('en', 'US'));
                            Navigator.pop(context);
                          },
                          child: const Text('English'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            widget.changeLanguage(const Locale('es', 'ES'));
                            Navigator.pop(context);
                          },
                          child: const Text('Español'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            widget.changeLanguage(const Locale('id', 'ID'));
                            Navigator.pop(context);
                          },
                          child: const Text('Indonesia'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            widget.changeLanguage(const Locale('it', 'IT'));
                            Navigator.pop(context);
                          },
                          child: const Text('Italy'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Semantics(
            label: 'Judul Aplikasi',
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Semantics(
                child: Text(
                  'Title'.i18n(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Semantics(
              label: 'User Name Input',
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Name'.i18n(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: MergeSemantics(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(
                      Icons.help,
                      semanticLabel: 'Bantuan',
                    ),
                    title: Semantics(
                      label: 'Text-call'.i18n(),
                      child: Text(
                        'Text-call'.i18n(),
                        style: const TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.email,
                      semanticLabel: 'email',
                    ),
                    title: const Text(
                      'johndoe@test.com',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: MergeSemantics(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  Semantics(
                    hint: _isChecked
                      ? 'Anda Memilih untuk Setuju'
                      : 'Anda belum Setuju',
                    child: Text('Checkbox-agree'.i18n()),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Semantics(
                      onTapHint: 'Ketuk 2 kali untuk masuk ke aplikasi',
                      child: Text('Button-sign-in'.i18n())
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Semantics(
                      onTapHint: 'Ketuk 2 kali untuk keluar ke aplikasi',
                      child: Text('Button-sign-out'.i18n())
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Semantics(
                      label: 'Radio Button Opsi ke 1',
                      child: Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: (value) {
                              setState(() {
                                _radioValue = value!;
                              });
                            },
                          ),
                          Text('Option-1'.i18n()),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Semantics(
                      label: 'Radio Button Opsi ke 2',
                      child: Row(
                        children: [
                          Radio(
                              value: 2,
                              groupValue: _radioValue,
                              onChanged: (value) {
                                setState(() {
                                  _radioValue = value!;
                                });
                              },
                            ),
                          Text('Option-2'.i18n()),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  children: _chipData.map((chip) {
                    return Semantics(
                      label: chip.label,
                      child: InputChip(
                        label: Text(chip.label),
                        onPressed: () {
                          setState(() {
                            chip.selected = !chip.selected;
                          });
                        },
                        selected: chip.selected,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                Semantics(
                  label: 'Pilih opsi',
                  child: DropdownButton<String>(
                    value: _selectedDropdownValue,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedDropdownValue = newValue!;
                      });
                    },
                    items: _dropdownOptions.map((option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          MergeSemantics(
            child: Semantics(
              label: _isSwitch ? 'Hidup' : 'Mati',
              child: Switch(
                value: _isSwitch,
                onChanged: (value) {
                  setState(() {
                    _isSwitch = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Semantics(
        label: 'Memencet Floating Action Button',
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class ChipData {
  final String label;
  bool selected;

  ChipData({required this.label, this.selected = false});
}