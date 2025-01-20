@interface UIKBSupportsCarPlayMaps
@end

@implementation UIKBSupportsCarPlayMaps

uint64_t ___UIKBSupportsCarPlayMaps_block_invoke()
{
  uint64_t result = UISelfTaskHasEntitlement(@"com.apple.developer.carplay-maps");
  _MergedGlobals_1165 = result;
  return result;
}

@end