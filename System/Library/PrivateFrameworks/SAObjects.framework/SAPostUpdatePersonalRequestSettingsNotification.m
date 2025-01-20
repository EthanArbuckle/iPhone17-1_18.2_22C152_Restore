@interface SAPostUpdatePersonalRequestSettingsNotification
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSString)homeId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHomeId:(id)a3;
@end

@implementation SAPostUpdatePersonalRequestSettingsNotification

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"PostUpdatePersonalRequestSettingsNotification";
}

- (NSString)homeId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"homeId"];
}

- (void)setHomeId:(id)a3
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