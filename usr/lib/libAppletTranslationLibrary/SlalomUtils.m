@interface SlalomUtils
+ (int)isValidFelicaBlock:(id)a3;
+ (unint64_t)getBitsFrom:(unint64_t)a3 numberOfBits:(int)a4 startingFrom:(int)a5;
+ (unint64_t)readBitsValueFromBuffer:(char *)a3 bitPosition:(int)a4 length:(int)a5;
+ (unint64_t)readNumberFromBytes:(char *)a3 numberOfBytes:(int)a4;
+ (unsigned)readUInt16FromBytes:(char *)a3;
+ (unsigned)readUInt24FromBytes:(char *)a3;
@end

@implementation SlalomUtils

+ (unint64_t)getBitsFrom:(unint64_t)a3 numberOfBits:(int)a4 startingFrom:(int)a5
{
  return (a3 >> a5) & ~(-1 << a4);
}

+ (unint64_t)readNumberFromBytes:(char *)a3 numberOfBytes:(int)a4
{
  if (a4 < 1) {
    return 0;
  }
  unint64_t result = 0;
  do
  {
    unsigned int v5 = *a3++;
    unint64_t result = v5 | (result << 8);
    --a4;
  }
  while (a4);
  return result;
}

+ (unsigned)readUInt24FromBytes:(char *)a3
{
  return +[SlalomUtils readNumberFromBytes:a3 numberOfBytes:3];
}

+ (unsigned)readUInt16FromBytes:(char *)a3
{
  return +[SlalomUtils readNumberFromBytes:a3 numberOfBytes:2];
}

+ (unint64_t)readBitsValueFromBuffer:(char *)a3 bitPosition:(int)a4 length:(int)a5
{
  if (a5 > 64) {
    return 0;
  }
  int v7 = a4 + a5 - 1;
  if (a4 >= 0) {
    int v8 = a4;
  }
  else {
    int v8 = a4 + 7;
  }
  int v9 = a4 + a5 + 6;
  if (v7 >= 0) {
    int v9 = a4 + a5 - 1;
  }
  int v10 = v9 >> 3;
  char v11 = (v9 & 0xF8) - v7 + 7;
  unint64_t v12 = (unint64_t)ldexp(1.0, a5) - 1;
  return (+[SlalomUtils readNumberFromBytes:&a3[v8 >> 3] numberOfBytes:(v10 - (v8 >> 3) + 1)] >> v11) & v12;
}

+ (int)isValidFelicaBlock:(id)a3
{
  return a3 && [a3 length] == 16;
}

@end