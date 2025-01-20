@interface SAMPMediaEntity
+ (id)mediaEntity;
- (BOOL)explicit;
- (BOOL)unplayable;
- (NSString)adamIdentifier;
- (NSString)brandIdentifier;
- (NSString)externalIdentifier;
- (NSString)mediaType;
- (NSString)rawPlaybackInfo;
- (NSString)releaseDate;
- (NSString)sortTitle;
- (NSString)storeId;
- (NSString)title;
- (SACalendar)dateAdded;
- (SAMPPlaybackInfo)playbackInfo;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAdamIdentifier:(id)a3;
- (void)setBrandIdentifier:(id)a3;
- (void)setDateAdded:(id)a3;
- (void)setExplicit:(BOOL)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setMediaType:(id)a3;
- (void)setPlaybackInfo:(id)a3;
- (void)setRawPlaybackInfo:(id)a3;
- (void)setReleaseDate:(id)a3;
- (void)setSortTitle:(id)a3;
- (void)setStoreId:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUnplayable:(BOOL)a3;
@end

@implementation SAMPMediaEntity

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"MediaEntity";
}

+ (id)mediaEntity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)adamIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"adamIdentifier"];
}

- (void)setAdamIdentifier:(id)a3
{
}

- (NSString)brandIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"brandIdentifier"];
}

- (void)setBrandIdentifier:(id)a3
{
}

- (SACalendar)dateAdded
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, @"dateAdded");
}

- (void)setDateAdded:(id)a3
{
}

- (BOOL)explicit
{
  return AceObjectBoolForProperty(self, @"explicit");
}

- (void)setExplicit:(BOOL)a3
{
}

- (NSString)externalIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"externalIdentifier"];
}

- (void)setExternalIdentifier:(id)a3
{
}

- (NSString)mediaType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"mediaType"];
}

- (void)setMediaType:(id)a3
{
}

- (SAMPPlaybackInfo)playbackInfo
{
  return (SAMPPlaybackInfo *)AceObjectAceObjectForProperty(self, @"playbackInfo");
}

- (void)setPlaybackInfo:(id)a3
{
}

- (NSString)rawPlaybackInfo
{
  return (NSString *)[(AceObject *)self propertyForKey:@"rawPlaybackInfo"];
}

- (void)setRawPlaybackInfo:(id)a3
{
}

- (NSString)releaseDate
{
  return (NSString *)[(AceObject *)self propertyForKey:@"releaseDate"];
}

- (void)setReleaseDate:(id)a3
{
}

- (NSString)sortTitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sortTitle"];
}

- (void)setSortTitle:(id)a3
{
}

- (NSString)storeId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"storeId"];
}

- (void)setStoreId:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

- (BOOL)unplayable
{
  return AceObjectBoolForProperty(self, @"unplayable");
}

- (void)setUnplayable:(BOOL)a3
{
}

@end