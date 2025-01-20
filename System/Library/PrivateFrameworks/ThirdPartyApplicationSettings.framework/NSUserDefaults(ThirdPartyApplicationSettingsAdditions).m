@interface NSUserDefaults(ThirdPartyApplicationSettingsAdditions)
+ (id)userDefaultsWithSuiteName:()ThirdPartyApplicationSettingsAdditions container:;
@end

@implementation NSUserDefaults(ThirdPartyApplicationSettingsAdditions)

+ (id)userDefaultsWithSuiteName:()ThirdPartyApplicationSettingsAdditions container:
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithSuiteName:v6 container:v5];

  return v7;
}

@end