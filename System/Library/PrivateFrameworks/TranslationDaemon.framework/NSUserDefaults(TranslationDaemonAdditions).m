@interface NSUserDefaults(TranslationDaemonAdditions)
+ (id)lt_appGroupDefaults;
- (uint64_t)lt_hasAcceptedFirstUseConsent;
- (uint64_t)lt_isOnDeviceOnly;
@end

@implementation NSUserDefaults(TranslationDaemonAdditions)

+ (id)lt_appGroupDefaults
{
  if (lt_appGroupDefaults_onceToken != -1) {
    dispatch_once(&lt_appGroupDefaults_onceToken, &__block_literal_global_31);
  }
  v0 = (void *)lt_appGroupDefaults_appGroupDefaults;
  return v0;
}

- (uint64_t)lt_isOnDeviceOnly
{
  return [a1 BOOLForKey:@"OnDeviceOnly"];
}

- (uint64_t)lt_hasAcceptedFirstUseConsent
{
  return [a1 BOOLForKey:@"FirstUseConsent"];
}

@end