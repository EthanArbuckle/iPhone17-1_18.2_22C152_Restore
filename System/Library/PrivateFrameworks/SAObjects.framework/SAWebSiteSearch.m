@interface SAWebSiteSearch
+ (id)siteSearch;
- (BOOL)requiresResponse;
- (NSString)provider;
- (NSString)query;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setProvider:(id)a3;
- (void)setQuery:(id)a3;
@end

@implementation SAWebSiteSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.websearch";
}

- (id)encodedClassName
{
  return @"SiteSearch";
}

+ (id)siteSearch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)provider
{
  return (NSString *)[(AceObject *)self propertyForKey:@"provider"];
}

- (void)setProvider:(id)a3
{
}

- (NSString)query
{
  return (NSString *)[(AceObject *)self propertyForKey:@"query"];
}

- (void)setQuery:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end