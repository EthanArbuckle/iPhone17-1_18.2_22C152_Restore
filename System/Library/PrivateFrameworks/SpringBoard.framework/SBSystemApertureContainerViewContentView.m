@interface SBSystemApertureContainerViewContentView
@end

@implementation SBSystemApertureContainerViewContentView

uint64_t __60___SBSystemApertureContainerViewContentView_setContentView___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  UIRectGetCenter();
  return objc_msgSend(v2, "setCenter:");
}

@end