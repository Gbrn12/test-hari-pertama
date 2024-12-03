import 'dart:io';
import '../lib/produk.dart';
import '../lib/keranjang.dart';
import '../lib/transaksi.dart';
import '../lib/kasir.dart';

void main() {
  // Meminta nama kasir dari pengguna
  stdout.write('Silakan masukkan nama kasir: ');
  String namaKasir = stdin.readLineSync()!;

  // Inisialisasi produk yang tersedia
  Produk sepatu = Produk(nama: 'Sepatu', harga: 1000, stok: 50);
  Produk kaos = Produk(nama: 'Kaos', harga: 2500, stok: 100);
  Produk celana = Produk(nama: 'Celana', harga: 6000, stok: 30);

  // Membuat objek kasir sesuai nama yang diberikan
  Kasir kasir = Kasir(nama: namaKasir);

  // Inisialisasi keranjang belanja
  Keranjang keranjang = Keranjang();

  while (true) {
    // Menampilkan daftar menu fitur
    print('--- TOKO KAMI ---');
    print('1. Tambah Produk ke Keranjang');
    print('2. Hapus Produk dari Keranjang');
    print('3. Hitung Total Belanja');
    print('4. Cetak Nota Belanja');    print('5. Lihat Laporan Penjualan');
    print('6. Keluar');
    stdout.write('Pilih menu (1-6): ');

    int pilihan = int.parse(stdin.readLineSync()!);

    switch (pilihan) {
      case 1:
  // Menambahkan produk ke keranjang belanja
  print('Pilih produk yang ingin Anda beli:');
  print('1. Sepatu (Stok: ${sepatu.stok})');
  print('2. Kaos (Stok: ${kaos.stok})');
  print('3. Celana (Stok: ${celana.stok})');
  stdout.write('Masukkan pilihan produk (1-3): ');
  int pilihanProduk = int.parse(stdin.readLineSync()!);

  stdout.write('Masukkan jumlah yang ingin dibeli: ');
  int jumlah = int.parse(stdin.readLineSync()!);

  // Menambahkan produk berdasarkan stok yang tersedia
  switch (pilihanProduk) {
    case 1:
      keranjang.tambahProduk(sepatu, jumlah); // Stok dikurangi di dalam method ini
      break;
    case 2:
      keranjang.tambahProduk(kaos, jumlah); // Stok dikurangi di dalam method ini
      break;
    case 3:
      keranjang.tambahProduk(celana, jumlah); // Stok dikurangi di dalam method ini
      break;
    default:
      print('Pilihan tidak valid.');
  }
  break;


      case 2:
        // Menghapus produk dari keranjang
        print('Pilih produk yang ingin dihapus dari keranjang:');
        print('1. Sepatu');
        print('2. Kaos');
        print('3. Celana');
        stdout.write('Masukkan pilihan produk (1-3): ');
        int produkDihapus = int.parse(stdin.readLineSync()!);

        switch (produkDihapus) {
          case 1:
            keranjang.hapusProduk(sepatu);
            break;
          case 2:
            keranjang.hapusProduk(kaos);
            break;
          case 3:
            keranjang.hapusProduk(celana);
            break;
          default:
            print('Pilihan tidak valid.');
        }
        break;

      case 3:
        // Menghitung total biaya belanja
        double total = keranjang.hitungTotal();
        print('Total Belanja Anda: Rp.${total}');
        break;

      case 4:
        // Mencetak struk belanja
        double totalBelanja = keranjang.hitungTotal();
        Transaksi transaksi = Transaksi(tanggal: DateTime.now(), items: keranjang.produkList, total: totalBelanja);
        transaksi.cetakNota();
        kasir.tambahTransaksi(transaksi);
        break;

      case 5:
        // Menampilkan laporan penjualan
        kasir.tampilkanLaporan();
        break;

      case 6:
        // Keluar dari aplikasi
        print('Terima kasih telah menggunakan aplikasi ini.');
        return;

      default:
        print('Pilihan tidak valid.');
    }
  }
}
