@interface PXDisplayAssetScaledFetchResult
@end

@implementation PXDisplayAssetScaledFetchResult

void __53___PXDisplayAssetScaledFetchResult_objectsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectAtIndex:a2];
  [v2 addObject:v3];
}

@end