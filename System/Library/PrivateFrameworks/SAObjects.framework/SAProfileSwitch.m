@interface SAProfileSwitch
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSString)sharedUserId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSharedUserId:(id)a3;
@end

@implementation SAProfileSwitch

- (id)groupIdentifier
{
  return @"com.apple.ace.profile";
}

- (id)encodedClassName
{
  return @"Switch";
}

- (NSString)sharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sharedUserId"];
}

- (void)setSharedUserId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end