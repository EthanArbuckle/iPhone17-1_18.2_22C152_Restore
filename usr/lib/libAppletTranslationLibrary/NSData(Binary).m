@interface NSData(Binary)
- (unint64_t)readBinaryValueAtBit:()Binary numberOfBits:;
@end

@implementation NSData(Binary)

- (unint64_t)readBinaryValueAtBit:()Binary numberOfBits:
{
  v7 = (void *)MEMORY[0x1E4F1C3C8];
  if (a4 >= 0x41) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The total parameter must not exceed 64 bits, got %lui", a4 format];
  }
  unint64_t v8 = a4 + a3;
  if (a4 + a3 > 8 * [a1 length]) {
    [MEMORY[0x1E4F1CA00] raise:*v7 format:@"Bit position and total exceed capacity"];
  }
  unint64_t v9 = (v8 - 1) >> 3;
  uint64_t v10 = [a1 bytes];
  if (v9 - (a3 >> 3) == -1)
  {
    unint64_t v11 = 0;
  }
  else
  {
    unint64_t v11 = 0;
    v12 = (unsigned __int8 *)(v10 + (a3 >> 3));
    uint64_t v13 = v9 - (a3 >> 3) + 1;
    do
    {
      unsigned int v14 = *v12++;
      unint64_t v11 = v14 | (v11 << 8);
      --v13;
    }
    while (v13);
  }
  return (v11 >> (~(v8 - 1) & 7)) & ((unint64_t)exp2((double)a4) - 1);
}

@end