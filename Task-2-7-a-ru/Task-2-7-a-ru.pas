uses
  System,
  System.Linq,
  System.Collections.Generic;
begin
  var a : String; // строка текущего кода
	var b : String; // строка целового кода
	var n_len1 : Integer; // Длина строки текущего кода
	var n_len2 : Integer; // Длина строки целевого кода
	var total_moves : Integer = 0; // Счётчик ходов
	// Чтение входных данных
	Console.Write('Введите текущий код: '); // Вывод подсказки
	a := Console.ReadLine(); // Ввод текущего кода
	Console.Write('Введите целевой код: ');
	b := Console.ReadLine(); // Ввод целового кода
	a := a.Trim(); // Удаление ненужных пробелов
	b := b.Trim(); // Удаление ненужных пробелов
	n_len1 := a.Length; // Вычислить длину 1-ой строки
	n_len2 := b.Length; // Вычислить длину 2-ой строки
	// Проверка на совпадение длины текущего и целевого кода
	// Если длина текущего кода не равна длине целевого
	// и оба кода не четырёхзначные, программа завершает работу.
	if (n_len1 <> 4) or (n_len2 <> 4) or (n_len1 <> n_len2) then
  begin
		Console.WriteLine('Комбинация кодового замка должна быть 4 цифры.');
		Console.WriteLine('Текущий и целевой код должны быть одинаковой длины.');
		Console.Read(); // Задержка вывода до нажатия клавиши "Ввод"
		Environment.Exit(0); // Выход из программы
	end;
	// Подсчет минимального количества ходов
	// Две строки символов обрабатываются в одном цикле
	var c := Zip(a, b, (first, second) -> (first, second));
	foreach var p in c do
  begin
	  var x := Convert.ToInt32(ord(p.Item1) - ord('0')); // Цифра текущего кода
		var y := Convert.ToInt32(ord(p.Item2) - ord('0')); // Цифра целевого кода
		var diff1 := Math.Abs(x - y); // разность цифр, прямой ход диска
		var diff2 := 10 - Math.Abs(x - y); // разность цифр, обратный ход диска
		// Мнинимальное число ходов - разность между каждой цифрой диска
		// в целевом коде и текущем коде замка сейфа
		// Общее число ходов - ответ на вопрос
		total_moves += Math.Min(diff1, diff2); 
	end;
	// Вывод информации на экран
	Console.WriteLine($'Текущий код:{a}');
	Console.WriteLine($'Целевой код:{b}');
	Console.WriteLine($'Мнинимальное число ходов:{total_moves}');
	Console.Read(); // Задержка вывода до нажатия клавиши "Ввод"
end.