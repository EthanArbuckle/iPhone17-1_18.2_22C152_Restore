@interface BCAppAnalyticsExtensionManager
- (BAAnalyticsController)analyticsController;
- (BCAppAnalyticsExtensionManager)init;
- (BCAppAnalyticsExtensionManager)initWithUploadsEnabled:(BOOL)a3;
- (BOOL)analyticsSessionDataIsMainWindow;
- (BOOL)analyticsSessionDataIsParallel;
- (BOOL)analyticsSessionDataIsPriceDropNotificationEnabled;
- (NSArray)additionalEventProcessors;
- (id)analyticsSessionDataForKey:(id)a3;
- (void)analyticsController:(BAAnalyticsController *)a3 resetSessionWithCompletion:(id)a4;
- (void)analyticsControllerDidStartSession:(id)a3;
- (void)appSessionDidTerminate;
- (void)endSession;
- (void)setAnalyticsController:(id)a3;
- (void)setupTrackingForRootViewController:(id)a3;
- (void)startSession;
- (void)waitForSessionEndWithTimeout:(double)a3;
@end

@implementation BCAppAnalyticsExtensionManager

- (BAAnalyticsController)analyticsController
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_analyticsController);
  swift_beginAccess();
  return (BAAnalyticsController *)*v2;
}

- (void)setAnalyticsController:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_analyticsController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (BCAppAnalyticsExtensionManager)initWithUploadsEnabled:(BOOL)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_assertion) = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_uploadsEnabled) = a3;
  id v5 = objc_allocWithZone((Class)sub_1F1360());
  id v6 = self;
  v7 = (objc_class *)[v5 init];
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_analyticsController) = v7;

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for AppAnalyticsExtensionManager();
  return [(BCAppAnalyticsExtensionManager *)&v9 init];
}

- (BCAppAnalyticsExtensionManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_assertion) = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_uploadsEnabled) = 1;
  id v3 = objc_allocWithZone((Class)sub_1F1360());
  v4 = self;
  id v5 = (objc_class *)[v3 init];
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_analyticsController) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AppAnalyticsExtensionManager();
  return [(BCAppAnalyticsExtensionManager *)&v7 init];
}

- (void)setupTrackingForRootViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1C4B24(v4);
}

- (void)startSession
{
  id v3 = (void **)((char *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_analyticsController);
  swift_beginAccess();
  id v4 = *v3;
  id v5 = self;
  id v6 = (objc_class *)[v4 newSessionAssertion];
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_assertion) = v6;
  swift_unknownObjectRelease();
  if (qword_342B60 != -1) {
    swift_once();
  }
  RCDataContainer.deployStagedDataIfNeeded()();
}

- (void)endSession
{
  uint64_t v3 = OBJC_IVAR___BCAppAnalyticsExtensionManager_assertion;
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_assertion);
  id v5 = self;
  if (v4) {
    [v4 invalidate];
  }
  *(Class *)((char *)&self->super.isa + v3) = 0;

  swift_unknownObjectRelease();
}

- (void)waitForSessionEndWithTimeout:(double)a3
{
  id v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_analyticsController);
  swift_beginAccess();
  id v5 = *v4;
  id v6 = self;
  id v7 = v5;
  sub_1F1320();
}

- (void)appSessionDidTerminate
{
  sub_1F13A0();
  uint64_t v3 = self;
  id v4 = (id)sub_1F1390();
  sub_1F1380();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectWeakDestroy();
}

- (void)analyticsControllerDidStartSession:(id)a3
{
  id v4 = a3;
  id v5 = self;
  _s8BookCore28AppAnalyticsExtensionManagerC15didStartSession4withy0aD00D10ControllerC_tF_0();
}

- (void)analyticsController:(BAAnalyticsController *)a3 resetSessionWithCompletion:(id)a4
{
  uint64_t v7 = sub_1911F8(&qword_344900);
  __chkstk_darwin(v7 - 8);
  objc_super v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1F2290();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_344748;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_344750;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1D2630((uint64_t)v9, (uint64_t)&unk_344920, (uint64_t)v14);
  swift_release();
}

- (id)analyticsSessionDataForKey:(id)a3
{
  id v4 = a3;
  id v5 = self;
  AppAnalyticsExtensionManager.analyticsSessionData(for:)((uint64_t)v13);

  uint64_t v6 = v14;
  if (v14)
  {
    uint64_t v7 = sub_1B1A74(v13, v14);
    uint64_t v8 = *(void *)(v6 - 8);
    __chkstk_darwin(v7);
    v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    v11 = (void *)sub_1F28A0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    sub_1B09C4((uint64_t)v13);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)analyticsSessionDataIsMainWindow
{
  return 1;
}

- (BOOL)analyticsSessionDataIsParallel
{
  return 0;
}

- (BOOL)analyticsSessionDataIsPriceDropNotificationEnabled
{
  return 0;
}

- (NSArray)additionalEventProcessors
{
  v2.super.isa = sub_1F2230().super.isa;

  return (NSArray *)v2.super.isa;
}

@end