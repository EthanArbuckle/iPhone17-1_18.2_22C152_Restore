@interface AchievementEnvironment
- (BOOL)isSessionCompletingPlan;
- (BOOL)isSessionCompletingProgram;
- (BOOL)isSessionGuided;
- (BOOL)isSessionParticipatingInPlan;
- (NSString)modalityIdentifier;
- (_TtC15SeymourServices22AchievementEnvironment)init;
- (double)bestEnergyBurnedOfWorkoutModality;
- (double)sessionDuration;
- (double)sessionEnergyBurned;
- (id)numberOfGuidedWorkoutsOver5MinutesForModality:(id)a3;
- (id)numberOfWorkoutsOver5MinutesForModality:(id)a3;
- (int64_t)currentPlanCompletedNumberOfWorkouts;
- (int64_t)currentPlanTotalNumberOfWorkouts;
- (int64_t)currentWeeklyStreak;
- (int64_t)longestWeeklyStreak;
- (int64_t)numberOfWorkoutsOver5Minutes;
@end

@implementation AchievementEnvironment

- (double)sessionDuration
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_sessionDuration);
}

- (double)bestEnergyBurnedOfWorkoutModality
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_bestEnergyBurnedOfWorkoutModality);
}

- (int64_t)currentPlanCompletedNumberOfWorkouts
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_currentPlanCompletedNumberOfWorkouts);
}

- (int64_t)currentPlanTotalNumberOfWorkouts
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_currentPlanTotalNumberOfWorkouts);
}

- (int64_t)currentWeeklyStreak
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_currentWeeklyStreak);
}

- (BOOL)isSessionCompletingPlan
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_isSessionCompletingPlan);
}

- (BOOL)isSessionCompletingProgram
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_isSessionCompletingProgram);
}

- (BOOL)isSessionGuided
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_isSessionGuided);
}

- (BOOL)isSessionParticipatingInPlan
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_isSessionParticipatingInPlan);
}

- (int64_t)longestWeeklyStreak
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_longestWeeklyStreak);
}

- (NSString)modalityIdentifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D6FA98B0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (int64_t)numberOfWorkoutsOver5Minutes
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_numberOfWorkoutsOver5Minutes);
}

- (double)sessionEnergyBurned
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_sessionEnergyBurned);
}

- (id)numberOfWorkoutsOver5MinutesForModality:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1D68957E8((uint64_t)v4);

  return v6;
}

- (id)numberOfGuidedWorkoutsOver5MinutesForModality:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1D6895854((uint64_t)v4);

  return v6;
}

- (_TtC15SeymourServices22AchievementEnvironment)init
{
  result = (_TtC15SeymourServices22AchievementEnvironment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1D68017CC((uint64_t)self + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_planCompletionDate);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC15SeymourServices22AchievementEnvironment_sessionStartDate;
  uint64_t v4 = sub_1D6FA05A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end