@interface NSMutableArray(TKExtensions)
- (void)tk_ensureHasItemsOrNullUpToIndex:()TKExtensions;
@end

@implementation NSMutableArray(TKExtensions)

- (void)tk_ensureHasItemsOrNullUpToIndex:()TKExtensions
{
  unint64_t v5 = [a1 count];
  if (v5 <= a3)
  {
    unint64_t v6 = v5;
    do
    {
      v7 = [MEMORY[0x263EFF9D0] null];
      [a1 addObject:v7];

      ++v6;
    }
    while (v6 <= a3);
  }
}

@end