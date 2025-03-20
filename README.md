# labpokemon

A new Flutter project. i have done this project by myself. i use online sources like chatgpt for help.
i updated the coding of main.dart file and pubspec.yaml file. 
In this lab, I built a Flutter application that interacts with the Pokémon TCG API to fetch random Pokémon cards and compare their Health Points (HP) to determine a winner. The app follows these steps:

Fetching Data:

The app uses the Pokémon TCG API to get a list of Pokémon cards.
A random card is selected from the list each time the user presses the "Load New Cards" button.
Displaying Cards:

The app fetches the card images and displays two random Pokémon cards using Image.network.
The images are displayed with a constrained size to ensure they fit the screen properly.
Comparing HP:

The app compares the HP of the two cards. The card with the higher HP is declared the winner.
If both cards have the same HP, the result is a tie.
Button Interaction:

A button labeled "Load New Cards" allows the user to load two new random cards from the API, compare their HP again, and display the new results.
Key Features:
Random Pokémon Cards: The app fetches and displays random Pokémon cards.
Health Point Comparison: The HP of the cards is compared to declare the winner.
UI Adjustments: The UI includes proper spacing and layout to make sure the cards and button are displayed correctly, even on smaller screens (using Container, SizedBox, and Padding).
Learning Outcomes:
Integration of external APIs in Flutter.
Working with asynchronous data fetching (http package).
Manipulating UI layout and images in Flutter.
Implementing logic to compare values (e.g., HP of cards) and display results.
This lab helps you understand how to work with external APIs, manage state in a Flutter app, and design an interactive user interface.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
