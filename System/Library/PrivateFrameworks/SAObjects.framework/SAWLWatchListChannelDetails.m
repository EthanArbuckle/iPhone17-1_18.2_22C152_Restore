@interface SAWLWatchListChannelDetails
+ (id)watchListChannelDetails;
- (NSData)appIconDynamicImage;
- (NSString)appName;
- (NSURL)appStoreURL;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAppIconDynamicImage:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAppStoreURL:(id)a3;
@end

@implementation SAWLWatchListChannelDetails

- (id)groupIdentifier
{
  return @"com.apple.ace.watchlist";
}

- (id)encodedClassName
{
  return @"WatchListChannelDetails";
}

+ (id)watchListChannelDetails
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)appIconDynamicImage
{
  return (NSData *)[(AceObject *)self propertyForKey:@"appIconDynamicImage"];
}

- (void)setAppIconDynamicImage:(id)a3
{
}

- (NSString)appName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"appName"];
}

- (void)setAppName:(id)a3
{
}

- (NSURL)appStoreURL
{
  return (NSURL *)AceObjectURLForProperty(self, @"appStoreURL");
}

- (void)setAppStoreURL:(id)a3
{
}

@end