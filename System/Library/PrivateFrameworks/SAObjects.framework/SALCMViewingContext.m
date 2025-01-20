@interface SALCMViewingContext
+ (id)viewingContext;
- (BOOL)commercialPlaying;
- (BOOL)paused;
- (NSArray)viewingHistory;
- (NSNumber)durationInMilliseconds;
- (NSNumber)playbackPositionInMilliseconds;
- (NSString)nowPlayingAppId;
- (SALCMContent)nowPlaying;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommercialPlaying:(BOOL)a3;
- (void)setDurationInMilliseconds:(id)a3;
- (void)setNowPlaying:(id)a3;
- (void)setNowPlayingAppId:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPlaybackPositionInMilliseconds:(id)a3;
- (void)setViewingHistory:(id)a3;
@end

@implementation SALCMViewingContext

- (id)groupIdentifier
{
  return @"com.apple.ace.livecontent";
}

- (id)encodedClassName
{
  return @"ViewingContext";
}

+ (id)viewingContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)commercialPlaying
{
  return AceObjectBoolForProperty(self, @"commercialPlaying");
}

- (void)setCommercialPlaying:(BOOL)a3
{
}

- (NSNumber)durationInMilliseconds
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"durationInMilliseconds"];
}

- (void)setDurationInMilliseconds:(id)a3
{
}

- (SALCMContent)nowPlaying
{
  return (SALCMContent *)AceObjectAceObjectForProperty(self, @"nowPlaying");
}

- (void)setNowPlaying:(id)a3
{
}

- (NSString)nowPlayingAppId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"nowPlayingAppId"];
}

- (void)setNowPlayingAppId:(id)a3
{
}

- (BOOL)paused
{
  return AceObjectBoolForProperty(self, @"paused");
}

- (void)setPaused:(BOOL)a3
{
}

- (NSNumber)playbackPositionInMilliseconds
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"playbackPositionInMilliseconds"];
}

- (void)setPlaybackPositionInMilliseconds:(id)a3
{
}

- (NSArray)viewingHistory
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"viewingHistory", v3);
}

- (void)setViewingHistory:(id)a3
{
}

@end