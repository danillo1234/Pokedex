import 'package:flutter/material.dart';
import 'package:flutter_application_pokedex/model/classpokemon.dart';
import 'package:flutter_application_pokedex/pages/pokemonsdetalhes.dart';

class Detalhespokemon extends StatelessWidget {
  final Pokemon pokemon;
  const Detalhespokemon({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Pokemonsdatelhes(
              pokemon: pokemon,
            );
          }));
        },
        child: Row(
          children: [
            Image.network(
              pokemon.thumbnailImage ?? '',
              height: 100,
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#${pokemon.number}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  pokemon.name ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
