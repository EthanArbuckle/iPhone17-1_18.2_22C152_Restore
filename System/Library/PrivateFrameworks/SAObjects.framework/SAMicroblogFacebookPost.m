@interface SAMicroblogFacebookPost
+ (id)facebookPost;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMicroblogFacebookPost

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"FacebookPost";
}

+ (id)facebookPost
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end