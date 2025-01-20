@interface SAAppsGetRestrictedApps
+ (id)getRestrictedApps;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)appIds;
- (NSString)executionEnvironment;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppIds:(id)a3;
- (void)setExecutionEnvironment:(id)a3;
@end

@implementation SAAppsGetRestrictedApps

- (id)groupIdentifier
{
  return @"com.apple.ace.apps";
}

- (id)encodedClassName
{
  return @"GetRestrictedApps";
}

+ (id)getRestrictedApps
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)appIds
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"appIds"];
}

- (void)setAppIds:(id)a3
{
}

- (NSString)executionEnvironment
{
  return (NSString *)[(AceObject *)self propertyForKey:@"executionEnvironment"];
}

- (void)setExecutionEnvironment:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end