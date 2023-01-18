// ignore_for_file: unused_import

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project_pokemon/pokemon_model.dart';
import 'package:project_pokemon/pokemon_service.dart';
import 'pokemon_list_model.dart';

class PokemonDetailScreen extends StatelessWidget {
  PokemonDetailScreen({required this.title, required this.url});
  String title;
  String url;
  int number = 11;
  PokemonService pokemonService = PokemonService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: FutureBuilder(
          future: pokemonService.getdata(url),
          builder: (context, AsyncSnapshot<PokemonModel> snapshot) {
            if (snapshot.hasData) {
              PokemonModel data = snapshot.data!;
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue.shade200,
                        backgroundImage: NetworkImage(
                          data.sprites!.frontDefault.toString(),
                        ),
                        radius: 99,
                      ),
                      Text("Name: " + data.name!),
                      Text("ID: " + data.id.toString()),
                      Text("Weight: " + data.weight.toString()),
                    ],
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
