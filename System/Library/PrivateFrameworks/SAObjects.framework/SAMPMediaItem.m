@interface SAMPMediaItem
+ (id)mediaItem;
- (NSNumber)perceivableStartTimeInSeconds;
- (NSString)album;
- (NSString)artist;
- (NSString)genre;
- (NSString)sortAlbum;
- (NSString)sortArtist;
- (SACalendar)datePurchased;
- (SAMPReleaseInfo)releaseInfo;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setDatePurchased:(id)a3;
- (void)setGenre:(id)a3;
- (void)setPerceivableStartTimeInSeconds:(id)a3;
- (void)setReleaseInfo:(id)a3;
- (void)setSortAlbum:(id)a3;
- (void)setSortArtist:(id)a3;
@end

@implementation SAMPMediaItem

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"MediaItem";
}

+ (id)mediaItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)album
{
  return (NSString *)[(AceObject *)self propertyForKey:@"album"];
}

- (void)setAlbum:(id)a3
{
}

- (NSString)artist
{
  return (NSString *)[(AceObject *)self propertyForKey:@"artist"];
}

- (void)setArtist:(id)a3
{
}

- (SACalendar)datePurchased
{
  return (SACalendar *)AceObjectAceObjectForProperty(self, @"datePurchased");
}

- (void)setDatePurchased:(id)a3
{
}

- (NSString)genre
{
  return (NSString *)[(AceObject *)self propertyForKey:@"genre"];
}

- (void)setGenre:(id)a3
{
}

- (NSNumber)perceivableStartTimeInSeconds
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"perceivableStartTimeInSeconds"];
}

- (void)setPerceivableStartTimeInSeconds:(id)a3
{
}

- (SAMPReleaseInfo)releaseInfo
{
  return (SAMPReleaseInfo *)AceObjectAceObjectForProperty(self, @"releaseInfo");
}

- (void)setReleaseInfo:(id)a3
{
}

- (NSString)sortAlbum
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sortAlbum"];
}

- (void)setSortAlbum:(id)a3
{
}

- (NSString)sortArtist
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sortArtist"];
}

- (void)setSortArtist:(id)a3
{
}

@end