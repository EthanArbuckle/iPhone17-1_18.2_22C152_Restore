@interface SFDimmingButton
@end

@implementation SFDimmingButton

uint64_t __35___SFDimmingButton_setHighlighted___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateImageAlpha];
  v2 = *(void **)(a1 + 32);

  return [v2 _updateBackgroundColor];
}

@end