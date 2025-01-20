@interface SHUDBannerPresentable
+ (id)requestIdentifier;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (SFHUDBannerModel)model;
- (SHUDBannerPresentable)initWithModel:(id)a3;
- (SHUDBannerViewController)bannerViewController;
- (id)bannerDidDisappearHandler;
- (int64_t)presentableType;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)setBannerDidDisappearHandler:(id)a3;
@end

@implementation SHUDBannerPresentable

- (SHUDBannerPresentable)initWithModel:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SHUDBannerPresentable;
  v6 = [(SHUDBannerPresentable *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    if ([v5 type])
    {
      if ([v5 type] == (id)1)
      {
        uint64_t v8 = +[SHUDOnenessUnlockedUtilities deviceSpecificViewController];
        bannerViewController = v7->_bannerViewController;
        v7->_bannerViewController = (SHUDBannerViewController *)v8;
      }
      else
      {
        bannerViewController = sharingHUDLog();
        if (os_log_type_enabled(bannerViewController, OS_LOG_TYPE_ERROR)) {
          sub_10000BAF8(v5, bannerViewController);
        }
      }
    }
    else
    {
      bannerViewController = [v5 watchName];
      uint64_t v10 = +[SHUDPairedUnlockUtilities deviceSpecificViewControllerWithWatchName:needsLockButton:needsUpdate:](SHUDPairedUnlockUtilities, "deviceSpecificViewControllerWithWatchName:needsLockButton:needsUpdate:", bannerViewController, [v5 needsLockButton], objc_msgSend(v5, "needsUpdate"));
      v11 = v7->_bannerViewController;
      v7->_bannerViewController = (SHUDBannerViewController *)v10;
    }
  }

  return v7;
}

+ (id)requestIdentifier
{
  return @"com.apple.sharing.pairedunlock";
}

- (NSString)requestIdentifier
{
  return (NSString *)+[SHUDBannerPresentable requestIdentifier];
}

- (NSString)requesterIdentifier
{
  return (NSString *)@"com.apple.Sharing.SharingHUDService";
}

- (int64_t)presentableType
{
  return 1;
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v7 = a4;
  id v5 = [(SHUDBannerPresentable *)self bannerDidDisappearHandler];

  if (v5)
  {
    v6 = [(SHUDBannerPresentable *)self bannerDidDisappearHandler];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
}

- (SHUDBannerViewController)bannerViewController
{
  return self->_bannerViewController;
}

- (SFHUDBannerModel)model
{
  return self->_model;
}

- (id)bannerDidDisappearHandler
{
  return self->_bannerDidDisappearHandler;
}

- (void)setBannerDidDisappearHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bannerDidDisappearHandler, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_bannerViewController, 0);
}

@end