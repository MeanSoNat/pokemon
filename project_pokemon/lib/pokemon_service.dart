import 'package:project_pokemon/pokemon_list_model.dart';
import 'package:project_pokemon/pokemon_model.dart';
import 'package:project_pokemon/pokemon_provider.dart';

class PokemonService {
  PokemonProvider _pokemonProvider = new PokemonProvider();
  PokemonProvider _providerdata = new PokemonProvider();

  Future<PokemonListModel> getPokemonList() {
    return _pokemonProvider.getPokemonList();
  }

  Future<PokemonModel> getdata(String URL) {
    
    return _providerdata.pokemondata(URL);
  }
}
