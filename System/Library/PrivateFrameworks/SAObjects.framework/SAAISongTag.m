@interface SAAISongTag
+ (id)songTag;
- (NSString)adamId;
- (NSString)album;
- (NSString)albumAdamId;
- (NSString)artist;
- (NSString)artistAdamId;
- (NSString)contentRating;
- (NSString)title;
- (NSURL)iTunesUri;
- (NSURL)radioStationUri;
- (SAUIImageResource)previewImage;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAdamId:(id)a3;
- (void)setAlbum:(id)a3;
- (void)setAlbumAdamId:(id)a3;
- (void)setArtist:(id)a3;
- (void)setArtistAdamId:(id)a3;
- (void)setContentRating:(id)a3;
- (void)setITunesUri:(id)a3;
- (void)setPreviewImage:(id)a3;
- (void)setRadioStationUri:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SAAISongTag

- (id)groupIdentifier
{
  return @"com.apple.ace.acousticid";
}

- (id)encodedClassName
{
  return @"SongTag";
}

+ (id)songTag
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)adamId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"adamId"];
}

- (void)setAdamId:(id)a3
{
}

- (NSString)album
{
  return (NSString *)[(AceObject *)self propertyForKey:@"album"];
}

- (void)setAlbum:(id)a3
{
}

- (NSString)albumAdamId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"albumAdamId"];
}

- (void)setAlbumAdamId:(id)a3
{
}

- (NSString)artist
{
  return (NSString *)[(AceObject *)self propertyForKey:@"artist"];
}

- (void)setArtist:(id)a3
{
}

- (NSString)artistAdamId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"artistAdamId"];
}

- (void)setArtistAdamId:(id)a3
{
}

- (NSString)contentRating
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contentRating"];
}

- (void)setContentRating:(id)a3
{
}

- (NSURL)iTunesUri
{
  return (NSURL *)AceObjectURLForProperty(self, @"iTunesUri");
}

- (void)setITunesUri:(id)a3
{
}

- (SAUIImageResource)previewImage
{
  return (SAUIImageResource *)AceObjectAceObjectForProperty(self, @"previewImage");
}

- (void)setPreviewImage:(id)a3
{
}

- (NSURL)radioStationUri
{
  return (NSURL *)AceObjectURLForProperty(self, @"radioStationUri");
}

- (void)setRadioStationUri:(id)a3
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