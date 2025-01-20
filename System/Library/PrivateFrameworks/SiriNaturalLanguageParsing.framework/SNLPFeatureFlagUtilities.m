@interface SNLPFeatureFlagUtilities
+ (BOOL)isSNLPFeatureStoreEnabled;
@end

@implementation SNLPFeatureFlagUtilities

+ (BOOL)isSNLPFeatureStoreEnabled
{
  return _os_feature_enabled_impl();
}

@end