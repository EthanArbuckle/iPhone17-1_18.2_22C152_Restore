@interface SFFeatureFlagAdaptor
+ (BOOL)featureEnabledForDomain:(const char *)a3 feature:(const char *)a4;
@end

@implementation SFFeatureFlagAdaptor

+ (BOOL)featureEnabledForDomain:(const char *)a3 feature:(const char *)a4
{
  return _os_feature_enabled_impl();
}

@end