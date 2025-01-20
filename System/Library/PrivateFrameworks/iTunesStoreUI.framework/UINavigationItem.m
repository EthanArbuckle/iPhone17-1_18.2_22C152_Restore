@interface UINavigationItem
@end

@implementation UINavigationItem

uint64_t __48__UINavigationItem_SUAdditions__fadeInTitleView__block_invoke(uint64_t a1)
{
  [MEMORY[0x263F1CB60] setAnimationCurve:1];
  v2 = (void *)[*(id *)(a1 + 32) _titleView];

  return [v2 setAlpha:1.0];
}

uint64_t __49__UINavigationItem_SUAdditions__fadeOutTitleView__block_invoke(uint64_t a1)
{
  [MEMORY[0x263F1CB60] setAnimationCurve:2];
  v2 = *(void **)(a1 + 32);

  return [v2 setAlpha:0.0];
}

uint64_t __49__UINavigationItem_SUAdditions__fadeOutTitleView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

@end