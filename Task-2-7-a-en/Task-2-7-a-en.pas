uses
  System,
  System.Linq,
  System.Collections.Generic;
begin
  var a : String; // current code string
  var b : String; // target code string
  var n_len1 : Integer; // length of current code string
  var n_len2 : Integer; // length of target code string
  var total_moves : Integer = 0; // move counter
  // Reading input data
  Console.Write('Enter current code: '); // display prompt
  a := Console.ReadLine(); // input current code
  Console.Write('Enter target code: '); 
  b := Console.ReadLine(); // input target code
  a := a.Trim(); // remove unnecessary spaces
  b := b.Trim(); // remove unnecessary spaces
  n_len1 := a.Length; // calculate length of 1st string
  n_len2 := b.Length; // calculate length of 2nd string
  // Check if current and target code lengths match
  // If the current code length does not equal the target length
  // or if either code is not four digits long, the program terminates. 
  if (n_len1 <> 4) or (n_len2 <> 4) or (n_len1 <> n_len2) then
  begin
    Console.WriteLine('The combination lock code must be 4 digits.'); 
    Console.WriteLine
    (
      'The current and target codes must be of the same length.'
    );
    Console.Read(); // pause output until "Enter" key is pressed
    Environment.Exit(0); // exit program
  end; 
  // Calculating the minimum number of moves
  // The two character strings are processed in a single loop
  var c := Zip(a, b, (first, second) -> (first, second));
  foreach var p in c do
  begin
    // Digit of the current code
    var x := Convert.ToInt32(ord(p.Item1) - ord('0')); 
    // Digit of the target code
    var y := Convert.ToInt32(ord(p.Item2) - ord('0')); 
    // Digit difference, forward dial rotation
    var diff1 := Math.Abs(x - y); 
    // Digit difference, reverse dial rotation
    var diff2 := 10 - Math.Abs(x - y); 
    // The minimum number of moves is the difference between each digit
    // of the target code and the current safe code
    // The total number of moves is the answer
    total_moves += Math.Min(diff1, diff2); 
  end; 
  // Display information on the screen
  Console.WriteLine($'Current code: {a}'); 
  Console.WriteLine($'Target code: {b}'); 
  Console.WriteLine($'Minimum number of moves: {total_moves}'); 
  Console.Read(); // Pause output until the "Enter" key is pressed
end.