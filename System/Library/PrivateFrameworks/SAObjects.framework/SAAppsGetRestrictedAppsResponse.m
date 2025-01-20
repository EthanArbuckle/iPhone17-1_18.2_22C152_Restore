@interface SAAppsGetRestrictedAppsResponse
+ (id)getRestrictedAppsResponse;
- (BOOL)requiresResponse;
- (NSArray)restrictedApps;
- (NSDictionary)appToItsRestrictionsMap;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppToItsRestrictionsMap:(id)a3;
- (void)setRestrictedApps:(id)a3;
@end

@implementation SAAppsGetRestrictedAppsResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.apps";
}

- (id)encodedClassName
{
  return @"GetRestrictedAppsResponse";
}

+ (id)getRestrictedAppsResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDictionary)appToItsRestrictionsMap
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"appToItsRestrictionsMap"];
}

- (void)setAppToItsRestrictionsMap:(id)a3
{
}

- (NSArray)restrictedApps
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"restrictedApps"];
}

- (void)setRestrictedApps:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end