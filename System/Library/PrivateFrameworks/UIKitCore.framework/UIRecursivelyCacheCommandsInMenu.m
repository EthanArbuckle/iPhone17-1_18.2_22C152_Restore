@interface UIRecursivelyCacheCommandsInMenu
@end

@implementation UIRecursivelyCacheCommandsInMenu

uint64_t ___UIRecursivelyCacheCommandsInMenu_block_invoke(uint64_t a1, uint64_t a2)
{
  return _UIRecursivelyCacheCommandsInMenu(a2, *(void *)(a1 + 32));
}

void ___UIRecursivelyCacheCommandsInMenu_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

@end