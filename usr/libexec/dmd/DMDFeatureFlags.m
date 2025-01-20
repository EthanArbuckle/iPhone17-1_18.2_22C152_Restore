@interface DMDFeatureFlags
+ (BOOL)isAppleInternal;
@end

@implementation DMDFeatureFlags

+ (BOOL)isAppleInternal
{
  return _os_variant_allows_internal_security_policies("com.apple.DeviceManagement", a2);
}

@end