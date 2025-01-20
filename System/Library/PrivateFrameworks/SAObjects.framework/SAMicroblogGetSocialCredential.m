@interface SAMicroblogGetSocialCredential
+ (id)getSocialCredential;
- (BOOL)requiresResponse;
- (NSString)explicitUserPermission;
- (NSString)socialNetwork;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setExplicitUserPermission:(id)a3;
- (void)setSocialNetwork:(id)a3;
@end

@implementation SAMicroblogGetSocialCredential

- (id)groupIdentifier
{
  return @"com.apple.ace.microblog";
}

- (id)encodedClassName
{
  return @"GetSocialCredential";
}

+ (id)getSocialCredential
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)explicitUserPermission
{
  return (NSString *)[(AceObject *)self propertyForKey:@"explicitUserPermission"];
}

- (void)setExplicitUserPermission:(id)a3
{
}

- (NSString)socialNetwork
{
  return (NSString *)[(AceObject *)self propertyForKey:@"socialNetwork"];
}

- (void)setSocialNetwork:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end