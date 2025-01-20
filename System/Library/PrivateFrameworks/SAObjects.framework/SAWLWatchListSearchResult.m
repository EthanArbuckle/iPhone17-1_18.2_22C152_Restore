@interface SAWLWatchListSearchResult
+ (id)watchListSearchResult;
- (BOOL)isEvod;
- (NSDate)releaseDate;
- (NSString)canonicalId;
- (NSString)contentType;
- (NSString)network;
- (NSString)shelfType;
- (NSString)studio;
- (NSString)title;
- (SAUIImageResource)evodFeaturingImage;
- (SAUIImageResource)image;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCanonicalId:(id)a3;
- (void)setContentType:(id)a3;
- (void)setEvodFeaturingImage:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsEvod:(BOOL)a3;
- (void)setNetwork:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setShelfType:(id)a3;
- (void)setStudio:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAWLWatchListSearchResult

- (id)groupIdentifier
{
  return @"com.apple.ace.watchlist";
}

- (id)encodedClassName
{
  return @"WatchListSearchResult";
}

+ (id)watchListSearchResult
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

- (SAUIImageResource)evodFeaturingImage
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"evodFeaturingImage");
}

- (void)setEvodFeaturingImage:(id)a3
{
}

- (SAUIImageResource)image
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"image");
}

- (void)setImage:(id)a3
{
}

- (BOOL)isEvod
{
  return AceObjectBoolForProperty(self, @"isEvod");
}

- (void)setIsEvod:(BOOL)a3
{
}

- (NSString)network
{
  return (NSString *)[(AceObject *)self propertyForKey:@"network"];
}

- (void)setNetwork:(id)a3
{
}

- (NSDate)releaseDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"releaseDate"];
}

- (void)setReleaseDate:(id)a3
{
}

- (NSString)shelfType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"shelfType"];
}

- (void)setShelfType:(id)a3
{
}

- (NSString)studio
{
  return (NSString *)[(AceObject *)self propertyForKey:@"studio"];
}

- (void)setStudio:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

@end