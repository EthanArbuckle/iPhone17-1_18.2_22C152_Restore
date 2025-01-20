@interface SAVCSContentDetailPage
+ (id)contentDetailPage;
- (BOOL)isEvod;
- (BOOL)userDriven;
- (NSString)contentType;
- (NSString)imagesJsonContentPayload;
- (NSString)loadingText;
- (NSString)seasonId;
- (NSString)showId;
- (NSString)utsId;
- (NSURL)url;
- (NSURL)utsSearchUrl;
- (SAUIImageResource)image;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)resultIndex;
- (void)setContentType:(id)a3;
- (void)setImage:(id)a3;
- (void)setImagesJsonContentPayload:(id)a3;
- (void)setIsEvod:(BOOL)a3;
- (void)setLoadingText:(id)a3;
- (void)setResultIndex:(int64_t)a3;
- (void)setSeasonId:(id)a3;
- (void)setShowId:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUserDriven:(BOOL)a3;
- (void)setUtsId:(id)a3;
- (void)setUtsSearchUrl:(id)a3;
@end

@implementation SAVCSContentDetailPage

- (id)groupIdentifier
{
  return @"com.apple.ace.videocontent";
}

- (id)encodedClassName
{
  return @"ContentDetailPage";
}

+ (id)contentDetailPage
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)contentType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contentType"];
}

- (void)setContentType:(id)a3
{
}

- (SAUIImageResource)image
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"image");
}

- (void)setImage:(id)a3
{
}

- (NSString)imagesJsonContentPayload
{
  return (NSString *)[(AceObject *)self propertyForKey:@"imagesJsonContentPayload"];
}

- (void)setImagesJsonContentPayload:(id)a3
{
}

- (BOOL)isEvod
{
  return AceObjectBoolForProperty(self, @"isEvod");
}

- (void)setIsEvod:(BOOL)a3
{
}

- (NSString)loadingText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"loadingText"];
}

- (void)setLoadingText:(id)a3
{
}

- (int64_t)resultIndex
{
  return AceObjectIntegerForProperty(self, @"resultIndex");
}

- (void)setResultIndex:(int64_t)a3
{
}

- (NSString)seasonId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"seasonId"];
}

- (void)setSeasonId:(id)a3
{
}

- (NSString)showId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"showId"];
}

- (void)setShowId:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)AceObjectURLForProperty(self, @"url");
}

- (void)setUrl:(id)a3
{
}

- (BOOL)userDriven
{
  return AceObjectBoolForProperty(self, @"userDriven");
}

- (void)setUserDriven:(BOOL)a3
{
}

- (NSString)utsId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"utsId"];
}

- (void)setUtsId:(id)a3
{
}

- (NSURL)utsSearchUrl
{
  return (NSURL *)AceObjectURLForProperty(self, @"utsSearchUrl");
}

- (void)setUtsSearchUrl:(id)a3
{
}

@end