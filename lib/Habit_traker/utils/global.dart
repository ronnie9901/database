import '../Modal/habit.dart';

bool isHabitCompletedToday(List<DateTime> completedDays) {
  final today = DateTime.now();
  return completedDays.any((date) =>
  date.year == today.year &&
      date.month == today.month &&
      date.day == today.day);
}

Map<DateTime, int> preHeatMapDataset(List<Habit> habits) {
  Map<DateTime, int> dataset = {};

  for (var habit in habits) {
    for (var date in habit.completedays) {
      //  normalize teh data to avoid time mismatch
      final normalizedDate = DateTime(date.year, date.month, date.day);

      //  if the date already exists in the dataset, increments its count
      if (dataset.containsKey(normalizedDate)) {
        dataset[normalizedDate] = dataset[normalizedDate]! + 1;
      } else {
        //else initialize it with a count of 1
        dataset [normalizedDate] = 1;
      }
    }
  }
  return dataset;
}