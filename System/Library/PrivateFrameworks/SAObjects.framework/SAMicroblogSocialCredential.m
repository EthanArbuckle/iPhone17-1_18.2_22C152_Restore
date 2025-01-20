@interface SAMicroblogSocialCredential
+ (id)socialCredential;
- (NSString)accessToken;
- (NSString)personalizationPermission;
- (NSString)socialNetwork;
- (NSString)tokenSecret;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAccessToken:(id)a3;
- (void)setPersonalizationPermission:(id)a3;
- (void)setSocialNetwork:(id)a3;
- (void)setTokenSecret:(id)a3;
@end

@implementation SAMicroblogSocialCredential

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"SocialCredential";
}

+ (id)socialCredential
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)accessToken
{
  return (NSString *)[(AceObject *)self propertyForKey:@"accessToken"];
}

- (void)setAccessToken:(id)a3
{
}

- (NSString)personalizationPermission
{
  return (NSString *)[(AceObject *)self propertyForKey:@"personalizationPermission"];
}

- (void)setPersonalizationPermission:(id)a3
{
}

- (NSString)socialNetwork
{
  return (NSString *)[(AceObject *)self propertyForKey:@"socialNetwork"];
}

- (void)setSocialNetwork:(id)a3
{
}

- (NSString)tokenSecret
{
  return (NSString *)[(AceObject *)self propertyForKey:@"tokenSecret"];
}

- (void)setTokenSecret:(id)a3
{
}

@end