@interface CatalogFromDictionaries
@end

@implementation CatalogFromDictionaries

uint64_t ___CatalogFromDictionaries_block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToGroup:*(void *)(a1 + 32)];
}

@end