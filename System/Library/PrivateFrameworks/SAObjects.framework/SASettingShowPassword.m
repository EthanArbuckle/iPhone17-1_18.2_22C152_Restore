@interface SASettingShowPassword
+ (id)showPassword;
- (BOOL)requiresResponse;
- (NSNumber)shouldPromptForAuthentication;
- (NSString)appBundleId;
- (NSString)appOrWebsiteName;
- (NSString)spokenAppOrWebsiteName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppBundleId:(id)a3;
- (void)setAppOrWebsiteName:(id)a3;
- (void)setShouldPromptForAuthentication:(id)a3;
- (void)setSpokenAppOrWebsiteName:(id)a3;
@end

@implementation SASettingShowPassword

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"ShowPassword";
}

+ (id)showPassword
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)appBundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appBundleId"];
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)appOrWebsiteName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appOrWebsiteName"];
}

- (void)setAppOrWebsiteName:(id)a3
{
}

- (NSNumber)shouldPromptForAuthentication
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"shouldPromptForAuthentication"];
}

- (void)setShouldPromptForAuthentication:(id)a3
{
}

- (NSString)spokenAppOrWebsiteName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"spokenAppOrWebsiteName"];
}

- (void)setSpokenAppOrWebsiteName:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end