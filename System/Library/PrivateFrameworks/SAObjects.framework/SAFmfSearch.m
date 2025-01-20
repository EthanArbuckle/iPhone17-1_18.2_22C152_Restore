@interface SAFmfSearch
+ (id)search;
- (BOOL)requiresResponse;
- (NSArray)friends;
- (NSString)proximity;
- (SALocation)currentLocation;
- (SALocation)requestedLocation;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCurrentLocation:(id)a3;
- (void)setFriends:(id)a3;
- (void)setProximity:(id)a3;
- (void)setRequestedLocation:(id)a3;
@end

@implementation SAFmfSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.fmf";
}

- (id)encodedClassName
{
  return @"Search";
}

+ (id)search
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SALocation)currentLocation
{
  return (SALocation *)AceObjectAceObjectForProperty(self, @"currentLocation");
}

- (void)setCurrentLocation:(id)a3
{
}

- (NSArray)friends
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"friends", v3);
}

- (void)setFriends:(id)a3
{
}

- (NSString)proximity
{
  return (NSString *)[(AceObject *)self propertyForKey:@"proximity"];
}

- (void)setProximity:(id)a3
{
}

- (SALocation)requestedLocation
{
  return (SALocation *)AceObjectAceObjectForProperty(self, @"requestedLocation");
}

- (void)setRequestedLocation:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end