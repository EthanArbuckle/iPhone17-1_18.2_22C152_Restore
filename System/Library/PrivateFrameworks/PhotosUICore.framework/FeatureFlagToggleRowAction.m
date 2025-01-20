@interface FeatureFlagToggleRowAction
@end

@implementation FeatureFlagToggleRowAction

uint64_t ___FeatureFlagToggleRowAction_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  v6 = [@"Toggle " stringByAppendingString:v4];
  v7 = [@"Use ffctl or Internal Settings to toggle PhotosGoldilocks/" stringByAppendingString:*(void *)(a1 + 32)];
  _PresentAlert((uint64_t)v6, (uint64_t)v7, v5);

  return 1;
}

@end