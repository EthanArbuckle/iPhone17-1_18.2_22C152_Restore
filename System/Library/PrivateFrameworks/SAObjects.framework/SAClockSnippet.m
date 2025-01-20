@interface SAClockSnippet
+ (id)snippet;
- (NSArray)clocks;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClocks:(id)a3;
@end

@implementation SAClockSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.clock";
}

- (id)encodedClassName
{
  return @"Snippet";
}

+ (id)snippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)clocks
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"clocks", v3);
}

- (void)setClocks:(id)a3
{
}

@end