@interface SALocalSearchStartNavigation
+ (id)startNavigation;
- (BOOL)requiresResponse;
- (NSString)directionsType;
- (SALocation)destination;
- (SALocation)origin;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDestination:(id)a3;
- (void)setDirectionsType:(id)a3;
- (void)setOrigin:(id)a3;
@end

@implementation SALocalSearchStartNavigation

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"StartNavigation";
}

+ (id)startNavigation
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SALocation)destination
{
  return (SALocation *)AceObjectAceObjectForProperty(self, @"destination");
}

- (void)setDestination:(id)a3
{
}

- (NSString)directionsType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"directionsType"];
}

- (void)setDirectionsType:(id)a3
{
}

- (SALocation)origin
{
  return (SALocation *)AceObjectAceObjectForProperty(self, @"origin");
}

- (void)setOrigin:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end