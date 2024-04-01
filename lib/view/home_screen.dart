import 'package:flutter/material.dart';
import 'package:task_api/model/category_model.dart';
import 'package:task_api/service/fetching.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceApi ap = ServiceApi();
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<ModelCategory>>(
          future: ap.fetchingData(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center( 
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              List<ModelCategory>? users = snapshot.data;
              return ListView.builder(
                itemCount: users!.length,
                itemBuilder: (context, index) {
                  ModelCategory user = users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Image.network(user.image.toString()), 
                    ),
                    title: Text(user.title.toString() ?? ''),
                    subtitle: Text(user.price.toString()??''),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
