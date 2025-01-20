@interface SAMPArtistCollection
+ (id)artistCollection;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMPArtistCollection

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"ArtistCollection";
}

+ (id)artistCollection
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end