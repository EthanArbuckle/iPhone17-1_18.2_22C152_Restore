@interface UIBarBackground
@end

@implementation UIBarBackground

uint64_t __54___UIBarBackground_transitionBackgroundViewsAnimated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareBackgroundViews];
  [*(id *)(a1 + 32) updateBackground];
  v2 = *(void **)(a1 + 32);
  return [v2 cleanupBackgroundViews];
}

uint64_t __40___UIBarBackground_transition_toLayout___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = 48;
  if (a2) {
    uint64_t v2 = 40;
  }
  return [*(id *)(a1 + 32) setLayout:*(void *)(a1 + v2)];
}

uint64_t __54___UIBarBackground_transitionBackgroundViewsAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanupBackgroundViews];
}

uint64_t __54___UIBarBackground_transitionBackgroundViewsAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareBackgroundViews];
}

@end