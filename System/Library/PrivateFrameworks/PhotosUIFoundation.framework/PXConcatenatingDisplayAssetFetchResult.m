@interface PXConcatenatingDisplayAssetFetchResult
@end

@implementation PXConcatenatingDisplayAssetFetchResult

void __60___PXConcatenatingDisplayAssetFetchResult_objectsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectAtIndex:a2];
  [v2 addObject:v3];
}

BOOL __64___PXConcatenatingDisplayAssetFetchResult_initWithFetchResults___block_invoke(uint64_t a1, void *a2)
{
  return [a2 count] > 0;
}

@end