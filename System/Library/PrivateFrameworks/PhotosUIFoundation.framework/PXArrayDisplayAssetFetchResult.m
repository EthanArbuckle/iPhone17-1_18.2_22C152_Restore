@interface PXArrayDisplayAssetFetchResult
@end

@implementation PXArrayDisplayAssetFetchResult

BOOL __62___PXArrayDisplayAssetFetchResult_countOfAssetsWithMediaType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 mediaType] == *(void *)(a1 + 32);
}

@end