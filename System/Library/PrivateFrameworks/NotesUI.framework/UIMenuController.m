@interface UIMenuController
@end

@implementation UIMenuController

BOOL __51__UIMenuController_IC__ic_addMenuItemsIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 action];
  return v3 == [*(id *)(a1 + 32) action];
}

@end