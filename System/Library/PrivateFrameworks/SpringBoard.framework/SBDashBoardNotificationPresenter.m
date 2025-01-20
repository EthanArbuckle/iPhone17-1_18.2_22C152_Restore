@interface SBDashBoardNotificationPresenter
- (void)presentModalBannerAndExpandForNotificationRequest:(id)a3;
@end

@implementation SBDashBoardNotificationPresenter

- (void)presentModalBannerAndExpandForNotificationRequest:(id)a3
{
  v3 = (void *)SBApp;
  id v4 = a3;
  id v6 = [v3 notificationDispatcher];
  v5 = [v6 bannerDestination];
  [v5 presentModalBannerAndExpandForNotificationRequest:v4];
}

@end