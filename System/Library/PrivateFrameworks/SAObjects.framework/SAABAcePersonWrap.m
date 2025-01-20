@interface SAABAcePersonWrap
+ (id)acePersonWrap;
- (NSNumber)generation;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setGeneration:(id)a3;
@end

@implementation SAABAcePersonWrap

- (id)groupIdentifier
{
  return @"com.apple.ace.contact";
}

- (id)encodedClassName
{
  return @"AcePersonWrap";
}

+ (id)acePersonWrap
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)generation
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"generation"];
}

- (void)setGeneration:(id)a3
{
}

@end