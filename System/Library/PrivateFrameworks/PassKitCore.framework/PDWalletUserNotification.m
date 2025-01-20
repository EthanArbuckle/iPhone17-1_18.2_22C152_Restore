@interface PDWalletUserNotification
- (BOOL)needsNotificationSettings;
- (unint64_t)notificationType;
@end

@implementation PDWalletUserNotification

- (unint64_t)notificationType
{
  return 1;
}

- (BOOL)needsNotificationSettings
{
  return 0;
}

@end