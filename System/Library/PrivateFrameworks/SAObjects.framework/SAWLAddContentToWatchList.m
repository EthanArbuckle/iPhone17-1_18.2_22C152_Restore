@interface SAWLAddContentToWatchList
+ (id)addContentToWatchList;
- (BOOL)requiresResponse;
- (NSString)canonicalId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCanonicalId:(id)a3;
@end

@implementation SAWLAddContentToWatchList

- (id)groupIdentifier
{
  return @"com.apple.ace.watchlist";
}

- (id)encodedClassName
{
  return @"AddContentToWatchList";
}

+ (id)addContentToWatchList
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

- (BOOL)requiresResponse
{
  return 0;
}

@end