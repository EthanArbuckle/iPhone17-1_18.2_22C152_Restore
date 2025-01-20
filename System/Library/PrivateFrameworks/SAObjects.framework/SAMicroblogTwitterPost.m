@interface SAMicroblogTwitterPost
+ (id)twitterPost;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMicroblogTwitterPost

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"TwitterPost";
}

+ (id)twitterPost
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end