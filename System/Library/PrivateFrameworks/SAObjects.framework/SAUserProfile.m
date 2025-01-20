@interface SAUserProfile
- (BOOL)requiresResponse;
- (NSArray)names;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setNames:(id)a3;
@end

@implementation SAUserProfile

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"UserProfile";
}

- (NSArray)names
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"names"];
}

- (void)setNames:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end