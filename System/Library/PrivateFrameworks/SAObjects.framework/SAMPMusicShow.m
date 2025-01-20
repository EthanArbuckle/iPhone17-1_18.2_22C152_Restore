@interface SAMPMusicShow
+ (id)musicShow;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMPMusicShow

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"MusicShow";
}

+ (id)musicShow
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end