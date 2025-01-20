@interface UIApplicationHasAppLinkEntitlements
@end

@implementation UIApplicationHasAppLinkEntitlements

uint64_t ___UIApplicationHasAppLinkEntitlements_block_invoke()
{
  uint64_t result = UISelfTaskHasEntitlement(@"com.apple.private.canGetAppLinkInfo");
  if (result) {
    uint64_t result = UISelfTaskHasEntitlement(@"com.apple.private.canModifyAppLinkPermissions");
  }
  _MergedGlobals_1285 = result;
  return result;
}

@end