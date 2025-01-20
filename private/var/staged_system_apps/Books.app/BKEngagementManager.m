@interface BKEngagementManager
+ (void)destroyPersistentStorageInDirectory:(id)a3;
- (BCEngagementEventController)eventController;
- (BKEngagementManager)init;
- (BKEngagementManager)initWithConfiguration:(id)a3 configurationContainer:(id)a4;
- (BKEngagementManagerAnalyticsHelper)analyticsHelper;
- (BKEngagementManagerMetadata)metadata;
- (BKSessionDonor)sessionDonor;
- (id)donorWithType:(id)a3;
- (void)downloadQueue:(id)a3 purchasedDidCompleteWithResponse:(id)a4;
- (void)engagementEventDataForEventWithEventName:(id)a3 completion:(id)a4;
- (void)fetchDialogRequestsFor:(id)a3 completion:(id)a4;
- (void)forcePurgeAll;
- (void)forceSyncFromCloudKit;
- (void)forceSyncToCloudKit;
- (void)onCloudUpdate:(id)a3;
- (void)onConfigurationChange:(id)a3;
- (void)onDidReceiveAppDidBackground:(id)a3;
- (void)reportAppOpenEvent;
- (void)sendReaderEventNewSectionViaToC;
- (void)setAnalyticsHelper:(id)a3;
- (void)setEventController:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setupPersonalizationEventDonor:(id)a3;
- (void)setupSessionDonor;
@end

@implementation BKEngagementManager

- (BKEngagementManager)initWithConfiguration:(id)a3 configurationContainer:(id)a4
{
  return (BKEngagementManager *)EngagementManager.init(configuration:configurationContainer:)(a3, a4);
}

- (BKSessionDonor)sessionDonor
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_manager);
  v3 = self;
  id v4 = v2;
  uint64_t v5 = sub_1007F5930();

  if (v5)
  {
    type metadata accessor for SessionDonor();
    v6 = (void *)swift_dynamicCastClass();

    if (!v6) {
      swift_unknownObjectRelease();
    }
  }
  else
  {

    v6 = 0;
  }

  return (BKSessionDonor *)v6;
}

- (void)engagementEventDataForEventWithEventName:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_manager);
  v8 = self;
  id v9 = v7;
  sub_1007F5960();

  sub_1007F5800();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = sub_10007ACC0;
  *(void *)(v10 + 24) = v6;
  swift_retain();
  sub_1007F5670();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)reportAppOpenEvent
{
  v2 = self;
  EngagementManager.reportAppOpenEvent()();
}

- (void)setupSessionDonor
{
  v2 = self;
  EngagementManager.setupSessionDonor()();
}

- (BCEngagementEventController)eventController
{
  return (BCEngagementEventController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR___BKEngagementManager_eventController));
}

- (void)setEventController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_eventController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_eventController) = (Class)a3;
  id v3 = a3;
}

- (BKEngagementManagerMetadata)metadata
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_metadata);
  swift_beginAccess();
  return (BKEngagementManagerMetadata *)*v2;
}

- (void)setMetadata:(id)a3
{
  id v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_metadata);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *id v4 = a3;
  id v6 = a3;
}

- (BKEngagementManagerAnalyticsHelper)analyticsHelper
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_analyticsHelper);
  swift_beginAccess();
  return (BKEngagementManagerAnalyticsHelper *)*v2;
}

- (void)setAnalyticsHelper:(id)a3
{
  id v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_analyticsHelper);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *id v4 = a3;
  id v6 = a3;
}

+ (void)destroyPersistentStorageInDirectory:(id)a3
{
  uint64_t v3 = sub_1007F29D0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F2990();
  sub_1007F5980();
  sub_1007F58F0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)setupPersonalizationEventDonor:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  EngagementManager.setup(personalizationEventDonor:)(v5);
}

- (void)forceSyncFromCloudKit
{
  v2 = self;
  sub_100389B7C();
}

- (void)forceSyncToCloudKit
{
  v2 = self;
  EngagementManager.syncToCloudKit(completion:)((void (*)(uint64_t, uint64_t))BKAppDelegate.enableMetricsInspectorOnDebugMode(), 0);
}

- (void)onDidReceiveAppDidBackground:(id)a3
{
  uint64_t v4 = sub_1007F25F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F25C0();
  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_manager);
  id v9 = self;
  id v10 = v8;
  sub_1007F58B0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)onCloudUpdate:(id)a3
{
  uint64_t v4 = sub_1007F25F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F25C0();
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_cloudKitSyncEnabled) == 1)
  {
    v8 = self;
    sub_100389B7C();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)forcePurgeAll
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_manager);
  uint64_t v3 = self;
  id v4 = v2;
  sub_1007F5900();
}

- (id)donorWithType:(id)a3
{
  sub_1007FDC70();
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_manager);
  uint64_t v5 = self;
  id v6 = v4;
  uint64_t v7 = (void *)sub_1007F5930();

  swift_bridgeObjectRelease();

  return v7;
}

- (BKEngagementManager)init
{
  result = (BKEngagementManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager____lazy_storage___iso8601DateFormatter);
}

- (void)fetchDialogRequestsFor:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_1007FE240();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    uint64_t v5 = sub_10039BAB8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  _s5Books17EngagementManagerC19fetchDialogRequests3for10completionyShySSG_ySDySSSo16AMSDialogRequestCG_s5Error_pSgtcSgtF_0(v6, (uint64_t)v5, v7);
  sub_10003E138((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)downloadQueue:(id)a3 purchasedDidCompleteWithResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10039AE20(a4);
}

- (void)sendReaderEventNewSectionViaToC
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BKEngagementManager_eventController);
  uint64_t v3 = self;
  id v4 = v2;
  sub_1007FA440();
}

- (void)onConfigurationChange:(id)a3
{
  uint64_t v4 = sub_1007F25F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F25C0();
  v8 = self;
  sub_1003966A0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end