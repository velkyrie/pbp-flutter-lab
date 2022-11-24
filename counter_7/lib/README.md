# README Tugas Flutter PBP
Vladi Jingga Mentari
2106635631
PBP A

## Tugas 8

### Perbedaan `Navigator.push()` dan `Navigator.pushReplacement()`?
`Navigator.push()`adalah method yang digunakan untuk menambahkan _route_
lain ke _navigation stack_, dan halaman baru ditampilkan di atas halaman sebelumnya.

`Navigator.pushReplacement()` adalah 
Method ini juga digunakan untuk menambahkan _route_ lain ke _navigation stack_, tetapi method ini akan menghapus _page_ sebelumnya dari _stack_.
<details>
  <summary>Lihat Ilustrasi</summary>
<img width="598" alt="Screen Shot 2022-11-17 at 09 45 29" src="https://user-images.githubusercontent.com/52811288/202342114-891cbd10-8040-40a1-8bc9-336c77a85c2e.png">
</details>

### _Widget_ yang digunakan
1. Scaffold: sebagai _layout_ utama app
2. Appbar: menampilkan judul app
3. FloatingActionButton: menampilkan _floating button_ 
4. Text: menampilkan text
5. Container: sebagai "pembungkus" _widget_
6. Center: _layout manager_ agar semua _widget_ _align_ ke tengah
7. Column: _layout manager_ untuk kolom (secara vertikal)
8. Row: _layout manager_ untuk baris (secara horizontal)
9. Padding: menambahkan _space_ kosong di sekitar _widget_
10. Drawer: Panel untuk menunjukkan link navigasi yang ada di dalam aplikasi, dengan animasi _slide in_ secara horizontal dari pinggiran Scaffold
11. ListTile: Row dengan _fixed-height_ yang biasanya berisi text atau _leading_/_trailing_ _icon_
12. SingelChildScrollView: "Kotak" atau area di mana sebuah _widget_ dapat di-_scroll_.
13. Form: _Container_ untuk mengelompokkan beberapa _form field widgets_
14. DropdownButton: Button untuk memilih item di sebuah list
15. Align: mengatur _alignment_ _child_-nya di dalam dirinya sendiri dan dapat mengatur ukuran berdasarkan ukuran dari _child_-nya
16. Card: sebagai card untuk menampung informasi
17. DatePickerDialog: Digunakan secara internal oleh `showDatePicker` untuk menampilkan _datepicker_
18. EdgeInsets: set dari _offset_ di masing-masing dari empat arah kardinal, dapat diimplementasikan dalam Padding
19. Icon: menampilkan _icon_
20. Navigator: _widget_ yang mengatur beberapa _child widgets_ dengan _stack discipline_
21. TextButton: Button _flat_ sederhana tanpa border outline

### Jenis-jenis _Event_ pada Flutter
- onPressed
- onTap
- onPointerHover
- onLongPress

### Cara Kerja `Navigator` dalam mengganti halaman dari aplikasi Fluter
`Navigator` mengganti halaman dengan melakukan _stack discipline_ seperti _push_ dan _pull_ pada  _routing_ yang ada. Untuk berpindah ke halaman selanjutnya, _route_ dari halaman selanjutnya di-`push` ke _stack_ dan seterusnya. Untuk berpindah ke halaman sebelumnya, _route_ dari halaman saat ini di-`pop` sehingga akan berpindah ke _route_ sebelumnya.

###  &#9745; Implementasi Checklist

0.1 inisiasi variabel di bawah class `_MyFormPageState`
```dart
final _formKey = GlobalKey<FormState>();
  String? judul = "Pemasukan";
  int nominal = 0;
  List dataBudget = [];
  String? pilihJenis;
  List<String> jenis = ['Pemasukan', 'Pengeluaran'];
  String? dateTime;
```
0.2 membuat class `Data` berisi `List` untuk menyimpan data yang di-submit di Form
```dart
class Data {
  static List dataBudget = [];
}
```

1. Menambahkan _drawer_ menu pada app, menambahkan tiga tombol navigasi yaitu untuk counter, halaman form, dan halaman data _budget_ di atas `body`
``` dart
drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Routing the menu to the main page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Routing the menu to form page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Budget Data'),
              onTap: () {
                // Routing the menu to the main page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyDataPage()),
                );
              },
            ),
          ],
        ),
      ),
```
2. Menambahkan halaman form
Membuat file `form.dart`, melakukan import halaman lain, menggunakan struktur serupa dengan _main page_

  a. Menambahkan elemen input dengan tipe data String berupa judul budget.
``` dart
body: Form(
...
children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Judul",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          judul = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          judul = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Judul tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
...
)
```
  b. Menambahkan elemen input dengan tipe data int berupa nominal budget.
```dart
Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nominal",
                        // Menambahkan circular border agar lebih rapi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      // Menambahkan behavior saat nama diketik
                      onChanged: (String? value) {
                        setState(() {
                          nominal = int.parse(value!);
                        });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                        setState(() {
                          nominal = int.parse(value!);
                        });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Nominal tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
```

  c. Menambahkan elemen dropdown yang berisi tipe budget dengan pilihan pemasukan dan pengeluaran
``` dart
DropdownButton(
                    hint: const Align(
                        alignment: Alignment.centerRight,
                        child: Text("Pilih Jenis")),
                    value: pilihJenis,
                    underline: const SizedBox(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: jenis.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        pilihJenis = newValue ?? "";
                      });
                    },
                  ),
```
  d. Menambahkan button untuk menyimpan budget, di luar `Form()`
```dart
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var childData = [];
                      childData.add(judul);
                      childData.add(nominal);
                      childData.add(pilihJenis);
                      childData.add(dateTime);
                      Data.dataBudget.add(childData); // menambah list di dalam list
                    }
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ])),
```
3. Menambahkan halaman data _budget_

Membuat file `data.dart`, melakukan import halaman lain, menggunakan struktur serupa dengan _main page_
 
 a. Menampilkan semua judul, nominal, dan tipe _budget_ yang ditambahkan pada form
  ```dart
  body: 
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
          for(var item in Data.dataBudget)
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item[0], // judul
                            style: const TextStyle(fontSize: 25)
                          ),
                          Text(item[3].toString(), // tanggal yang harus dicast ke string
                            style: const TextStyle(fontSize: 12)
                          ),
                        ],
                        ),
                    ),
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Rp${item[1].toString()}' // nominal
                          ),
                          Text('${item[2]}' // jenis
                          ),
                        ],
                        ),
                    ),

                  ],
                ),
              ),
            ),
        ],)
        ),
  ```

# Tugas 7 PBP
<details>
  <summary>Jawaban Soal</summary>
  
### _Stateless widget_ dan _stateful widget_ dan perbedaan dari keduanya?
_Stateless widget_ adalah _widget_ yang tidak membutuhkan _mutable state_ sehingga tidak dapat diubah 
_state_-nya secara dinamis, dan perlu di-edit dari kodenya. Contohnya di `counter_7` adalah _title_ dari app yang akan
tidak dapat diubah kecuali dari kodenya langsung. 

Sebaliknya, _stateful widget_ adalah  _widget_ yang memiliki _mutable state_ sehingga dapat berubah secara dinamis (misalnya dengan _internal action_). 
Di dalam `counter_7`, contohnya adalah Text() yang berubah ketika _button_ ditekan.

Perbedaannya terletak pada _mutability_-nya di mana _stateless_ statis dan propertinya _final_, sementara _stateful_ lebih dinamis. 
Selain itu, `setState()` tidak dapat dipanggil karena _state_ tidak terdefinisikan pada _stateless widget_.

### _Widget_ yang digunakan
1. Scaffold: sebagai _layout_ utama app
2. Appbar: menampilkan judul app
3. FloatingActionButton: menampilkan _floating button_ 
4. Text: menampilkan text
5. Container: sebagai "pembungkus" _widget_
6. Center: _layout manager_ agar semua _widget_ _align_ ke tengah
7. Column: _layout manager_ untuk kolom (secara vertikal)
8. Row: _layout manager_ untuk baris (secara horizontal)
9. Padding: menambahkan _space_ kosong di sekitar _widget_

### Fungsi `setState()`?
`setState()` memiliki fungsi untuk memberi tahu bahwa ada objek yang telah berubah pada _state_,
dan akan melakukan _rebuild_ pada _widget_ sehingga _widget_ akan menampilkan nilai yang telah diubah.

Variabel yang terdampak pada `counter_7` adalah `_counter`.
Pemanggilan fungsi `setState()` dilakukan dalam fungsi increment dan decrement yang di-trigger oleh button, 
dan akan mengubah nilai dari counter.

### Perbedaan `const` dengan `final`?
const dan final keduanya digunakan untuk _assignment_ nilai konstan pada suatu variabel.
Akan tetapi, `const` membuat variabel konstan dari _compile time_ saja dan nilai dari variabel tersebut harus sudah diberikan _value_ secara langsung.
`final`, membuat variabel konstan/immutable dari _run-time_ sehingga nilai bisa saja didapat setelah program berjalan.
### &#9745;  Implementasi _Checklist_
1. Membuat sebuah program Flutter baru dengan nama counter_7.
``` cmd
flutter create counter_7
cd counter_7
flutter run
```
2. Merubah _page title_ menjadi "Program Counter" dan merubah _aligntment_-nya ke kiri
``` dart
 home: const MyHomePage(title: 'Program Counter'),
```
``` dart
appBar: AppBar(
        // Tambahkan centerTitle: false di AppBar
        title: Text(widget.title),
        centerTitle: false
      ),
```
3. Menambahkan fungsi untuk men-_decrement_ counter
``` dart
void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }
```
4. Membuat fungsi `_oddEven()` untuk mengubah `Text()` sesuai genap atau ganjilnya angka
``` dart
dynamic _oddEven() {
    if (_counter % 2 == 0) {
      return const Text('GENAP', style: TextStyle(color: Colors.red));
    } else {
      return const Text("GANJIL", style: TextStyle(color: Colors.blue),);
    }
  }
```
5. Menambahkan button untuk fungsi _decrement_ dengan widget `FloatingActionButton()`
di dalam body
``` dart
floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container( // menggunakan container
        padding: const EdgeInsets.all(20.0), // menambah padding
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ]),
      ),
```
</details>
