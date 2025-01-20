@interface SAPostPersonalDomainActivityNotification
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSString)homeId;
- (NSString)notificationBody;
- (NSString)originatingDeviceName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setHomeId:(id)a3;
- (void)setNotificationBody:(id)a3;
- (void)setOriginatingDeviceName:(id)a3;
@end

@implementation SAPostPersonalDomainActivityNotification

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"PostPersonalDomainActivityNotification";
}

- (NSString)homeId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"homeId"];
}

- (void)setHomeId:(id)a3
{
}

- (NSString)notificationBody
{
  return (NSString *)[(AceObject *)self propertyForKey:@"notificationBody"];
}

- (void)setNotificationBody:(id)a3
{
}

- (NSString)originatingDeviceName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"originatingDeviceName"];
}

- (void)setOriginatingDeviceName:(id)a3
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