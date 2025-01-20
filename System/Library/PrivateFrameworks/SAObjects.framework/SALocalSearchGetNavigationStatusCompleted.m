@interface SALocalSearchGetNavigationStatusCompleted
+ (id)getNavigationStatusCompleted;
- (BOOL)requiresResponse;
- (NSString)trafficIncidentAlertType;
- (NSString)volume;
- (SALocalSearchAceNavigationEta)nextManeuverEta;
- (SALocalSearchAceNavigationEta)overallEta;
- (SALocalSearchMapItem)destination;
- (SALocalSearchMapItemList)predictedDestinations;
- (SALocalSearchRoute)route;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDestination:(id)a3;
- (void)setNextManeuverEta:(id)a3;
- (void)setOverallEta:(id)a3;
- (void)setPredictedDestinations:(id)a3;
- (void)setRoute:(id)a3;
- (void)setTrafficIncidentAlertType:(id)a3;
- (void)setVolume:(id)a3;
@end

@implementation SALocalSearchGetNavigationStatusCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"GetNavigationStatusCompleted";
}

+ (id)getNavigationStatusCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SALocalSearchMapItem)destination
{
  return (SALocalSearchMapItem *)AceObjectAceObjectForProperty(self, @"destination");
}

- (void)setDestination:(id)a3
{
}

- (SALocalSearchAceNavigationEta)nextManeuverEta
{
  return (SALocalSearchAceNavigationEta *)AceObjectAceObjectForProperty(self, @"nextManeuverEta");
}

- (void)setNextManeuverEta:(id)a3
{
}

- (SALocalSearchAceNavigationEta)overallEta
{
  return (SALocalSearchAceNavigationEta *)AceObjectAceObjectForProperty(self, @"overallEta");
}

- (void)setOverallEta:(id)a3
{
}

- (SALocalSearchMapItemList)predictedDestinations
{
  return (SALocalSearchMapItemList *)AceObjectAceObjectForProperty(self, @"predictedDestinations");
}

- (void)setPredictedDestinations:(id)a3
{
}

- (SALocalSearchRoute)route
{
  return (SALocalSearchRoute *)AceObjectAceObjectForProperty(self, @"route");
}

- (void)setRoute:(id)a3
{
}

- (NSString)trafficIncidentAlertType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"trafficIncidentAlertType"];
}

- (void)setTrafficIncidentAlertType:(id)a3
{
}

- (NSString)volume
{
  return (NSString *)[(AceObject *)self propertyForKey:@"volume"];
}

- (void)setVolume:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end