@interface SALocalSearchRoute
+ (id)route;
- (NSArray)routeIncidentOffsets;
- (NSArray)routeIncidents;
- (NSData)etaFilter;
- (NSData)evChargingMetadata;
- (NSData)originalWaypointRoute;
- (NSData)routeAsZilchBinary;
- (NSData)routeId;
- (NSData)routeTrafficIncident;
- (NSData)sessionState;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEtaFilter:(id)a3;
- (void)setEvChargingMetadata:(id)a3;
- (void)setOriginalWaypointRoute:(id)a3;
- (void)setRouteAsZilchBinary:(id)a3;
- (void)setRouteId:(id)a3;
- (void)setRouteIncidentOffsets:(id)a3;
- (void)setRouteIncidents:(id)a3;
- (void)setRouteTrafficIncident:(id)a3;
- (void)setSessionState:(id)a3;
@end

@implementation SALocalSearchRoute

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"Route";
}

+ (id)route
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)routeIncidentOffsets
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"routeIncidentOffsets"];
}

- (void)setRouteIncidentOffsets:(id)a3
{
}

- (NSArray)routeIncidents
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"routeIncidents"];
}

- (void)setRouteIncidents:(id)a3
{
}

- (NSData)routeTrafficIncident
{
  return (NSData *)[(AceObject *)self propertyForKey:@"routeTrafficIncident"];
}

- (void)setRouteTrafficIncident:(id)a3
{
}

- (NSData)etaFilter
{
  return (NSData *)[(AceObject *)self propertyForKey:@"etaFilter"];
}

- (void)setEtaFilter:(id)a3
{
}

- (NSData)evChargingMetadata
{
  return (NSData *)[(AceObject *)self propertyForKey:@"evChargingMetadata"];
}

- (void)setEvChargingMetadata:(id)a3
{
}

- (NSData)originalWaypointRoute
{
  return (NSData *)[(AceObject *)self propertyForKey:@"originalWaypointRoute"];
}

- (void)setOriginalWaypointRoute:(id)a3
{
}

- (NSData)routeAsZilchBinary
{
  return (NSData *)[(AceObject *)self propertyForKey:@"routeAsZilchBinary"];
}

- (void)setRouteAsZilchBinary:(id)a3
{
}

- (NSData)routeId
{
  return (NSData *)[(AceObject *)self propertyForKey:@"routeId"];
}

- (void)setRouteId:(id)a3
{
}

- (NSData)sessionState
{
  return (NSData *)[(AceObject *)self propertyForKey:@"sessionState"];
}

- (void)setSessionState:(id)a3
{
}

@end