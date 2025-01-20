@interface UISplitViewControllerAutoHidesColumns
@end

@implementation UISplitViewControllerAutoHidesColumns

uint64_t ___UISplitViewControllerAutoHidesColumns_block_invoke()
{
  uint64_t result = _resolvedPrefValue_0(@"UISplitViewControllerForceAutoHidesColumns", 0);
  byte_1EB260089 = result;
  if ((result & 1) == 0)
  {
    uint64_t result = _resolvedPrefValue_0(@"UISplitViewControllerAllowAutoHidesColumns", 1);
    _MergedGlobals_1011 = result;
  }
  return result;
}

@end