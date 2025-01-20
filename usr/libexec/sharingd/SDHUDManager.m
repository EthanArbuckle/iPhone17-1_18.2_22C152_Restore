@interface SDHUDManager
+ (SDHUDManager)shared;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (SDHUDManager)init;
- (void)bannerButtonTappedWithType:(int64_t)a3;
- (void)bannerDidDismissWithType:(int64_t)a3;
- (void)currentBannerRequestWithCompletion:(id)a3;
- (void)dismissPairedUnlockBanner;
- (void)postPairedUnlockBannerFor:(id)a3 needsLockButton:(BOOL)a4 needsUpdate:(BOOL)a5;
- (void)start;
- (void)updatePairedUnlockBannerToUnlocked;
@end

@implementation SDHUDManager

+ (SDHUDManager)shared
{
  if (qword_100969E10 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100994818;

  return (SDHUDManager *)v2;
}

- (SDHUDManager)init
{
  return (SDHUDManager *)sub_100444188();
}

- (void)start
{
  v2 = self;
  sub_1004456DC((uint64_t)&unk_1008DB448, (uint64_t)sub_100448DA4, (uint64_t)&unk_1008DB460);
}

- (void)postPairedUnlockBannerFor:(id)a3 needsLockButton:(BOOL)a4 needsUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  v11 = self;
  sub_100444640(v8, v10, a4, v5);

  swift_bridgeObjectRelease();
}

- (void)updatePairedUnlockBannerToUnlocked
{
  v2 = self;
  sub_1004456DC((uint64_t)&unk_1008DB3A8, (uint64_t)sub_100448D48, (uint64_t)&unk_1008DB3C0);
}

- (void)dismissPairedUnlockBanner
{
  v2 = self;
  sub_1004456DC((uint64_t)&unk_1008DB358, (uint64_t)sub_100448D40, (uint64_t)&unk_1008DB370);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  char v9 = sub_1004482C0(v7);

  return v9 & 1;
}

- (void)currentBannerRequestWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  sub_1004470E8((uint64_t)sub_100448C78, v5);

  swift_release();
}

- (void)bannerDidDismissWithType:(int64_t)a3
{
  v4 = self;
  sub_100447A50(a3);
}

- (void)bannerButtonTappedWithType:(int64_t)a3
{
}

@end