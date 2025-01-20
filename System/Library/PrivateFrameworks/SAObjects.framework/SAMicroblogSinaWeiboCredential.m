@interface SAMicroblogSinaWeiboCredential
+ (id)sinaWeiboCredential;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMicroblogSinaWeiboCredential

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"SinaWeiboCredential";
}

+ (id)sinaWeiboCredential
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end