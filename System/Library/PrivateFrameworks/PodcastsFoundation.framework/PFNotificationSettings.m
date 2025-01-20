@interface PFNotificationSettings
+ (BOOL)canSendNotification;
- (PFNotificationSettings)init;
@end

@implementation PFNotificationSettings

+ (BOOL)canSendNotification
{
  return _s18PodcastsFoundation20NotificationSettingsC07canSendC0SbyFZ_0() & 1;
}

- (PFNotificationSettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PFNotificationSettings *)&v3 init];
}

@end