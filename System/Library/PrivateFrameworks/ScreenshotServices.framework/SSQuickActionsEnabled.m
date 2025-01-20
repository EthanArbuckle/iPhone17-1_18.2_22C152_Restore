@interface SSQuickActionsEnabled
@end

@implementation SSQuickActionsEnabled

uint64_t ___SSQuickActionsEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  _SSQuickActionsEnabled_sQuickActionsEnabled = result;
  return result;
}

@end