@interface SASettingOpenPasscodeSettings
+ (id)openPasscodeSettings;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASettingOpenPasscodeSettings

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"OpenPasscodeSettings";
}

+ (id)openPasscodeSettings
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end