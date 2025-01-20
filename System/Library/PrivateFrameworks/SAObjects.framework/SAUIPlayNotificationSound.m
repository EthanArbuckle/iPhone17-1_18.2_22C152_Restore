@interface SAUIPlayNotificationSound
+ (id)playNotificationSound;
- (BOOL)requiresResponse;
- (NSString)notificationId;
- (NSString)notificationType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setNotificationId:(id)a3;
- (void)setNotificationType:(id)a3;
@end

@implementation SAUIPlayNotificationSound

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"PlayNotificationSound";
}

+ (id)playNotificationSound
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)notificationId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"notificationId"];
}

- (void)setNotificationId:(id)a3
{
}

- (NSString)notificationType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"notificationType"];
}

- (void)setNotificationType:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end