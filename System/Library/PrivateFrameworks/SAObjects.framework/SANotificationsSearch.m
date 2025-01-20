@interface SANotificationsSearch
+ (id)notificationsSearch;
- (BOOL)requiresResponse;
- (NSNumber)isOnDeviceSearch;
- (NSNumber)supportsSpokenNotifications;
- (NSString)afterNotificationId;
- (NSString)notificationType;
- (NSString)priority;
- (NSString)sourceAppId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAfterNotificationId:(id)a3;
- (void)setIsOnDeviceSearch:(id)a3;
- (void)setNotificationType:(id)a3;
- (void)setPriority:(id)a3;
- (void)setSourceAppId:(id)a3;
- (void)setSupportsSpokenNotifications:(id)a3;
@end

@implementation SANotificationsSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"NotificationsSearch";
}

+ (id)notificationsSearch
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)afterNotificationId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"afterNotificationId"];
}

- (void)setAfterNotificationId:(id)a3
{
}

- (NSNumber)isOnDeviceSearch
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isOnDeviceSearch"];
}

- (void)setIsOnDeviceSearch:(id)a3
{
}

- (NSString)notificationType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"notificationType"];
}

- (void)setNotificationType:(id)a3
{
}

- (NSString)priority
{
  return (NSString *)[(AceObject *)self propertyForKey:@"priority"];
}

- (void)setPriority:(id)a3
{
}

- (NSString)sourceAppId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sourceAppId"];
}

- (void)setSourceAppId:(id)a3
{
}

- (NSNumber)supportsSpokenNotifications
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"supportsSpokenNotifications"];
}

- (void)setSupportsSpokenNotifications:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end