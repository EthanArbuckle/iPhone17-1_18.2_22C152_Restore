@interface SASettingOpenGameCenterSettings
+ (id)openGameCenterSettings;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASettingOpenGameCenterSettings

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"OpenGameCenterSettings";
}

+ (id)openGameCenterSettings
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end