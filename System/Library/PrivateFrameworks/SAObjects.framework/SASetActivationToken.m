@interface SASetActivationToken
+ (id)setActivationToken;
- (BOOL)requiresResponse;
- (NSData)activationToken;
- (NSString)language;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActivationToken:(id)a3;
- (void)setLanguage:(id)a3;
@end

@implementation SASetActivationToken

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetActivationToken";
}

+ (id)setActivationToken
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSData)activationToken
{
  return (NSData *)[(AceObject *)self propertyForKey:@"activationToken"];
}

- (void)setActivationToken:(id)a3
{
}

- (NSString)language
{
  return (NSString *)[(AceObject *)self propertyForKey:@"language"];
}

- (void)setLanguage:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end