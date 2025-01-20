@interface SAMicroblogSocialCredentialResult
+ (id)socialCredentialResult;
- (BOOL)requiresResponse;
- (SAMicroblogSocialCredential)socialCredential;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSocialCredential:(id)a3;
@end

@implementation SAMicroblogSocialCredentialResult

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"SocialCredentialResult";
}

+ (id)socialCredentialResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAMicroblogSocialCredential)socialCredential
{
  return (SAMicroblogSocialCredential *)AceObjectAceObjectForProperty(self, @"socialCredential");
}

- (void)setSocialCredential:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end