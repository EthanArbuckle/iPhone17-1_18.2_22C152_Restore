@interface NSMutableArray(Shuffling)
- (uint64_t)shuffleWithSeed:()Shuffling;
- (unint64_t)shuffle;
@end

@implementation NSMutableArray(Shuffling)

- (unint64_t)shuffle
{
  unint64_t result = [a1 count];
  unint64_t v3 = result - 2;
  if (result >= 2)
  {
    uint32_t v4 = result;
    uint64_t v5 = 0;
    unsigned int v6 = 0;
    do
    {
      unint64_t result = [a1 exchangeObjectAtIndex:v5 withObjectAtIndex:arc4random_uniform(v4--) + v6];
      uint64_t v5 = ++v6;
    }
    while (v3 >= v6);
  }
  return result;
}

- (uint64_t)shuffleWithSeed:()Shuffling
{
  uint64_t result = [a1 count];
  unsigned int v6 = result;
  if ((int)result >= 2)
  {
    srand(a3);
    uint64_t v7 = v6 - 1;
    do
      uint64_t result = [a1 exchangeObjectAtIndex:v7-- withObjectAtIndex:rand() % v6--];
    while (v7);
  }
  return result;
}

@end