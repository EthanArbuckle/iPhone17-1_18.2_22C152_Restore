@interface SAWLSearchPlayableContentFromWatchList
+ (id)searchPlayableContentFromWatchList;
- (BOOL)onlyReturnNextItem;
- (BOOL)requiresResponse;
- (NSString)canonicalId;
- (NSString)contentType;
- (NSString)siriLocale;
- (NSString)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCanonicalId:(id)a3;
- (void)setContentType:(id)a3;
- (void)setOnlyReturnNextItem:(BOOL)a3;
- (void)setSiriLocale:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAWLSearchPlayableContentFromWatchList

- (id)groupIdentifier
{
  return @"com.apple.ace.watchlist";
}

- (id)encodedClassName
{
  return @"SearchPlayableContentFromWatchList";
}

+ (id)searchPlayableContentFromWatchList
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

- (NSString)contentType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contentType"];
}

- (void)setContentType:(id)a3
{
}

- (BOOL)onlyReturnNextItem
{
  return AceObjectBoolForProperty(self, @"onlyReturnNextItem");
}

- (void)setOnlyReturnNextItem:(BOOL)a3
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