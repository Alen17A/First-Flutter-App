import 'package:first_flutter_app/main.dart';
import 'package:flutter/material.dart';
import 'ListData.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First App"),
        actions: [
          TextButton.icon(
            label: Text("Logout"),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Sign out?"),
                  content: const Text("Do you want to sign out?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close dialog
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            )); // Navigate to login
                      },
                      child: const Text("Yes"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context), // Close dialog
                      child: const Text("No"),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
        backgroundColor: Colors.green[200],
      ),
      // body: ListView.builder(
      //   itemCount: data.length,
      //   itemBuilder: (context, index){
      //     var ListData = data[index];
      //     return Card(
      //     child: ListTile(
      //     title: Text(ListData["name"]!),
      //     leading: Image.network(
      //     ListData["image"]!,
      //     width: 100,
      //     height: 50,
      //     fit: BoxFit.cover,),),
      //     );
      //   }
      //   ),
      //       body: ListView.builder(
      //   itemCount: data.length,
      //   itemBuilder: (context, index) {
      //     var listData = data[index];
      //     return Padding(
      //       padding: const EdgeInsets.symmetric(vertical: 8.0), // Adjust vertical space
      //       child: Card(
      //         child: ListTile(
      //           title: Text(listData["name"]!),
      //           leading: Image.network(
      //             listData["image"]!,
      //             width: 100,
      //             height: 50,
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
//       body: ListView.builder(
//   itemCount: data.length,
//   itemBuilder: (context, index) {
//     var listData = data[index];
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: ListTile(
//           title: Text(listData["name"]!),
//           leading: ClipRRect(
//             borderRadius: BorderRadius.circular(index % 2 == 0 ? 50.0 : 8.0), // Alternating shape
//             child: Image.network(
//               listData["image"]!,
//               width: 50,
//               height: 50,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ),
//     );
//   },
// ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          var listData = data[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                title: Text(listData["name"]!),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(index % 2 == 0
                      ? 50.0
                      : 8.0), // Circular or rounded rectangle
                  child: SizedBox(
                    width: 100, // Set fixed width and height
                    height: 100,
                    child: Image.network(
                      listData["image"]!,
                      fit:
                          BoxFit.cover, // Ensures the image fills the container
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
