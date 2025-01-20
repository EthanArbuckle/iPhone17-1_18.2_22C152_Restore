@interface SASettingSetSiriAuthorizationForApp
+ (id)setSiriAuthorizationForApp;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSString)bundleId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setBundleId:(id)a3;
@end

@implementation SASettingSetSiriAuthorizationForApp

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"SetSiriAuthorizationForApp";
}

+ (id)setSiriAuthorizationForApp
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)bundleId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"bundleId"];
}

- (void)setBundleId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end