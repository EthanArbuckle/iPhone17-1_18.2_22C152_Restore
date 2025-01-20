@interface SAUILaunchTVRemote
+ (id)launchTVRemote;
- (BOOL)requiresResponse;
- (NSString)hashedRouteId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHashedRouteId:(id)a3;
@end

@implementation SAUILaunchTVRemote

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"LaunchTVRemote";
}

+ (id)launchTVRemote
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)hashedRouteId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"hashedRouteId"];
}

- (void)setHashedRouteId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end