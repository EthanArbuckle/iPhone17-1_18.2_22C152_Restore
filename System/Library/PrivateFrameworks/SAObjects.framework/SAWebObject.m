@interface SAWebObject
+ (id)object;
- (NSString)query;
- (SAWebWebSearchResult)results;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setQuery:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation SAWebObject

- (id)groupIdentifier
{
  return @"com.apple.ace.websearch";
}

- (id)encodedClassName
{
  return @"Object";
}

+ (id)object
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)query
{
  return (NSString *)[(AceObject *)self propertyForKey:@"query"];
}

- (void)setQuery:(id)a3
{
}

- (SAWebWebSearchResult)results
{
  return (SAWebWebSearchResult *)AceObjectAceObjectForProperty(self, @"results");
}

- (void)setResults:(id)a3
{
}

@end