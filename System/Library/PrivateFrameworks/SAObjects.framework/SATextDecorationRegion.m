@interface SATextDecorationRegion
+ (id)textDecorationRegion;
- (NSNumber)length;
- (NSNumber)start;
- (NSString)property;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLength:(id)a3;
- (void)setProperty:(id)a3;
- (void)setStart:(id)a3;
@end

@implementation SATextDecorationRegion

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"TextDecorationRegion";
}

+ (id)textDecorationRegion
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)length
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"length"];
}

- (void)setLength:(id)a3
{
}

- (NSString)property
{
  return (NSString *)[(AceObject *)self propertyForKey:@"property"];
}

- (void)setProperty:(id)a3
{
}

- (NSNumber)start
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"start"];
}

- (void)setStart:(id)a3
{
}

@end