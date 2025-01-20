@interface SAWebSnippet
+ (id)snippet;
- (NSArray)webSearch;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setWebSearch:(id)a3;
@end

@implementation SAWebSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.websearch";
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

- (NSArray)webSearch
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"webSearch", v3);
}

- (void)setWebSearch:(id)a3
{
}

@end