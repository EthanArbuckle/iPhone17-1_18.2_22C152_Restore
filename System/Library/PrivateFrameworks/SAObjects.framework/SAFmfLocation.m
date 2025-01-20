@interface SAFmfLocation
+ (id)location;
- (NSNumber)distance;
- (NSNumber)locationDate;
- (SAPersonAttribute)friend;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDistance:(id)a3;
- (void)setFriend:(id)a3;
- (void)setLocationDate:(id)a3;
@end

@implementation SAFmfLocation

- (id)groupIdentifier
{
  return @"com.apple.ace.fmf";
}

- (id)encodedClassName
{
  return @"Location";
}

+ (id)location
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)distance
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"distance"];
}

- (void)setDistance:(id)a3
{
}

- (SAPersonAttribute)friend
{
  return (SAPersonAttribute *)AceObjectAceObjectForProperty(self, @"friend");
}

- (void)setFriend:(id)a3
{
}

- (NSNumber)locationDate
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"locationDate"];
}

- (void)setLocationDate:(id)a3
{
}

@end