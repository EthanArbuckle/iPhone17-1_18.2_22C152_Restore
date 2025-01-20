@interface SASocialProfile
+ (id)socialProfile;
- (NSString)serviceType;
- (NSString)url;
- (NSString)userName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setServiceType:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUserName:(id)a3;
@end

@implementation SASocialProfile

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SocialProfile";
}

+ (id)socialProfile
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)serviceType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"serviceType"];
}

- (void)setServiceType:(id)a3
{
}

- (NSString)url
{
  return (NSString *)[(AceObject *)self propertyForKey:@"url"];
}

- (void)setUrl:(id)a3
{
}

- (NSString)userName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"userName"];
}

- (void)setUserName:(id)a3
{
}

@end