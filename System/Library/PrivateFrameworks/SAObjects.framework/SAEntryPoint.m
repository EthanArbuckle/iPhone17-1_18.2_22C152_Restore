@interface SAEntryPoint
+ (id)entryPoint;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
@end

@implementation SAEntryPoint

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"EntryPoint";
}

+ (id)entryPoint
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)latitude
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"latitude"];
}

- (void)setLatitude:(id)a3
{
}

- (NSNumber)longitude
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"longitude"];
}

- (void)setLongitude:(id)a3
{
}

@end