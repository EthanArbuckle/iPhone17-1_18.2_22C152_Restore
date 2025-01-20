@interface SADailyBriefingSetETAInfo
- (BOOL)requiresResponse;
- (NSString)destination;
- (NSString)transportType;
- (NSString)viaRoute;
- (double)eta;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDestination:(id)a3;
- (void)setEta:(double)a3;
- (void)setTransportType:(id)a3;
- (void)setViaRoute:(id)a3;
@end

@implementation SADailyBriefingSetETAInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.dailybriefing";
}

- (id)encodedClassName
{
  return @"SetETAInfo";
}

- (NSString)destination
{
  return (NSString *)[(AceObject *)self propertyForKey:@"destination"];
}

- (void)setDestination:(id)a3
{
}

- (double)eta
{
  return AceObjectDoubleForProperty(self, @"eta");
}

- (void)setEta:(double)a3
{
}

- (NSString)transportType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"transportType"];
}

- (void)setTransportType:(id)a3
{
}

- (NSString)viaRoute
{
  return (NSString *)[(AceObject *)self propertyForKey:@"viaRoute"];
}

- (void)setViaRoute:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end