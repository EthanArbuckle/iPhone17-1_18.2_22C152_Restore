@interface NSIndexSet
@end

@implementation NSIndexSet

uint64_t __42__NSIndexSet_Silex__firstRangeAfterIndex___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  *(void *)(v4 + 32) = a2;
  *(void *)(v4 + 40) = a3;
  *a4 = 1;
  return result;
}

@end