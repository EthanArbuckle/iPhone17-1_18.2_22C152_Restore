@interface MSDOSFeatureFlags
+ (BOOL)isPressDemoModeEnabled;
@end

@implementation MSDOSFeatureFlags

+ (BOOL)isPressDemoModeEnabled
{
  return __os_feature_enabled_impl("MobileStoreDemo", "PressDemoMode");
}

@end