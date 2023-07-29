import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

// if we have dynamic data we should use state notifier provider
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // super reach out to parent class
  // we add data to super
  // at beginning it will be empty
  FavoriteMealsNotifier() : super([]);
  // not allowed to edit should create new one
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // spread operator pull outs all the existing
      // elements in list and then we add them and the meal to new list
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  // return instance of the class
  return FavoriteMealsNotifier();
});
