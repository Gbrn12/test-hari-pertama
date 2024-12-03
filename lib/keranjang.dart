import '../lib/produk.dart';
class Keranjang {
  List<Map<String, dynamic>> produkList = [];

  // Menambah produk ke keranjang
  void tambahProduk(Produk produk, int jumlah) {
    if (produk.stok >= jumlah) {
      produk.kurangiStok(jumlah); // Pengurangan stok hanya di sini
      produkList.add({'produk': produk, 'jumlah': jumlah});
      print('${jumlah} ${produk.nama} berhasil ditambahkan ke keranjang.');
    } else {
      print('Stok ${produk.nama} tidak cukup.');
    }
  }

  // Menghapus produk dari keranjang
  void hapusProduk(Produk produk) {
    produkList.removeWhere((item) => item['produk'] == produk);
  }

  // Menghitung total belanja
  double hitungTotal() {
    double total = 0;
    for (var item in produkList) {
      total += item['produk'].harga * item['jumlah'];
    }
    return total;
  }
}
