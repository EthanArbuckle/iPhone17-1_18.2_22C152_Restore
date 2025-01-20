@interface SAOnDeviceNotificationsSearchCompleted
- (BOOL)requiresResponse;
- (NSArray)notifications;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setNotifications:(id)a3;
@end

@implementation SAOnDeviceNotificationsSearchCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"OnDeviceNotificationsSearchCompleted";
}

- (NSArray)notifications
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"notifications", v3);
}

- (void)setNotifications:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end