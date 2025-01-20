@interface SAWLRemoveContentFromWatchList
+ (id)removeContentFromWatchList;
- (BOOL)requiresResponse;
- (NSString)canonicalId;
- (NSString)siriLocale;
- (NSString)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCanonicalId:(id)a3;
- (void)setSiriLocale:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAWLRemoveContentFromWatchList

- (id)groupIdentifier
{
  return @"com.apple.ace.watchlist";
}

- (id)encodedClassName
{
  return @"RemoveContentFromWatchList";
}

+ (id)removeContentFromWatchList
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)canonicalId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"canonicalId"];
}

- (void)setCanonicalId:(id)a3
{
}

- (NSString)siriLocale
{
  return (NSString *)[(AceObject *)self propertyForKey:@"siriLocale"];
}

- (void)setSiriLocale:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end