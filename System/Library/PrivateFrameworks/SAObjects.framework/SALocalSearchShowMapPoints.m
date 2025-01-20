@interface SALocalSearchShowMapPoints
+ (id)showMapPoints;
- (BOOL)chainResultSet;
- (BOOL)requiresResponse;
- (BOOL)searchAlongRoute;
- (BOOL)showDirections;
- (BOOL)showTraffic;
- (BOOL)suppressNavigation;
- (NSDate)arrivalDate;
- (NSDate)departureDate;
- (NSNumber)regionOfInterestRadiusInMiles;
- (NSString)directionsType;
- (NSString)language;
- (NSString)preferredDirectionsMode;
- (SALocalSearchCarRouteOptions)carRouteOptions;
- (SALocalSearchMapItem)itemDestination;
- (SALocalSearchMapItem)itemSource;
- (SALocalSearchMapItemList)searchItems;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setArrivalDate:(id)a3;
- (void)setCarRouteOptions:(id)a3;
- (void)setChainResultSet:(BOOL)a3;
- (void)setDepartureDate:(id)a3;
- (void)setDirectionsType:(id)a3;
- (void)setItemDestination:(id)a3;
- (void)setItemSource:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setPreferredDirectionsMode:(id)a3;
- (void)setRegionOfInterestRadiusInMiles:(id)a3;
- (void)setSearchAlongRoute:(BOOL)a3;
- (void)setSearchItems:(id)a3;
- (void)setShowDirections:(BOOL)a3;
- (void)setShowTraffic:(BOOL)a3;
- (void)setSuppressNavigation:(BOOL)a3;
@end

@implementation SALocalSearchShowMapPoints

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"ShowMapPoints";
}

+ (id)showMapPoints
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDate)arrivalDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"arrivalDate"];
}

- (void)setArrivalDate:(id)a3
{
}

- (SALocalSearchCarRouteOptions)carRouteOptions
{
  return (SALocalSearchCarRouteOptions *)AceObjectAceObjectForProperty(self, @"carRouteOptions");
}

- (void)setCarRouteOptions:(id)a3
{
}

- (BOOL)chainResultSet
{
  return AceObjectBoolForProperty(self, @"chainResultSet");
}

- (void)setChainResultSet:(BOOL)a3
{
}

- (NSDate)departureDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"departureDate"];
}

- (void)setDepartureDate:(id)a3
{
}

- (NSString)directionsType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"directionsType"];
}

- (void)setDirectionsType:(id)a3
{
}

- (SALocalSearchMapItem)itemDestination
{
  return (SALocalSearchMapItem *)AceObjectAceObjectForProperty(self, @"itemDestination");
}

- (void)setItemDestination:(id)a3
{
}

- (SALocalSearchMapItem)itemSource
{
  return (SALocalSearchMapItem *)AceObjectAceObjectForProperty(self, @"itemSource");
}

- (void)setItemSource:(id)a3
{
}

- (NSString)language
{
  return (NSString *)[(AceObject *)self propertyForKey:@"language"];
}

- (void)setLanguage:(id)a3
{
}

- (NSString)preferredDirectionsMode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"preferredDirectionsMode"];
}

- (void)setPreferredDirectionsMode:(id)a3
{
}

- (NSNumber)regionOfInterestRadiusInMiles
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"regionOfInterestRadiusInMiles"];
}

- (void)setRegionOfInterestRadiusInMiles:(id)a3
{
}

- (BOOL)searchAlongRoute
{
  return AceObjectBoolForProperty(self, @"searchAlongRoute");
}

- (void)setSearchAlongRoute:(BOOL)a3
{
}

- (SALocalSearchMapItemList)searchItems
{
  return (SALocalSearchMapItemList *)AceObjectAceObjectForProperty(self, @"searchItems");
}

- (void)setSearchItems:(id)a3
{
}

- (BOOL)showDirections
{
  return AceObjectBoolForProperty(self, @"showDirections");
}

- (void)setShowDirections:(BOOL)a3
{
}

- (BOOL)showTraffic
{
  return AceObjectBoolForProperty(self, @"showTraffic");
}

- (void)setShowTraffic:(BOOL)a3
{
}

- (BOOL)suppressNavigation
{
  return AceObjectBoolForProperty(self, @"suppressNavigation");
}

- (void)setSuppressNavigation:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end