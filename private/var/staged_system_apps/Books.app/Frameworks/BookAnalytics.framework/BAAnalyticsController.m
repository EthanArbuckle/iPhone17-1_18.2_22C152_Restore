@interface BAAnalyticsController
- (BAAnalyticsController)init;
- (BAAnalyticsControllerConfigurationProvider)configurationProvider;
- (BAAnalyticsControllerDelegate)delegate;
- (BAUserConfiguration)userConfiguration;
- (BOOL)waitForSessionEnd:(double)a3;
- (NSDate)sessionStartTime;
- (_TtC13BookAnalytics9BATracker)applicationTracker;
- (id)contentPrivateIDForContentID:(id)a3;
- (id)contentUserIDForContentID:(id)a3;
- (id)newSessionAssertion;
- (id)newSessionExtendingAssertion;
- (void)appendUserExperience:(id)a3;
- (void)countingAssertProviderTransitionToNonZero:(id)a3;
- (void)countingAssertProviderTransitionToZero:(id)a3;
- (void)dealloc;
- (void)performAfterPrivateDataFetchedWithCompletionHandler:(id)a3;
- (void)privateDataChanged:(id)a3;
- (void)refreshSessionDataIfActive;
- (void)resetPrivateData:(id)a3;
- (void)setApplicationTracker:(id)a3;
- (void)setConfigurationProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLaunchedFromShortcutItem;
- (void)setReferralURL:(id)a3 app:(id)a4;
- (void)setTreatmentData:(id)a3;
- (void)setUserConfiguration:(id)a3;
- (void)start;
- (void)unsetLaunchedFromShortcutItem;
@end

@implementation BAAnalyticsController

- (_TtC13BookAnalytics9BATracker)applicationTracker
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_applicationTracker);
  swift_beginAccess();
  return (_TtC13BookAnalytics9BATracker *)*v2;
}

- (void)setApplicationTracker:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_applicationTracker);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (BAUserConfiguration)userConfiguration
{
  return (BAUserConfiguration *)sub_178D30();
}

- (void)setUserConfiguration:(id)a3
{
}

- (BAAnalyticsControllerDelegate)delegate
{
  return (BAAnalyticsControllerDelegate *)sub_178D30();
}

- (void)setDelegate:(id)a3
{
}

- (BAAnalyticsControllerConfigurationProvider)configurationProvider
{
  return (BAAnalyticsControllerConfigurationProvider *)sub_178D30();
}

- (void)setConfigurationProvider:(id)a3
{
}

- (NSDate)sessionStartTime
{
  uint64_t v3 = sub_4E04(&qword_320080);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_lockProtectedData);
  uint64_t v7 = v6 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v6 + 16);
  v8 = (os_unfair_lock_s *)(v6 + ((*(unsigned int *)(*(void *)v6 + 48) + 3) & 0x1FFFFFFFCLL));
  v9 = self;
  os_unfair_lock_lock(v8);
  sub_1791FC(v7, (uint64_t)v5);
  os_unfair_lock_unlock(v8);

  uint64_t v10 = sub_27D0A0();
  uint64_t v11 = *(void *)(v10 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1, v10) != 1)
  {
    Class isa = sub_27D030().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v5, v10);
  }

  return (NSDate *)isa;
}

- (BAAnalyticsController)init
{
  return (BAAnalyticsController *)AnalyticsController.init()();
}

- (void)dealloc
{
  if (*((unsigned char *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_privateDataQueueActive) == 1)
  {
    uint64_t v3 = self;
  }
  else
  {
    uint64_t v4 = *(NSObject **)((char *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_privateDataQueue);
    v5 = self;
    dispatch_resume(v4);
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AnalyticsController();
  [(BAAnalyticsController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  sub_187650((uint64_t)self + OBJC_IVAR___BAAnalyticsController_userConfiguration);
  sub_187650((uint64_t)self + OBJC_IVAR___BAAnalyticsController_delegate);
  sub_187650((uint64_t)self + OBJC_IVAR___BAAnalyticsController_configurationProvider);

  swift_release();
}

- (void)start
{
  v2 = self;
  sub_179CA8();
}

- (void)setReferralURL:(id)a3 app:(id)a4
{
  uint64_t v5 = sub_27CFF0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_27CFD0();
  uint64_t v9 = sub_27DDB0();
  unint64_t v11 = v10;
  v12 = self;
  sub_17ADFC((uint64_t)v8, v9, v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)setTreatmentData:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_17BB6C((uint64_t)a3);
}

- (void)appendUserExperience:(id)a3
{
  sub_27DDB0();
  uint64_t v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_lockProtectedData);
  uint64_t v5 = v4 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v4 + 16);
  uint64_t v6 = (os_unfair_lock_s *)(v4 + ((*(unsigned int *)(*(void *)v4 + 48) + 3) & 0x1FFFFFFFCLL));
  uint64_t v7 = self;
  os_unfair_lock_lock(v6);
  sub_188054(v5);
  os_unfair_lock_unlock(v6);
  sub_17D480();

  swift_bridgeObjectRelease();
}

- (void)setLaunchedFromShortcutItem
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_launchedFromShortcutItem) = 1;
}

- (void)unsetLaunchedFromShortcutItem
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_launchedFromShortcutItem) = 0;
}

- (void)resetPrivateData:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_18807C;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_17C384((uint64_t)v7, v6);
  sub_187640((uint64_t)v7);
}

- (BOOL)waitForSessionEnd:(double)a3
{
  uint64_t v4 = self;
  BOOL v5 = sub_17CF18(a3);

  return v5;
}

- (void)refreshSessionDataIfActive
{
  v2 = self;
  sub_17D480();
}

- (id)contentPrivateIDForContentID:(id)a3
{
  return sub_181C4C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))AnalyticsController.contentPrivateID(for:));
}

- (id)contentUserIDForContentID:(id)a3
{
  return sub_181C4C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))AnalyticsController.contentUserID(for:));
}

- (void)performAfterPrivateDataFetchedWithCompletionHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  AnalyticsController.performAfterPrivateDataFetched(completionHandler:)((uint64_t)sub_187638, v5);

  swift_release();
}

- (id)newSessionAssertion
{
  return sub_1820B0((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_newAssertion);
}

- (id)newSessionExtendingAssertion
{
  return sub_1820B0((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_newExtendingAssertion);
}

- (void)privateDataChanged:(id)a3
{
  uint64_t v4 = sub_27DD70();
  uint64_t v5 = self;
  AnalyticsController.privateDataChanged(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)countingAssertProviderTransitionToZero:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s13BookAnalytics0B10ControllerC32countingAssertProviderTransition6toZeroySo019BUCountingAssertionF0C_tF_0();
}

- (void)countingAssertProviderTransitionToNonZero:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s13BookAnalytics0B10ControllerC32countingAssertProviderTransition9toNonZeroySo019BUCountingAssertionF0C_tF_0();
}

@end