@interface SAMPSearch
+ (id)search;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (BOOL)strict;
- (NSArray)constraints;
- (NSArray)searchTypes;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)maxResults;
- (void)setConstraints:(id)a3;
- (void)setMaxResults:(int64_t)a3;
- (void)setSearchTypes:(id)a3;
- (void)setStrict:(BOOL)a3;
@end

@implementation SAMPSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"Search";
}

+ (id)search
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)constraints
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"constraints", v3);
}

- (void)setConstraints:(id)a3
{
}

- (int64_t)maxResults
{
  return AceObjectIntegerForProperty(self, @"maxResults");
}

- (void)setMaxResults:(int64_t)a3
{
}

- (NSArray)searchTypes
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"searchTypes"];
}

- (void)setSearchTypes:(id)a3
{
}

- (BOOL)strict
{
  return AceObjectBoolForProperty(self, @"strict");
}

- (void)setStrict:(BOOL)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end