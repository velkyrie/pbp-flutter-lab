# Tugas 7 PBP
Vladi Jingga Mentari - 2106635631 - PBP A
## Jawaban Soal


### _Stateless widget _dan _stateful widget_ dan perbedaan dari keduanya?
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
