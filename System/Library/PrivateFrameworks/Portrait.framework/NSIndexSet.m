@interface NSIndexSet
@end

@implementation NSIndexSet

void __42__NSIndexSet_ExtendedIndexSet__allNumbers__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [v2 addObject:v3];
}

@end