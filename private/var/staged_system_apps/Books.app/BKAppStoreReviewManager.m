@interface BKAppStoreReviewManager
+ (void)cleanAppStoreReviewCache;
- (BKAppStoreReviewManager)init;
- (void)applicationDidForeground;
- (void)attemptToPresentStoreReviewIn:(id)a3 tracker:(id)a4;
- (void)userAddContentToWTRCollectionWithNotification:(id)a3;
- (void)userCustomizedReadingGolsWithNotification:(id)a3;
- (void)userDidRateContentWithNotification:(id)a3;
- (void)userMarkedBookAsFinishedWithNotification:(id)a3;
- (void)userPurchasedContentWithNotification:(id)a3;
@end

@implementation BKAppStoreReviewManager

- (void)applicationDidForeground
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKAppStoreReviewManager_remoteConfig);
  v3 = self;
  if (sub_10001E8C4(0xD00000000000001DLL, 0x80000001009080C0, v2)) {
    [*(id *)((char *)&v3->super.isa + OBJC_IVAR___BKAppStoreReviewManager_sharedStoreReview) applicationDidForeground];
  }
}

- (BKAppStoreReviewManager)init
{
  return (BKAppStoreReviewManager *)AppStoreReviewManager.init()();
}

- (void)attemptToPresentStoreReviewIn:(id)a3 tracker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100257FFC(v6, a4);
}

- (void)userCustomizedReadingGolsWithNotification:(id)a3
{
}

- (void)userPurchasedContentWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100258D34(v4);
}

- (void)userDidRateContentWithNotification:(id)a3
{
}

- (void)userAddContentToWTRCollectionWithNotification:(id)a3
{
}

- (void)userMarkedBookAsFinishedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002591B0(v4);
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKAppStoreReviewManager_remoteConfig);
}

+ (void)cleanAppStoreReviewCache
{
  v0 = self;
  id v1 = [v0 standardUserDefaults];
  NSString v2 = sub_1007FDC30();
  [v1 removeObjectForKey:v2];

  id v3 = [v0 standardUserDefaults];
  NSString v4 = sub_1007FDC30();
  [v3 removeObjectForKey:v4];

  id v5 = [v0 standardUserDefaults];
  id v6 = sub_1007FDC30();
  [v5 removeObjectForKey:v6];
}

@end