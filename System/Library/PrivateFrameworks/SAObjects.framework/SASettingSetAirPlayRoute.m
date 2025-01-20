@interface SASettingSetAirPlayRoute
+ (id)setAirPlayRoute;
- (BOOL)requiresResponse;
- (NSString)hashedRouteId;
- (NSString)routeType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHashedRouteId:(id)a3;
- (void)setRouteType:(id)a3;
@end

@implementation SASettingSetAirPlayRoute

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"SetAirPlayRoute";
}

+ (id)setAirPlayRoute
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

- (NSString)routeType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"routeType"];
}

- (void)setRouteType:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end