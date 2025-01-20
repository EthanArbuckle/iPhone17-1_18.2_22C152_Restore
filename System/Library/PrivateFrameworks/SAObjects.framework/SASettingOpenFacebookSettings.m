@interface SASettingOpenFacebookSettings
+ (id)openFacebookSettings;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASettingOpenFacebookSettings

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"OpenFacebookSettings";
}

+ (id)openFacebookSettings
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end