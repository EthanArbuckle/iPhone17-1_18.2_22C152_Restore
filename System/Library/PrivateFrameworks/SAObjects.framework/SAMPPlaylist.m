@interface SAMPPlaylist
+ (id)playlist;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMPPlaylist

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"Playlist";
}

+ (id)playlist
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end