@interface SAIntentGroupLaunchAppWithUserActivity
+ (id)launchAppWithUserActivity;
- (BOOL)requiresResponse;
- (NSString)userActivityIdentifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setUserActivityIdentifier:(id)a3;
@end

@implementation SAIntentGroupLaunchAppWithUserActivity

- (id)groupIdentifier
{
  return @"com.apple.ace.command.assistant.intent";
}

- (id)encodedClassName
{
  return @"LaunchAppWithUserActivity";
}

+ (id)launchAppWithUserActivity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)userActivityIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"userActivityIdentifier"];
}

- (void)setUserActivityIdentifier:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end