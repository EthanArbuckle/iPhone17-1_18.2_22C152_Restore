@interface SBHVibrantBorderView
- (void)mt_applyVisualStyling:(id)a3;
@end

@implementation SBHVibrantBorderView

- (void)mt_applyVisualStyling:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__SBHVibrantBorderView_mt_applyVisualStyling___block_invoke;
  v3[3] = &unk_1E6AB34D8;
  v3[4] = self;
  [a3 applyToView:self withColorBlock:v3];
}

void __46__SBHVibrantBorderView_mt_applyVisualStyling___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v2 layer];
  id v4 = v3;
  uint64_t v5 = [v4 CGColor];

  [v6 setBorderColor:v5];
}

@end