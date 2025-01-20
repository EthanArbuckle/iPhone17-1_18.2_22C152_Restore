@interface SAUILaunchAppWithParameters
+ (id)launchAppWithParameters;
- (BOOL)requiresResponse;
- (NSDictionary)parameters;
- (NSString)appBundleId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppBundleId:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation SAUILaunchAppWithParameters

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"LaunchAppWithParameters";
}

+ (id)launchAppWithParameters
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

- (NSDictionary)parameters
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"parameters"];
}

- (void)setParameters:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end