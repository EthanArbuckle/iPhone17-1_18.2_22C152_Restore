@interface AchievementProgressEnvironment
- (BOOL)isSessionCompletingProgram;
- (BOOL)isSessionGuided;
- (NSString)modalityIdentifier;
- (_TtC13SeymourClient30AchievementProgressEnvironment)init;
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

@implementation AchievementProgressEnvironment

- (double)bestEnergyBurnedOfWorkoutModality
{
  return 0.0;
}

- (BOOL)isSessionGuided
{
  return 0;
}

- (BOOL)isSessionCompletingProgram
{
  return 0;
}

- (NSString)modalityIdentifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D5AB4DE0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)sessionDuration
{
  return 0.0;
}

- (double)sessionEnergyBurned
{
  return 0.0;
}

- (int64_t)currentPlanCompletedNumberOfWorkouts
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13SeymourClient30AchievementProgressEnvironment_currentPlanCompletedNumberOfWorkouts);
}

- (int64_t)currentPlanTotalNumberOfWorkouts
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13SeymourClient30AchievementProgressEnvironment_currentPlanTotalNumberOfWorkouts);
}

- (int64_t)currentWeeklyStreak
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13SeymourClient30AchievementProgressEnvironment_currentWeeklyStreak);
}

- (int64_t)longestWeeklyStreak
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13SeymourClient30AchievementProgressEnvironment_longestWeeklyStreak);
}

- (int64_t)numberOfWorkoutsOver5Minutes
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13SeymourClient30AchievementProgressEnvironment_numberOfWorkoutsOver5Minutes);
}

- (id)numberOfGuidedWorkoutsOver5MinutesForModality:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1D5A91EDC((uint64_t)v4);

  return v6;
}

- (id)numberOfWorkoutsOver5MinutesForModality:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1D5A91F48((uint64_t)v4);

  return v6;
}

- (_TtC13SeymourClient30AchievementProgressEnvironment)init
{
  result = (_TtC13SeymourClient30AchievementProgressEnvironment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end