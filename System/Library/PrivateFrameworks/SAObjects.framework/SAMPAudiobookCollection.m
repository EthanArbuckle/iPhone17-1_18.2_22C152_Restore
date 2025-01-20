@interface SAMPAudiobookCollection
+ (id)audiobookCollection;
- (NSString)artist;
- (NSString)sortArtist;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setArtist:(id)a3;
- (void)setSortArtist:(id)a3;
@end

@implementation SAMPAudiobookCollection

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"AudiobookCollection";
}

+ (id)audiobookCollection
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)artist
{
  return (NSString *)[(AceObject *)self propertyForKey:@"artist"];
}

- (void)setArtist:(id)a3
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