import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokémon TCG Battle',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PokemonCardBattle(),
    );
  }
}

class PokemonCardBattle extends StatefulWidget {
  @override
  _PokemonCardBattleState createState() => _PokemonCardBattleState();
}

class _PokemonCardBattleState extends State<PokemonCardBattle> {
  String image1 = '';
  String image2 = '';
  String winner = '';
  int hp1 = 0;
  int hp2 = 0;

  // Function to fetch a random Pokémon card from the API
  Future<Map<String, dynamic>> fetchRandomCard() async {
    final response = await http.get(Uri.parse('https://api.pokemontcg.io/v2/cards'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final cards = data['data'] as List;
      final randomCard = cards[Random().nextInt(cards.length)];
      return randomCard;
    } else {
      throw Exception('Failed to load card');
    }
  }

  // Function to load two random cards and compare their HP
  Future<void> loadCards() async {
    final card1 = await fetchRandomCard();
    final card2 = await fetchRandomCard();

    setState(() {
      image1 = card1['images']['large'];
      image2 = card2['images']['large'];

      // Get HP from the cards, if available
      hp1 = card1['hp'] != null ? int.parse(card1['hp']) : 0;
      hp2 = card2['hp'] != null ? int.parse(card2['hp']) : 0;

      // Determine the winner based on HP
      if (hp1 > hp2) {
        winner = 'Card 1 Wins!';
      } else if (hp2 > hp1) {
        winner = 'Card 2 Wins!';
      } else {
        winner = 'It\'s a Tie!';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadCards(); // Initial load of two random cards
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon TCG Battle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Constrain the image size using a Container
            image1.isNotEmpty
                ? Container(
              width: 200, // Set the width of the card
              height: 300, // Set the height of the card
              child: Image.network(image1, fit: BoxFit.cover),
            )
                : CircularProgressIndicator(),
            SizedBox(height: 20),
            image2.isNotEmpty
                ? Container(
              width: 200, // Set the width of the card
              height: 300, // Set the height of the card
              child: Image.network(image2, fit: BoxFit.cover),
            )
                : CircularProgressIndicator(),
            SizedBox(height: 20),
            // Display the winner
            Text(
              winner,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            // Add padding to the button to make sure it's not hidden
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: loadCards,
                child: Text('Load New Cards'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
