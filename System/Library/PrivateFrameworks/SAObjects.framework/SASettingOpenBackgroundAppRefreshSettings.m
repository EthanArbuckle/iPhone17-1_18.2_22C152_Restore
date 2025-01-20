@interface SASettingOpenBackgroundAppRefreshSettings
+ (id)openBackgroundAppRefreshSettings;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASettingOpenBackgroundAppRefreshSettings

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"OpenBackgroundAppRefreshSettings";
}

+ (id)openBackgroundAppRefreshSettings
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end