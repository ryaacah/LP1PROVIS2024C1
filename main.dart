import 'dart:async';

class Pesanan {
  String _idPesanan;
  String _namaPesanan;
  int _jumlahPesanan;

  String get idPesanan => _idPesanan;
  set idPesanan(String value) => _idPesanan = value;

  String get namaPesanan => _namaPesanan;
  set namaPesanan(String value) => _namaPesanan = value;

  int get jumlahPesanan => _jumlahPesanan;
  set jumlahPesanan(int value) => _jumlahPesanan = value;

  Pesanan(this._idPesanan, this._namaPesanan, this._jumlahPesanan);
}

class Menu {
  String _idMenu;
  String _namaMenu;
  String _bahanMenu;

  String get idMenu => _idMenu;
  set idMenu(String value) => _idMenu = value;

  String get namaMenu => _namaMenu;
  set namaMenu(String value) => _namaMenu = value;

  String get bahanMenu => _bahanMenu;
  set bahanMenu(String value) => _bahanMenu = value;

  Menu(this._idMenu, this._namaMenu, this._bahanMenu);
}

class Orang {
  String _nama;
  String _jenisKelamin;

  String get nama => _nama;
  set nama(String value) => _nama = value;

  String get jenisKelamin => _jenisKelamin;
  set jenisKelamin(String value) => _jenisKelamin = value;

  Orang(this._nama, this._jenisKelamin);
}

class Pelanggan extends Orang {
  String _idPelanggan;
  int _nomorMeja;

  String get idPelanggan => _idPelanggan;
  set idPelanggan(String value) => _idPelanggan = value;

  int get nomorMeja => _nomorMeja;
  set nomorMeja(int value) => _nomorMeja = value;

  Pelanggan(String nama, String jenisKelamin, this._idPelanggan, this._nomorMeja)
      : super(nama, jenisKelamin);

  Future<void> memesanMenu(List<Menu> menuDipesan) async {
    print('$nama (id pelanggan: $idPelanggan) sedang memesan menu:');
    for (var menu in menuDipesan) {
      print('- ${menu.idMenu} ${menu.namaMenu}');
    }
    await Future.delayed(Duration(seconds: 2)); // Delay 2 seconds
  }

  Future<void> membayar() async {
    await Future.delayed(Duration(milliseconds: 1500)); // Delay 1.5 seconds
    print('$nama (id pelanggan: $idPelanggan) membayar pada kasir.');
  }

  void selesaiMakan() {
    print('$nama (id pelanggan: $idPelanggan) telah selesai makan dan meninggalkan restoran.');
  }
}

class Pegawai extends Orang {
  String _idPegawai;
  String _jenisTugas;

  String get idPegawai => _idPegawai;
  set idPegawai(String value) => _idPegawai = value;

  String get jenisTugas => _jenisTugas;
  set jenisTugas(String value) => _jenisTugas = value;

  Pegawai(String nama, String jenisKelamin, this._idPegawai, this._jenisTugas)
      : super(nama, jenisKelamin);

  void berjalan() {
    print('$nama (id pegawai: $idPegawai, $_jenisTugas) sedang berjalan.');
  }

  Future<void> mengambilPesanan(int nomorMeja) async {
    await Future.delayed(Duration(milliseconds: 1500)); // Delay 1.5 seconds
    print('$nama (id pegawai: $idPegawai, $_jenisTugas) mengambil pesanan meja $nomorMeja.');
  }

  void menjadiKasir() {
    print('$nama (id pegawai: $idPegawai, $_jenisTugas) menjadi kasir.');
  }

  Future<void> memasak(String bahanMenu) async {
    await Future.delayed(Duration(seconds: 2)); // Delay 2 seconds
    print('$nama (id pegawai: $idPegawai, $_jenisTugas) sedang memasak $bahanMenu.');
  }
}


void main() async {
  var menu1 = Menu('M001', 'Nasi Goreng', 'Nasi');
  var menu2 = Menu('M002', 'Es Teh Manis', 'Teh');
  var menu3 = Menu('M003', 'Pudding Jeruk', 'Jeruk');
  var menu4 = Menu('M004', 'Mie Goreng', 'Mie');
  var menu5 = Menu('M005', 'Basreng', 'Baso');
  var menu6 = Menu('M006', 'Susu Milo', 'Susu');

  var pelanggan = Pelanggan('Daru', 'L', 'P001', 3);
  var menuDipesan = [menu1, menu2, menu5];
  await pelanggan.memesanMenu(menuDipesan);
  
  print('\n');

  var pelayan = Pegawai('Cami', 'L', 'G001', 'Pelayan');
  var koki = Pegawai('Nana', 'L', 'G002', 'Koki');
  pelayan.berjalan();
  await koki.memasak('Nasi');
  await koki.memasak('Mie');
  await koki.memasak('Baso');
  await pelayan.mengambilPesanan(3);
  
  print('\n');

  await pelanggan.membayar();
  pelanggan.selesaiMakan();
  
  print('\n');
  
  var pelanggan2 = Pelanggan('Juju', 'P', 'P002', 10);
  var menuDipesan2 = [menu3, menu4, menu6];
  await pelanggan2.memesanMenu(menuDipesan2);
  
  print('\n');
  
  var pelayan2 = Pegawai('Nisa', 'P', 'G003', 'Pelayan');
  var koki2 = Pegawai('Kamik', 'P', 'G004', 'Koki');
  pelayan2.berjalan();
  await koki2.memasak('Teh');
  await koki2.memasak('Jeruk');
  await koki2.memasak('Susu');
  await pelayan2.mengambilPesanan(10);
  
  print('\n');
  
  await pelanggan2.membayar();
  pelanggan2.selesaiMakan();
  
}
