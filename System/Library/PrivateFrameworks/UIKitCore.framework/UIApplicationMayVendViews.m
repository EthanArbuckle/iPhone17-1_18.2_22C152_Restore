@interface UIApplicationMayVendViews
@end

@implementation UIApplicationMayVendViews

uint64_t ___UIApplicationMayVendViews_block_invoke()
{
  uint64_t result = UISelfTaskHasEntitlement(@"com.apple.UIKit.vends-view-services");
  byte_1EB25B4E4 = result;
  return result;
}

@end