@interface UIDynamicButtonFeatureIsEnabled
@end

@implementation UIDynamicButtonFeatureIsEnabled

uint64_t ___UIDynamicButtonFeatureIsEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  _MergedGlobals_985 = result;
  return result;
}

@end