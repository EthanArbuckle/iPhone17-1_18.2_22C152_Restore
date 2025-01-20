@interface PXDisplayAssetIndexSubfetchResult
@end

@implementation PXDisplayAssetIndexSubfetchResult

void *__52___PXDisplayAssetIndexSubfetchResult_indexOfObject___block_invoke(void *result, uint64_t a2, unsigned char *a3)
{
  if (result[6] == a2)
  {
    *(void *)(*(void *)(result[4] + 8) + 24) = *(void *)(*(void *)(result[5] + 8) + 24);
    *a3 = 1;
  }
  ++*(void *)(*(void *)(result[5] + 8) + 24);
  return result;
}

uint64_t __55___PXDisplayAssetIndexSubfetchResult_objectsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 24) + 8 * a2)];
}

uint64_t __67___PXDisplayAssetIndexSubfetchResult_initWithFetchResult_indexSet___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  v3 = *(void **)(v2 + 24);
  void *v3 = a2;
  *(void *)(v2 + 24) = v3 + 1;
  return result;
}

@end