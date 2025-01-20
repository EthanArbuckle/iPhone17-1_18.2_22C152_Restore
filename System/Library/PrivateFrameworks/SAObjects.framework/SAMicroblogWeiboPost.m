@interface SAMicroblogWeiboPost
+ (id)weiboPost;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMicroblogWeiboPost

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"WeiboPost";
}

+ (id)weiboPost
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end