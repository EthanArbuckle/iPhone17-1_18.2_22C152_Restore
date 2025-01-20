@interface SAAppsLaunchApp
+ (id)launchApp;
- (BOOL)doNotDismissSiri;
- (BOOL)requiresResponse;
- (NSString)applicationClientIdentifier;
- (NSString)executionEnvironment;
- (NSString)launchId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setApplicationClientIdentifier:(id)a3;
- (void)setDoNotDismissSiri:(BOOL)a3;
- (void)setExecutionEnvironment:(id)a3;
- (void)setLaunchId:(id)a3;
@end

@implementation SAAppsLaunchApp

- (id)groupIdentifier
{
  return @"com.apple.ace.apps";
}

- (id)encodedClassName
{
  return @"LaunchApp";
}

+ (id)launchApp
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)applicationClientIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"applicationClientIdentifier"];
}

- (void)setApplicationClientIdentifier:(id)a3
{
}

- (BOOL)doNotDismissSiri
{
  return AceObjectBoolForProperty(self, @"doNotDismissSiri");
}

- (void)setDoNotDismissSiri:(BOOL)a3
{
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