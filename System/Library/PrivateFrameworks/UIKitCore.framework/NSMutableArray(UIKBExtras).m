@interface NSMutableArray(UIKBExtras)
- (void)_kb_reverse;
@end

@implementation NSMutableArray(UIKBExtras)

- (void)_kb_reverse
{
  unint64_t v2 = [a1 count];
  if (v2 >= 2)
  {
    uint64_t v3 = 0;
    unint64_t v4 = v2 >> 1;
    unint64_t v5 = v2 - 1;
    do
    {
      v6 = [a1 objectAtIndex:v3];
      v7 = [a1 objectAtIndex:v5];
      [a1 replaceObjectAtIndex:v3 withObject:v7];

      [a1 replaceObjectAtIndex:v5 withObject:v6];
      ++v3;
      --v5;
    }
    while (v4 != v3);
  }
}

@end