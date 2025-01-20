@interface NSIndexSet
- (NSIndexSet)indexSetWithMaximum:(int64_t)a3;
- (NSIndexSet)indexSetWithOffset:(int64_t)a3;
- (int64_t)indexAtIndex:(int64_t)a3;
- (int64_t)locationOfIndex:(int64_t)a3;
@end

@implementation NSIndexSet

- (int64_t)locationOfIndex:(int64_t)a3
{
  NSUInteger v5 = [(NSIndexSet *)self firstIndex];
  int64_t v6 = 0;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v7 = v5;
    if (v5 != a3)
    {
      int64_t v6 = 0;
      do
      {
        NSUInteger v8 = [(NSIndexSet *)self indexGreaterThanIndex:v7];
        ++v6;
        if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        NSUInteger v7 = v8;
      }
      while (v8 != a3);
    }
  }
  return v6;
}

- (int64_t)indexAtIndex:(int64_t)a3
{
  int64_t v5 = [(NSIndexSet *)self firstIndex];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL && a3)
  {
    int64_t v6 = a3 - 1;
    do
    {
      int64_t v7 = v6;
      int64_t v5 = [(NSIndexSet *)self indexGreaterThanIndex:v5];
      if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      int64_t v6 = v7 - 1;
    }
    while (v7);
  }
  return v5;
}

- (NSIndexSet)indexSetWithOffset:(int64_t)a3
{
  int64_t v5 = (NSIndexSet *)+[NSMutableIndexSet indexSet];
  NSUInteger v6 = [(NSIndexSet *)self firstIndex];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (NSUInteger i = v6; i != 0x7FFFFFFFFFFFFFFFLL; NSUInteger i = [(NSIndexSet *)self indexGreaterThanIndex:i])
      [(NSIndexSet *)v5 addIndex:i + a3];
  }
  return v5;
}

- (NSIndexSet)indexSetWithMaximum:(int64_t)a3
{
  int64_t v5 = (NSIndexSet *)+[NSMutableIndexSet indexSet];
  NSUInteger v6 = [(NSIndexSet *)self firstIndex];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (int64_t i = v6; i != 0x7FFFFFFFFFFFFFFFLL; int64_t i = [(NSIndexSet *)self indexGreaterThanIndex:i])
    {
      if (i <= a3) {
        [(NSIndexSet *)v5 addIndex:i];
      }
    }
  }
  return v5;
}

@end