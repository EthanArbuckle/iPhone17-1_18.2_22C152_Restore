@interface NSMutableArray(Shuffle)
- (unint64_t)pha_shuffle;
@end

@implementation NSMutableArray(Shuffle)

- (unint64_t)pha_shuffle
{
  unint64_t result = [a1 count];
  if (result >= 2)
  {
    unint64_t v3 = result;
    uint64_t v4 = 0;
    do
    {
      unint64_t result = [a1 exchangeObjectAtIndex:v4 withObjectAtIndex:v4 + arc4random_uniform(v3)];
      ++v4;
      --v3;
    }
    while (v3 != 1);
  }
  return result;
}

@end