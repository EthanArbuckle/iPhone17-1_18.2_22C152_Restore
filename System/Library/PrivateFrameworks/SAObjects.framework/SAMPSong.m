@interface SAMPSong
+ (id)song;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMPSong

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"Song";
}

+ (id)song
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end