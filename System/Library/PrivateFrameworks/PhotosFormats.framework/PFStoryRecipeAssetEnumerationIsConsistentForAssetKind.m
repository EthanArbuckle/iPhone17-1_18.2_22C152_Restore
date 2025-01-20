@interface PFStoryRecipeAssetEnumerationIsConsistentForAssetKind
@end

@implementation PFStoryRecipeAssetEnumerationIsConsistentForAssetKind

void ___PFStoryRecipeAssetEnumerationIsConsistentForAssetKind_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v7 = [v5 nextObject];
  char v8 = [v7 isEqualToAsset:v6];

  if ((v8 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
}

@end