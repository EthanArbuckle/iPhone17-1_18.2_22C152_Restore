@interface NCNotificationBannerEventTracker
+ (void)presentedNotificationRequestAsBanner:(id)a3;
@end

@implementation NCNotificationBannerEventTracker

+ (void)presentedNotificationRequestAsBanner:(id)a3
{
  id v3 = a3;
  id v4 = +[NCNotificationEventTracker sharedInstance];
  [v4 presentedNotificationRequestAsBanner:v3];
}

@end