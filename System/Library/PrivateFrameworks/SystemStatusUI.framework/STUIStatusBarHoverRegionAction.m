@interface STUIStatusBarHoverRegionAction
+ (id)_hoverActionForRegion:(int64_t)a3;
+ (id)leadingHoverAction;
+ (id)trailingHoverAction;
@end

@implementation STUIStatusBarHoverRegionAction

+ (id)_hoverActionForRegion:(int64_t)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__STUIStatusBarHoverRegionAction__hoverActionForRegion___block_invoke;
  v5[3] = &__block_descriptor_40_e23_B16__0__STUIStatusBar_8l;
  v5[4] = a3;
  v3 = [a1 actionWithBlock:v5];
  return v3;
}

uint64_t __56__STUIStatusBarHoverRegionAction__hoverActionForRegion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([(id)*MEMORY[0x1E4FB2608] handleStatusBarHoverActionForRegion:*(void *)(a1 + 32)] & 1) == 0)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1C80]) initWithRegion:*(void *)(a1 + 32)];
    v5 = [v3 window];
    v6 = objc_msgSend(v5, "_StatusBar_fbsScene");
    v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
    [v6 sendActions:v7];
  }
  return 1;
}

+ (id)leadingHoverAction
{
  return (id)[a1 _hoverActionForRegion:0];
}

+ (id)trailingHoverAction
{
  return (id)[a1 _hoverActionForRegion:1];
}

@end