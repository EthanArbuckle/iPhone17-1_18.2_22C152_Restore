@interface UIStatusBarAddDefaultAnimationReposition
@end

@implementation UIStatusBarAddDefaultAnimationReposition

void ___UIStatusBarAddDefaultAnimationReposition_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqual:*(void *)(a1 + 32)] & 1) == 0
    && ([*(id *)(a1 + 40) containsObject:v3] & 1) == 0)
  {
    [*(id *)(a1 + 48) addSubAnimation:*(void *)(a1 + 56) forDisplayItemWithIdentifier:v3];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

@end