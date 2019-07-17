import std.stdio : readf, write;
import std.algorithm : each, canFind, filter;
import std.conv : to;

char[30000] tape = 0;
int dataPointer = 0;

enum string[char] lookup = ['+': `tape[dataPointer] += 1;`,
                            '-': `tape[dataPointer] -= 1;`,
                            '>': `dataPointer += 1;`,
                            '<': `dataPointer -= 1;`,
                            '.': `write(tape[dataPointer]);`,
                            ',': `readf!"%c"(tape[dataPointer]);`,
                            '[': `while(tape[dataPointer] != 0){`,
                            ']': `}`];

string brainfuck(string s)
{
  string o;
  s.filter!(a => canFind("+-><,.[]", a)).each!(a => o ~= lookup[to!char(a)]);
  return o;
}

void main()
{
  mixin(brainfuck(import(import("brainfuck_file"))));
}
