@interface SAClockAceClockWrap
+ (id)aceClockWrap;
- (NSNumber)generation;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setGeneration:(id)a3;
@end

@implementation SAClockAceClockWrap

- (id)groupIdentifier
{
  return @"com.apple.ace.clock";
}

- (id)encodedClassName
{
  return @"AceClockWrap";
}

+ (id)aceClockWrap
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