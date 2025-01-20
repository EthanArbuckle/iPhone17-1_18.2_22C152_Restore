@interface SAUIPerformNotificationAction
- (BOOL)requiresResponse;
- (NSString)actionIdentifier;
- (NSString)actionTitle;
- (NSString)notificationIdentifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setActionIdentifier:(id)a3;
- (void)setActionTitle:(id)a3;
- (void)setNotificationIdentifier:(id)a3;
@end

@implementation SAUIPerformNotificationAction

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"PerformNotificationAction";
}

- (NSString)actionIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"actionIdentifier"];
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)actionTitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"actionTitle"];
}

- (void)setActionTitle:(id)a3
{
}

- (NSString)notificationIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"notificationIdentifier"];
}

- (void)setNotificationIdentifier:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end