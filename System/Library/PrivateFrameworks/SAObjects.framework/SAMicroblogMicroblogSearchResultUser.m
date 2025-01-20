@interface SAMicroblogMicroblogSearchResultUser
+ (id)microblogSearchResultUser;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMicroblogMicroblogSearchResultUser

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"MicroblogSearchResultUser";
}

+ (id)microblogSearchResultUser
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end