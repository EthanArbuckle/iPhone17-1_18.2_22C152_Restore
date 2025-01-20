@interface SAMPAlbumCollection
+ (id)albumCollection;
- (NSString)artist;
- (NSString)description;
- (NSString)sortArtist;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setArtist:(id)a3;
- (void)setDescription:(id)a3;
- (void)setSortArtist:(id)a3;
@end

@implementation SAMPAlbumCollection

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"AlbumCollection";
}

+ (id)albumCollection
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

- (NSString)description
{
  return (NSString *)[(AceObject *)self propertyForKey:@"description"];
}

- (void)setDescription:(id)a3
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