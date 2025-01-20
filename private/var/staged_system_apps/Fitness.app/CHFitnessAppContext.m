@interface CHFitnessAppContext
- (AMSBagProtocol)amsBag;
- (BOOL)isSessionViewControllerPresented;
- (CHCloudDeviceProvider)cloudDeviceProvider;
- (CHFitnessAppBadgeAggregator)appBadgeAggregator;
- (CHFitnessAppContext)init;
- (CHFitnessAppContext)initWithHealthStore:(id)a3 seymourAvailabilityManager:(id)a4 wheelchairUseCache:(id)a5 formattingManager:(id)a6 pregnancyStateProvider:(id)a7;
- (CHFitnessNavigationDelegate)navigationDelegate;
- (_TtC10FitnessApp26SeymourAvailabilityManager)seymourAvailabilityManager;
- (_TtC10FitnessApp30SeymourCatalogItemDataProvider)seymourCatalogItemDataProvider;
- (id)seymourNavigationController;
- (void)continueUserActivity:(id)a3;
- (void)flushMetricEvents;
- (void)handleWindowScene:(id)a3 with:(id)a4;
- (void)navigateToWorkout:(id)a3;
- (void)navigateToWorkoutPlanCreation;
- (void)navigateToWorkoutPlanDetail;
- (void)openURLContext:(id)a3;
- (void)setAppBadgeAggregator:(id)a3;
- (void)setNavigationDelegate:(id)a3;
- (void)seymourAppWillResignActive;
- (void)seymourAppWillTerminate;
- (void)seymourTabDeselected;
- (void)seymourTabSelectedWithSelection:(int64_t)a3;
- (void)shareSheetActivityItemsWithWorkout:(id)a3 completion:(id)a4;
@end

@implementation CHFitnessAppContext

- (CHFitnessAppContext)initWithHealthStore:(id)a3 seymourAvailabilityManager:(id)a4 wheelchairUseCache:(id)a5 formattingManager:(id)a6 pregnancyStateProvider:(id)a7
{
  return (CHFitnessAppContext *)sub_100064858(a3, a4, a5, a6, a7);
}

- (id)seymourNavigationController
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHFitnessAppContext_browsingCoordinator);
  uint64_t v2 = *(void *)&self->accountFitnessSettingsProvider[OBJC_IVAR___CHFitnessAppContext_browsingCoordinator];
  if (v2 < 0)
  {
    v5 = self;
    sub_1000CEE44(v3, v2);
    id v4 = (id)AppCoordinator.rootViewController.getter();
    sub_1000656A0(v3, v2);
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

- (void)handleWindowScene:(id)a3 with:(id)a4
{
  uint64_t v7 = sub_1000AFA94(&qword_10094B7A0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = a4;
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  id v15 = v12;
  id v16 = v13;
  sub_10005810C((uint64_t)v9, (uint64_t)&unk_100966930, (uint64_t)v11);

  swift_release();
}

- (_TtC10FitnessApp30SeymourCatalogItemDataProvider)seymourCatalogItemDataProvider
{
  return (_TtC10FitnessApp30SeymourCatalogItemDataProvider *)*(id *)((char *)&self->super.isa + OBJC_IVAR___CHFitnessAppContext_seymourCatalogItemDataProvider);
}

- (void)setNavigationDelegate:(id)a3
{
}

- (void)setAppBadgeAggregator:(id)a3
{
}

- (void)navigateToWorkout:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1006ABC3C(v4, (uint64_t)v5);
}

- (CHCloudDeviceProvider)cloudDeviceProvider
{
  return (CHCloudDeviceProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___CHFitnessAppContext_cloudDeviceProvider));
}

- (CHFitnessNavigationDelegate)navigationDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (CHFitnessNavigationDelegate *)Strong;
}

- (CHFitnessAppBadgeAggregator)appBadgeAggregator
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (CHFitnessAppBadgeAggregator *)Strong;
}

- (AMSBagProtocol)amsBag
{
  uint64_t v2 = (void *)swift_unknownObjectRetain();

  return (AMSBagProtocol *)v2;
}

- (_TtC10FitnessApp26SeymourAvailabilityManager)seymourAvailabilityManager
{
  return (_TtC10FitnessApp26SeymourAvailabilityManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                 + OBJC_IVAR___CHFitnessAppContext_seymourAvailabilityManager));
}

- (void)flushMetricEvents
{
  uint64_t v3 = sub_1000AFA94((uint64_t *)&unk_1009633D0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10007E4EC((Class *)((char *)&self->super.isa + OBJC_IVAR___CHFitnessAppContext_metricClient), *(void *)&self->bookmarkClient[OBJC_IVAR___CHFitnessAppContext_metricClient]);
  uint64_t v7 = self;
  dispatch thunk of MetricClientProtocol.flushMetrics()();
  uint64_t v8 = (void (*)(uint64_t (*)(), uint64_t))Promise.operation.getter();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = 0;
  *(void *)(v9 + 24) = 0;
  v8(sub_10006D36C, v9);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)continueUserActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100648564(v4);
}

- (void)openURLContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10064897C(v4);
}

- (void)navigateToWorkoutPlanCreation
{
  uint64_t v2 = self;
  sub_10064BD6C();
}

- (void)navigateToWorkoutPlanDetail
{
  uint64_t v2 = self;
  sub_10064C69C();
}

- (void)seymourTabSelectedWithSelection:(int64_t)a3
{
  id v4 = self;
  sub_10064EE84(a3);
}

- (void)seymourTabDeselected
{
  uint64_t v2 = self;
  sub_10064FC18();
}

- (void)seymourAppWillResignActive
{
}

- (void)seymourAppWillTerminate
{
}

- (void)shareSheetActivityItemsWithWorkout:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_10064FF54((uint64_t)v8, (uint64_t)sub_1006513DC, v7);

  swift_release();
}

- (BOOL)isSessionViewControllerPresented
{
  uint64_t v2 = self;
  BOOL v3 = sub_100650530();

  return v3;
}

- (CHFitnessAppContext)init
{
  result = (CHFitnessAppContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR___CHFitnessAppContext_completedWorkoutItemProvider;
  uint64_t v4 = type metadata accessor for CompletedWorkoutShareItemProvider();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR___CHFitnessAppContext_bookmarkClient);
  sub_1000656A0(*(void **)((char *)&self->super.isa + OBJC_IVAR___CHFitnessAppContext_browsingCoordinator), *(void *)&self->accountFitnessSettingsProvider[OBJC_IVAR___CHFitnessAppContext_browsingCoordinator]);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR___CHFitnessAppContext_catalogClient);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR___CHFitnessAppContext_metricClient);
  swift_release();
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR___CHFitnessAppContext_siriUserActivityHandler);
  swift_release();
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR___CHFitnessAppContext_contentAvailabilityClient);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR___CHFitnessAppContext_engagementClient);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR___CHFitnessAppContext_privacyPreferenceClient);
  uint64_t v5 = (char *)self + OBJC_IVAR___CHFitnessAppContext_activitySharingSettings;
  uint64_t v6 = type metadata accessor for ActivitySharingSettings();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  sub_10019B9F8((uint64_t)self + OBJC_IVAR___CHFitnessAppContext_navigationDelegate);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end