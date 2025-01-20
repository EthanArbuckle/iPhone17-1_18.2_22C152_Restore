@interface SAFmfGeoFenceSet
+ (id)geoFenceSet;
- (BOOL)requiresResponse;
- (NSNumber)enable;
- (NSNumber)oneTimeOnly;
- (NSString)fenceType;
- (NSString)geoFenceTrigger;
- (SALocation)requestedLocation;
- (SAPerson)friend;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEnable:(id)a3;
- (void)setFenceType:(id)a3;
- (void)setFriend:(id)a3;
- (void)setGeoFenceTrigger:(id)a3;
- (void)setOneTimeOnly:(id)a3;
- (void)setRequestedLocation:(id)a3;
@end

@implementation SAFmfGeoFenceSet

- (id)groupIdentifier
{
  return @"com.apple.ace.fmf";
}

- (id)encodedClassName
{
  return @"GeoFenceSet";
}

+ (id)geoFenceSet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)enable
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"enable"];
}

- (void)setEnable:(id)a3
{
}

- (NSString)fenceType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"fenceType"];
}

- (void)setFenceType:(id)a3
{
}

- (SAPerson)friend
{
  return (SAPerson *)AceObjectAceObjectForProperty(self, @"friend");
}

- (void)setFriend:(id)a3
{
}

- (NSString)geoFenceTrigger
{
  return (NSString *)[(AceObject *)self propertyForKey:@"geoFenceTrigger"];
}

- (void)setGeoFenceTrigger:(id)a3
{
}

- (NSNumber)oneTimeOnly
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"oneTimeOnly"];
}

- (void)setOneTimeOnly:(id)a3
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