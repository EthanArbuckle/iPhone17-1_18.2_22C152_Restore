@interface QLContentTypeConformsToContentTypeInSet
@end

@implementation QLContentTypeConformsToContentTypeInSet

uint64_t ___QLContentTypeConformsToContentTypeInSet_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) conformsToType:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

@end