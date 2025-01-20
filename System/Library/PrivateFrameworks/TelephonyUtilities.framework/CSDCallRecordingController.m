@interface CSDCallRecordingController
+ (NSString)notesApplicationBundleID;
- (CSDCallRecordingController)init;
- (CSDCallRecordingController)initWithQueue:(id)a3 speechAssetManager:(id)a4;
- (void)handleCallUnderlyingLinksConnectionChangedWithNotification:(id)a3;
- (void)handleCurrentLocaleDidChange;
- (void)handleMediaTokensChangedWithNotification:(id)a3;
- (void)handleRecordingStatusChangedWithNotification:(id)a3;
- (void)performRequest:(id)a3 forCall:(id)a4 completion:(id)a5;
@end

@implementation CSDCallRecordingController

+ (NSString)notesApplicationBundleID
{
  sub_10032D08C();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (CSDCallRecordingController)initWithQueue:(id)a3 speechAssetManager:(id)a4
{
  return (CSDCallRecordingController *)sub_10032D0F8(a3, a4);
}

- (void)handleCallUnderlyingLinksConnectionChangedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10032D260(v4);
}

- (void)handleRecordingStatusChangedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10032D584(v4);
}

- (void)performRequest:(id)a3 forCall:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_10032E5D0(v9, v10, (char *)v11, (void (**)(void, void))v8);
  _Block_release(v8);
}

- (CSDCallRecordingController)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_1002018DC((uint64_t)self + OBJC_IVAR___CSDCallRecordingController_disclosureController);
  sub_1002018DC((uint64_t)self + OBJC_IVAR___CSDCallRecordingController_recordingProvider);
  sub_1002018DC((uint64_t)self + OBJC_IVAR___CSDCallRecordingController_clientLaunchService);
  sub_1002018DC((uint64_t)self + OBJC_IVAR___CSDCallRecordingController_disclosureDataSource);

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDCallRecordingController_recordingSession);
}

- (void)handleMediaTokensChangedWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100330654(v4);
}

- (void)handleCurrentLocaleDidChange
{
  NSString v2 = self;
  sub_100332030();
}

@end