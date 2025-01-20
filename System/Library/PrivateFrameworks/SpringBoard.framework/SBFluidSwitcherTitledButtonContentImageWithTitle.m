@interface SBFluidSwitcherTitledButtonContentImageWithTitle
@end

@implementation SBFluidSwitcherTitledButtonContentImageWithTitle

uint64_t ___SBFluidSwitcherTitledButtonContentImageWithTitle_block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 format];
  [v3 scale];
  UIRectIntegralWithScale();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  return objc_msgSend(v12, "drawWithRect:options:attributes:context:", 1, v13, 0, v5, v7, v9, v11);
}

@end