@interface SALocalSearchGeoServicesData
+ (id)geoServicesData;
- (NSArray)additionalEnabledTransitMarkets;
- (NSData)clientMetadata;
- (NSString)environment;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAdditionalEnabledTransitMarkets:(id)a3;
- (void)setClientMetadata:(id)a3;
- (void)setEnvironment:(id)a3;
@end

@implementation SALocalSearchGeoServicesData

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"GeoServicesData";
}

+ (id)geoServicesData
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

- (NSData)clientMetadata
{
  return (NSData *)[(AceObject *)self propertyForKey:@"clientMetadata"];
}

- (void)setClientMetadata:(id)a3
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