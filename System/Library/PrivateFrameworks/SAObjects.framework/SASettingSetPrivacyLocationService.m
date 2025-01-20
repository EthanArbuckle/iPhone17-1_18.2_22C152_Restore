@interface SASettingSetPrivacyLocationService
+ (id)setPrivacyLocationService;
- (BOOL)requiresResponse;
- (BOOL)userConfirmed;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setUserConfirmed:(BOOL)a3;
@end

@implementation SASettingSetPrivacyLocationService

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"SetPrivacyLocationService";
}

+ (id)setPrivacyLocationService
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)userConfirmed
{
  return AceObjectBoolForProperty(self, @"userConfirmed");
}

- (void)setUserConfirmed:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end