@interface UIStatusBarRegionAxesLayout
@end

@implementation UIStatusBarRegionAxesLayout

void __50___UIStatusBarRegionAxesLayout__updateConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 layoutItem];
  objc_msgSend(v3, "set_ui_usesManualLayout:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_ui_addSubLayoutItem:", v3);
}

@end