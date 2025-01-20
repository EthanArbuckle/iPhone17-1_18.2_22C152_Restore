@interface SAMPMusicMovie
+ (id)musicMovie;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMPMusicMovie

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"MusicMovie";
}

+ (id)musicMovie
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end