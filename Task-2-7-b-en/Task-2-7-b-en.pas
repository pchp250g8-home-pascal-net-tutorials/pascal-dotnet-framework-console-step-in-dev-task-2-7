uses
  System;
begin
  var a : Integer; // Current code
  var b : Integer; // Target code
  var m : Integer; // Number of digits in the target code
  var n : Integer; // Number of digits in the current code
  var total_moves : Integer; // Number of dial movements
  // Temporary variables for handling lock combinations
  var a1, b1 : Integer; 
  // Data input: target and current codes
  // entered as four-digit numbers
  Console.Write('Enter the current code: '); 
  Integer.TryParse(Console.ReadLine(), a); 
  Console.Write('Enter the target code: '); 
  Integer.TryParse(Console.ReadLine(), b); 
  a1 := a; b1 := b;
  // Number of digits in the current code
  while (a1 > 0) do // Loop condition
  begin
    m += 1; // Increment digit counter
    a1 := a1 div 10; // Divide number by 10
  end; 
  // Number of digits in the target code
  while (b1 > 0) do // Loop condition
  begin
    n += 1; // Increment digit counter
    b1 := b1 div 10; // Divide number by 10
  end; 
  // Check if current and target code lengths match
  // If the length of the current code does not equal the target length
  // or if the codes are not four digits long, the program terminates. 
  if (m <> 4) or (n <> 4) or (m <> n) then
  begin
    Console.WriteLine('The lock combination must consist of 4 digits.'); 
    Console.WriteLine('The current and target codes must be of the same length.'); 
    Console.Read(); // Delay output until "Enter" key is pressed
    Environment.Exit(0); // Exit the program
  end; 
  a1 := a; b1 := b; 
  // Iterate through the digits of the current and target codes
  while (a1 > 0) and (b1 > 0) do
  begin
    var d1 := a1 mod 10; // Digit of the current code
    var d2 := b1 mod 10; // Digit of the target code
    var diff1 := Math.Abs(d1 - d2); // Digit difference, forward dial rotation
    var diff2 := 10 - Math.Abs(d1 - d2); // Digit difference, reverse dial rotation
    // Minimum number of moves is the difference between each digit
    // of the target code and the current safe lock code
    total_moves += Math.Min(diff1, diff2); 
    a1 := a1 div 10; // Move to the next digit of the current code
    b1 := b1 div 10; // Move to the next digit of the target code
  end; 
  // Display information on the screen
  Console.WriteLine($'Current code:{a}'); 
  Console.WriteLine($'Target code:{b}'); 
  Console.WriteLine($'Minimum number of moves:{total_moves}'); 
  Console.Read(); // Delay output until "Enter" key is pressed
end.