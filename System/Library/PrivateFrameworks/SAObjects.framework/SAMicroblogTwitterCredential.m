@interface SAMicroblogTwitterCredential
+ (id)twitterCredential;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMicroblogTwitterCredential

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"TwitterCredential";
}

+ (id)twitterCredential
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end