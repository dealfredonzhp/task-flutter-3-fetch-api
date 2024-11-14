part of "user_list_page.dart";

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        backgroundColor: const Color.fromARGB(255, 16, 14, 126), // Soft pink color
        centerTitle: true,
      ),
      body: BlocBuilder<UserListCubit, UserListState>(
        builder: (context, state) {
          if (state is UserListSuccess) {
            // Success
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  var user = state.users[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color.fromARGB(255, 23, 1, 8), // Soft pink circle
                        child: Text(
                          user.title.substring(0, 1).toUpperCase(),
                          style: const TextStyle(color: Color.fromARGB(255, 55, 211, 24)),
                        ),
                      ),
                      title: Text(
                        user.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Text(
                        user.body.length > 50
                            ? user.body.substring(0, 50) + '...'
                            : user.body,
                        style: const TextStyle(color: Colors.black54),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => UserDetailPage(user: user),
                          ),
                        );
                      },
                      onLongPress: () {
                        // Memanggil fungsi untuk menampilkan konfirmasi
                        _showDeleteConfirmationDialog(context, user);
                      },
                    ),
                  );
                },
              ),
            );
          } else if (state is UserListError) {
            // Error
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: const Color.fromARGB(255, 226, 237, 5),
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 236, 233, 232)),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    label: const Text("Reload Data"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 4, 147, 243), // Soft pink
                      foregroundColor: const Color.fromARGB(255, 95, 25, 25),      // Warna teks dan ikon
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Padding tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Menambahkan sudut melengkung
                      ),
                    ),
                    onPressed: () =>
                        context.read<UserListCubit>().fetchUser(),
                  ),
                ],
              ),
            );
          } else if (state is UserListLoading) {
            // Loading
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 3, 217, 245), // Soft pink for loading indicator
              ),
            );
          } else {
            // Initial / First time
            return Center(
              child: ElevatedButton.icon(
                label: const Text("Reload Data"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 148, 254, 9), // Soft pink background
                ),
                onPressed: () =>
                    context.read<UserListCubit>().fetchUser(),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<UserListCubit>().fetchUser(),
        backgroundColor: const Color.fromARGB(255, 38, 113, 154), // Soft pink
        child: const Icon(Icons.refresh),
      ),
    );
  }

  // Fungsi untuk menampilkan konfirmasi sebelum menghapus data
  void _showDeleteConfirmationDialog(BuildContext context, User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content: const Text("Are you sure you want to remove this post?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog tanpa menghapus data
              },
            ),
            TextButton(
              child: const Text("Remove"),
              onPressed: () {
                // Memanggil removeData jika user memilih untuk menghapus
                context.read<UserListCubit>().removeData(user);
                Navigator.of(context).pop(); // Menutup dialog setelah menghapus
              },
            ),
          ],
        );
      },
    );
  }
}
