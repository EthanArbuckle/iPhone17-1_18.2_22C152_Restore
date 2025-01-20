@interface SALocalSearchGeoClientState
+ (id)deliveryDeadline;
+ (id)geoClientState;
+ (id)persistencePolicy;
+ (id)syncKey;
+ (id)uniqueObjectIdentifier;
- (NSArray)additionalEnabledTransitMarkets;
- (NSString)environment;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAdditionalEnabledTransitMarkets:(id)a3;
- (void)setEnvironment:(id)a3;
@end

@implementation SALocalSearchGeoClientState

+ (id)deliveryDeadline
{
  return @"SYNC";
}

+ (id)persistencePolicy
{
  return @"LIFE_OF_USER_DATA";
}

+ (id)syncKey
{
  return @"com.apple.siri.client.state.GeoClientState";
}

+ (id)uniqueObjectIdentifier
{
  return @"ClientState://GeoClientState";
}

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"GeoClientState";
}

+ (id)geoClientState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)additionalEnabledTransitMarkets
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"additionalEnabledTransitMarkets"];
}

- (void)setAdditionalEnabledTransitMarkets:(id)a3
{
}

- (NSString)environment
{
  return (NSString *)[(AceObject *)self propertyForKey:@"environment"];
}

- (void)setEnvironment:(id)a3
{
}

@end