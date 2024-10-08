//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. The use of this
// source code is governed by an MIT-style license described in the LICENSE
// file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

String shuffleStringV0(String inputString, int seed) {
  final length = inputString.length;
  final charCodes = inputString.codeUnits;
  final shuffledCodes = List<int>.filled(length, 0);

  // Simple PRNG constants
  const a = 25; // Simple multiplier
  const c = 1; // Simple increment

  // Seed the generator
  var random = seed;

  // Create an index permutation using the simple pseudo-random generator
  final indices = List<int>.generate(length, (i) => i);

  // Implementing a basic shuffle using the simple PRNG formula
  for (var i = length - 1; i > 0; i--) {
    random = (a * random + c) % length; // Generate a pseudo-random index
    var j = random % (i + 1);

    // Swap indices
    final temp = indices[i];
    indices[i] = indices[j];
    indices[j] = temp;
  }

  // Arrange characters by shuffled indices
  for (var i = 0; i < length; i++) {
    shuffledCodes[i] = charCodes[indices[i]];
  }

  return String.fromCharCodes(shuffledCodes);
}
