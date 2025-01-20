@interface SAFmfGeoFence
+ (id)geoFence;
- (NSString)geoFenceTrigger;
- (SALocation)location;
- (SAPersonAttribute)friend;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setFriend:(id)a3;
- (void)setGeoFenceTrigger:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation SAFmfGeoFence

- (id)groupIdentifier
{
  return @"com.apple.ace.fmf";
}

- (id)encodedClassName
{
  return @"GeoFence";
}

+ (id)geoFence
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAPersonAttribute)friend
{
  return (SAPersonAttribute *)AceObjectAceObjectForProperty(self, @"friend");
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

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, @"location");
}

- (void)setLocation:(id)a3
{
}

@end