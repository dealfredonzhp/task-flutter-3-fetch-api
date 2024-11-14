import 'package:flutter/material.dart';
import 'package:flutter_user_list_cubit/user_list/user_list.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal.shade300, // Warna hijau teal untuk app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              user.title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.teal.shade900, // Warna hijau teal gelap untuk judul
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              user.body,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    color: Colors.grey.shade700, // Warna abu untuk teks tubuh
                  ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logika navigasi ke post sebelumnya
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade100, // Warna hijau muda untuk tombol
                    foregroundColor: Colors.teal.shade900, // Warna hijau gelap untuk teks
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text("Prev"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Logika navigasi ke post berikutnya
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade100,
                    foregroundColor: Colors.teal.shade900,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text("Next"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Logika menghapus post saat ini
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 161, 4, 19), // Warna merah muda untuk tombol hapus
                foregroundColor: Colors.red.shade900, // Warna merah tua untuk teks
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text("Remove"),
            ),
          ],
        ),
      ),
    );
  }
}
