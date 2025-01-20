@interface SAUSSnippet
+ (id)snippet;
- (NSArray)sections;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSections:(id)a3;
@end

@implementation SAUSSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.universalsearch";
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

- (NSArray)sections
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"sections", v3);
}

- (void)setSections:(id)a3
{
}

@end