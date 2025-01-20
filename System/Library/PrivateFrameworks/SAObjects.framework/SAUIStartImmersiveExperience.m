@interface SAUIStartImmersiveExperience
- (BOOL)requiresResponse;
- (NSString)domain;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDomain:(id)a3;
@end

@implementation SAUIStartImmersiveExperience

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"StartImmersiveExperience";
}

- (NSString)domain
{
  return (NSString *)[(AceObject *)self propertyForKey:@"domain"];
}

- (void)setDomain:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end