@interface SALocalSearchMapItemSnippet
- (BOOL)chainResultSet;
- (BOOL)searchAlongRoute;
- (NSArray)items;
- (NSArray)providerCommand;
- (NSNumber)regionOfInterestRadiusInMiles;
- (NSNumber)userCurrentLocation;
- (NSString)responseViewId;
- (SALocation)searchRegionCenter;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setChainResultSet:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setProviderCommand:(id)a3;
- (void)setRegionOfInterestRadiusInMiles:(id)a3;
- (void)setResponseViewId:(id)a3;
- (void)setSearchAlongRoute:(BOOL)a3;
- (void)setSearchRegionCenter:(id)a3;
- (void)setUserCurrentLocation:(id)a3;
@end

@implementation SALocalSearchMapItemSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"MapItemSnippet";
}

- (BOOL)chainResultSet
{
  return AceObjectBoolForProperty(self, @"chainResultSet");
}

- (void)setChainResultSet:(BOOL)a3
{
}

- (NSArray)items
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"items", v3);
}

- (void)setItems:(id)a3
{
}

- (NSArray)providerCommand
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"providerCommand", &unk_1EFD73568);
}

- (void)setProviderCommand:(id)a3
{
}

- (NSNumber)regionOfInterestRadiusInMiles
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"regionOfInterestRadiusInMiles"];
}

- (void)setRegionOfInterestRadiusInMiles:(id)a3
{
}

- (NSString)responseViewId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"responseViewId"];
}

- (void)setResponseViewId:(id)a3
{
}

- (BOOL)searchAlongRoute
{
  return AceObjectBoolForProperty(self, @"searchAlongRoute");
}

- (void)setSearchAlongRoute:(BOOL)a3
{
}

- (SALocation)searchRegionCenter
{
  return (SALocation *)AceObjectAceObjectForProperty(self, @"searchRegionCenter");
}

- (void)setSearchRegionCenter:(id)a3
{
}

- (NSNumber)userCurrentLocation
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"userCurrentLocation"];
}

- (void)setUserCurrentLocation:(id)a3
{
}

@end