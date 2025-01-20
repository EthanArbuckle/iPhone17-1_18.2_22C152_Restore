@interface SACheckAuthenticationRequirement
+ (id)checkAuthenticationRequirement;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)restrictionsOnCompanion;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRestrictionsOnCompanion:(id)a3;
@end

@implementation SACheckAuthenticationRequirement

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"CheckAuthenticationRequirement";
}

+ (id)checkAuthenticationRequirement
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)restrictionsOnCompanion
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"restrictionsOnCompanion"];
}

- (void)setRestrictionsOnCompanion:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end