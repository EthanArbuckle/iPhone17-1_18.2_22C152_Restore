@interface PFStoryRecipeCurrentStyleRefersToExistingSongAsset
@end

@implementation PFStoryRecipeCurrentStyleRefersToExistingSongAsset

void ___PFStoryRecipeCurrentStyleRefersToExistingSongAsset_block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 addObject:v3];
}

@end