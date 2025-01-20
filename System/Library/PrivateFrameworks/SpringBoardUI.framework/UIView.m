@interface UIView
@end

@implementation UIView

void __41__UIView_SBUIAdditions__sbui_drawEagerly__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) layer];
  [v2 displayIfNeeded];

  v3 = *(void **)(a1 + 32);

  objc_setAssociatedObject(v3, "hasDrawn", 0, 0);
}

@end