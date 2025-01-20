@interface SAMacFileSearchView
+ (id)fileSearchView;
- (NSArray)entities;
- (NSString)query;
- (NSString)searchTitle;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)numResults;
- (void)setEntities:(id)a3;
- (void)setNumResults:(int64_t)a3;
- (void)setQuery:(id)a3;
- (void)setSearchTitle:(id)a3;
@end

@implementation SAMacFileSearchView

- (id)groupIdentifier
{
  return @"com.apple.ace.mac";
}

- (id)encodedClassName
{
  return @"FileSearchView";
}

+ (id)fileSearchView
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)entities
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"entities"];
}

- (void)setEntities:(id)a3
{
}

- (int64_t)numResults
{
  return AceObjectIntegerForProperty(self, @"numResults");
}

- (void)setNumResults:(int64_t)a3
{
}

- (NSString)query
{
  return (NSString *)[(AceObject *)self propertyForKey:@"query"];
}

- (void)setQuery:(id)a3
{
}

- (NSString)searchTitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"searchTitle"];
}

- (void)setSearchTitle:(id)a3
{
}

@end