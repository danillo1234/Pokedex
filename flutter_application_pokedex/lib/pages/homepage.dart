import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_pokedex/model/classpokemon.dart';
import 'package:flutter_application_pokedex/pages/detalhes.dart';
import 'package:http/http.dart' as http;

class Homepagepokemon extends StatefulWidget {
  const Homepagepokemon({super.key});

  @override
  State<Homepagepokemon> createState() => _HomepagepokemonState();
}

class _HomepagepokemonState extends State<Homepagepokemon> {
  List<Pokemon> pokemonlist = [];

  bool carregando = true;

  @override
  void initState() {
    //_getPokemons();
    _getPokemonshttp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pokedex'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: pokemonlist.length,
            itemBuilder: (context, index) {
              return Detalhespokemon(
                pokemon: pokemonlist[index],
              );
            },
          ),
          if (carregando) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  void _getPokemonshttp() async {
    Uri url = Uri.parse('http://104.131.18.84/pokemon/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);
      setState(() {
        pokemonlist = (json["data"] as List).map(
          (json) {
            return Pokemon.fromJson(json);
          },
        ).toList();

        carregando = false;
      });
    }
  }

  void _getPokemons() async {
    try {
      var response = await Dio().get('http://104.131.18.84/pokemon/');

      if (response.statusCode == 200) {
        setState(() {
          pokemonlist = (response.data["data"] as List).map(
            (json) {
              return Pokemon.fromJson(json);
            },
          ).toList();
        });
      } else {
        print("falha ao obter pokemons");
      }
    } catch (e) {
      print(e);
    }
  }
}
