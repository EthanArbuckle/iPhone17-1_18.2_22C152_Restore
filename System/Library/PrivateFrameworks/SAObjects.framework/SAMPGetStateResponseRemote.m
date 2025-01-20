@interface SAMPGetStateResponseRemote
+ (id)getStateResponseRemote;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)hashedRouteUIDs;
- (SAMPGetState)getState;
- (double)routeTimeout;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setGetState:(id)a3;
- (void)setHashedRouteUIDs:(id)a3;
- (void)setRouteTimeout:(double)a3;
@end

@implementation SAMPGetStateResponseRemote

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"GetStateResponseRemote";
}

+ (id)getStateResponseRemote
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAMPGetState)getState
{
  return (SAMPGetState *)AceObjectAceObjectForProperty(self, @"getState");
}

- (void)setGetState:(id)a3
{
}

- (NSArray)hashedRouteUIDs
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"hashedRouteUIDs"];
}

- (void)setHashedRouteUIDs:(id)a3
{
}

- (double)routeTimeout
{
  return AceObjectDoubleForProperty(self, @"routeTimeout");
}

- (void)setRouteTimeout:(double)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end