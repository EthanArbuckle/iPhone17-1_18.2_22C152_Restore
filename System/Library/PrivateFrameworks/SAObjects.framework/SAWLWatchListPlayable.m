@interface SAWLWatchListPlayable
+ (id)watchListPlayable;
- (BOOL)entitled;
- (BOOL)installed;
- (NSURL)playURL;
- (SAWLWatchListChannelDetails)channelDetails;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setChannelDetails:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setInstalled:(BOOL)a3;
- (void)setPlayURL:(id)a3;
@end

@implementation SAWLWatchListPlayable

- (id)groupIdentifier
{
  return @"com.apple.ace.watchlist";
}

- (id)encodedClassName
{
  return @"WatchListPlayable";
}

+ (id)watchListPlayable
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAWLWatchListChannelDetails)channelDetails
{
  return (SAWLWatchListChannelDetails *)AceObjectAceObjectForProperty(self, @"channelDetails");
}

- (void)setChannelDetails:(id)a3
{
}

- (BOOL)entitled
{
  return AceObjectBoolForProperty(self, @"entitled");
}

- (void)setEntitled:(BOOL)a3
{
}

- (BOOL)installed
{
  return AceObjectBoolForProperty(self, @"installed");
}

- (void)setInstalled:(BOOL)a3
{
}

- (NSURL)playURL
{
  return (NSURL *)AceObjectURLForProperty(self, @"playURL");
}

- (void)setPlayURL:(id)a3
{
}

@end