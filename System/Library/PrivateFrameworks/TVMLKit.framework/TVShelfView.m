@interface TVShelfView
@end

@implementation TVShelfView

uint64_t __69___TVShelfView__updateLayoutForFocusedView_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  double v3 = v2;
  [*(id *)(a1 + 40) frame];
  v4 = *(void **)(a1 + 32);
  return [v4 setFrame:v3];
}

@end