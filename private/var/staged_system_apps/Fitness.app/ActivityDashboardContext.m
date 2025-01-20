@interface ActivityDashboardContext
- (CHAwardsDataProvider)chAwardsDataProvider;
- (_TtC10FitnessApp24ActivityDashboardContext)init;
- (_TtC10FitnessApp24ActivityDashboardContext)initWithActivityDataProvider:(id)a3 activityDateCache:(id)a4 achievementsDataProvider:(id)a5 balanceDataProvider:(id)a6 pauseRingsCoordinator:(id)a7 historyDataProvider:(id)a8 workoutFormattingManager:(id)a9 workoutDataProvider:(id)a10 friendListManager:(id)a11 friendsSetupCoordinator:(id)a12 chFriendManager:(id)a13 achievementLocalizationProvider:(id)a14 badgeImageFactory:(id)a15 healthStore:(id)a16 fiuiFormattingManager:(id)a17 fitnessAppContext:(id)a18 wheelchairUseCache:(id)a19 trendsAvailabilityManager:(id)a20;
@end

@implementation ActivityDashboardContext

- (_TtC10FitnessApp24ActivityDashboardContext)initWithActivityDataProvider:(id)a3 activityDateCache:(id)a4 achievementsDataProvider:(id)a5 balanceDataProvider:(id)a6 pauseRingsCoordinator:(id)a7 historyDataProvider:(id)a8 workoutFormattingManager:(id)a9 workoutDataProvider:(id)a10 friendListManager:(id)a11 friendsSetupCoordinator:(id)a12 chFriendManager:(id)a13 achievementLocalizationProvider:(id)a14 badgeImageFactory:(id)a15 healthStore:(id)a16 fiuiFormattingManager:(id)a17 fitnessAppContext:(id)a18 wheelchairUseCache:(id)a19 trendsAvailabilityManager:(id)a20
{
  return (_TtC10FitnessApp24ActivityDashboardContext *)sub_10006EA90(a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, (char *)a15, (char *)a16, a17, a18, (char *)a19, a20);
}

- (CHAwardsDataProvider)chAwardsDataProvider
{
  return (CHAwardsDataProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_chAwardsDataProvider));
}

- (_TtC10FitnessApp24ActivityDashboardContext)init
{
  result = (_TtC10FitnessApp24ActivityDashboardContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_configurationProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_activityDataProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_activityDateCache));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_pauseRingsCoordinator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_friendListManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_friendsSetupCoordinator));

  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_balanceDataProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_achievementLocalizationProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_achievementResourceProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_achievementsDataProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_awardsDataProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_badgeImageFactory));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_chAwardsDataProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_fitnessPlusCardDataProvider));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_historyDataProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_workoutFormattingManager));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_workoutDataProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_stackFormattingManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_mindfulnessSessionDataProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_mindfulnessSessionFormattingManager));
  swift_release();
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_avatarSettingsProvider);
  swift_unknownObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_fiuiFormattingManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_fitnessAppContext));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_wheelchairUseCache));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_metricsDataProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_trendsDataProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_trendsAvailabilityManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_trendsFormattingManager));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10FitnessApp24ActivityDashboardContext_summaryUserProfileProvider);
}

@end