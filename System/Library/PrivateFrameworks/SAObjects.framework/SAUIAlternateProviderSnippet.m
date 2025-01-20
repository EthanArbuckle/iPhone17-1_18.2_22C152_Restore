@interface SAUIAlternateProviderSnippet
+ (id)alternateProviderSnippet;
- (NSArray)alternateProviderResults;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlternateProviderResults:(id)a3;
@end

@implementation SAUIAlternateProviderSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"AlternateProviderSnippet";
}

+ (id)alternateProviderSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)alternateProviderResults
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"alternateProviderResults", v3);
}

- (void)setAlternateProviderResults:(id)a3
{
}

@end