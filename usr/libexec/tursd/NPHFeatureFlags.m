@interface NPHFeatureFlags
+ (BOOL)isMessagesSADEnabled;
+ (BOOL)isSessionBasedMutingEnabled;
+ (BOOL)sensitiveContentWarningFeatureFlagEnabled;
@end

@implementation NPHFeatureFlags

+ (BOOL)sensitiveContentWarningFeatureFlagEnabled
{
  return __os_feature_enabled_impl("NanoContacts", "sensitiveContentWarning");
}

+ (BOOL)isSessionBasedMutingEnabled
{
  return __os_feature_enabled_impl("MediaExperience", "SessionBasedMuting");
}

+ (BOOL)isMessagesSADEnabled
{
  return __os_feature_enabled_impl("Messages", "sad");
}

@end