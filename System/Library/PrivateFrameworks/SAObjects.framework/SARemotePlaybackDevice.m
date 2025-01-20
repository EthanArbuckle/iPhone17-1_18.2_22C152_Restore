@interface SARemotePlaybackDevice
+ (id)remotePlaybackDevice;
- (NSDictionary)utsRequiredRequestKeyValuePairs;
- (NSString)airPlayRouteId;
- (NSString)entitlementKey;
- (NSString)hashedRouteId;
- (NSString)storefront;
- (NSString)userToken;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAirPlayRouteId:(id)a3;
- (void)setEntitlementKey:(id)a3;
- (void)setHashedRouteId:(id)a3;
- (void)setStorefront:(id)a3;
- (void)setUserToken:(id)a3;
- (void)setUtsRequiredRequestKeyValuePairs:(id)a3;
@end

@implementation SARemotePlaybackDevice

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"RemotePlaybackDevice";
}

+ (id)remotePlaybackDevice
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)airPlayRouteId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"airPlayRouteId"];
}

- (void)setAirPlayRouteId:(id)a3
{
}

- (NSString)entitlementKey
{
  return (NSString *)[(AceObject *)self propertyForKey:@"entitlementKey"];
}

- (void)setEntitlementKey:(id)a3
{
}

- (NSString)hashedRouteId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"hashedRouteId"];
}

- (void)setHashedRouteId:(id)a3
{
}

- (NSString)storefront
{
  return (NSString *)[(AceObject *)self propertyForKey:@"storefront"];
}

- (void)setStorefront:(id)a3
{
}

- (NSString)userToken
{
  return (NSString *)[(AceObject *)self propertyForKey:@"userToken"];
}

- (void)setUserToken:(id)a3
{
}

- (NSDictionary)utsRequiredRequestKeyValuePairs
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"utsRequiredRequestKeyValuePairs"];
}

- (void)setUtsRequiredRequestKeyValuePairs:(id)a3
{
}

@end