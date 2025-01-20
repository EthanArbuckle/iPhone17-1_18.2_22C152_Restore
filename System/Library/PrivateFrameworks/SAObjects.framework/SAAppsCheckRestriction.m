@interface SAAppsCheckRestriction
+ (id)checkRestriction;
- (BOOL)requiresResponse;
- (NSString)executionEnvironment;
- (NSString)launchId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setExecutionEnvironment:(id)a3;
- (void)setLaunchId:(id)a3;
@end

@implementation SAAppsCheckRestriction

- (id)groupIdentifier
{
  return @"com.apple.ace.apps";
}

- (id)encodedClassName
{
  return @"CheckRestriction";
}

+ (id)checkRestriction
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)executionEnvironment
{
  return (NSString *)[(AceObject *)self propertyForKey:@"executionEnvironment"];
}

- (void)setExecutionEnvironment:(id)a3
{
}

- (NSString)launchId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"launchId"];
}

- (void)setLaunchId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end