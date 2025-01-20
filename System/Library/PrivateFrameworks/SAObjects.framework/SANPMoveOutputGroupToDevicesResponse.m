@interface SANPMoveOutputGroupToDevicesResponse
+ (id)moveOutputGroupToDevicesResponse;
- (BOOL)requiresResponse;
- (NSString)routeResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRouteResponse:(id)a3;
@end

@implementation SANPMoveOutputGroupToDevicesResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.nowplaying";
}

- (id)encodedClassName
{
  return @"MoveOutputGroupToDevicesResponse";
}

+ (id)moveOutputGroupToDevicesResponse
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)routeResponse
{
  return (NSString *)[(AceObject *)self propertyForKey:@"routeResponse"];
}

- (void)setRouteResponse:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end