@interface SAMPAudiobook
+ (id)audiobook;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMPAudiobook

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"Audiobook";
}

+ (id)audiobook
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end