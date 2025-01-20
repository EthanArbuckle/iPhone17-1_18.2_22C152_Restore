@interface UITableConstantsUseUIPSidebarMetrics
@end

@implementation UITableConstantsUseUIPSidebarMetrics

uint64_t ___UITableConstantsUseUIPSidebarMetrics_block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  if (result) {
    uint64_t result = _os_feature_enabled_impl();
  }
  _MergedGlobals_1243 = result;
  return result;
}

@end