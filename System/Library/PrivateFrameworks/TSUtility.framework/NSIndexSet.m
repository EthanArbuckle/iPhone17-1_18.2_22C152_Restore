@interface NSIndexSet
@end

@implementation NSIndexSet

uint64_t __60__NSIndexSet_TSUAdditions__tsu_intersectsIndexesInIndexSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "containsIndexesInRange:", a2, a3);
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

@end