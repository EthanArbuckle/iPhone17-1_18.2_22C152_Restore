@interface SAMicroblogFacebookCredential
+ (id)facebookCredential;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAMicroblogFacebookCredential

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"FacebookCredential";
}

+ (id)facebookCredential
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end