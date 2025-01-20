@interface NSIndexSet
@end

@implementation NSIndexSet

uint64_t __57__NSIndexSet_PGSuggestionSession__pg_intersectsIndexSet___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsIndex:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

@end