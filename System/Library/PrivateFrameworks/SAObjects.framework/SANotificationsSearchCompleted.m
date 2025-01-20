@interface SANotificationsSearchCompleted
+ (id)notificationsSearchCompleted;
- (BOOL)requiresResponse;
- (NSArray)notifications;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setNotifications:(id)a3;
@end

@implementation SANotificationsSearchCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"NotificationsSearchCompleted";
}

+ (id)notificationsSearchCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
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