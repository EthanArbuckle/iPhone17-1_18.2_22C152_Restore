@interface NSMutableArray
- (void)mb_shuffle;
@end

@implementation NSMutableArray

- (void)mb_shuffle
{
  uint64_t v3 = (uint64_t)[(NSMutableArray *)self count];
  if (v3 >= 2)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = v3 - 1;
    do
      [(NSMutableArray *)self exchangeObjectAtIndex:v5++ withObjectAtIndex:random() % v4];
    while (v6 != v5);
  }
}

@end