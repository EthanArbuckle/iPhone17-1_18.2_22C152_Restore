@interface CHWorkoutDetailMapAndWeatherTableViewCell
+ (double)preferredHeightForWorkout:(id)a3;
- (CHWorkoutDetailAnalyticsHandler)analyticsHandler;
- (CHWorkoutDetailMapAndWeatherTableViewCell)initWithCoder:(id)a3;
- (CHWorkoutDetailMapAndWeatherTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CHWorkoutDetailNavigationDelegate)navigationDelegate;
- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6 parent:(id)a7 locationReadings:(id)a8;
- (void)setAnalyticsHandler:(id)a3;
- (void)setNavigationDelegate:(id)a3;
@end

@implementation CHWorkoutDetailMapAndWeatherTableViewCell

- (CHWorkoutDetailNavigationDelegate)navigationDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (CHWorkoutDetailNavigationDelegate *)Strong;
}

- (void)setNavigationDelegate:(id)a3
{
}

- (CHWorkoutDetailAnalyticsHandler)analyticsHandler
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (CHWorkoutDetailAnalyticsHandler *)Strong;
}

- (void)setAnalyticsHandler:(id)a3
{
}

+ (double)preferredHeightForWorkout:(id)a3
{
  return 132.0;
}

- (CHWorkoutDetailMapAndWeatherTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (CHWorkoutDetailMapAndWeatherTableViewCell *)sub_10058B074(a3, (uint64_t)a4, v6);
}

- (CHWorkoutDetailMapAndWeatherTableViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___CHWorkoutDetailMapAndWeatherTableViewCell_mapAndWeatherViewModel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___CHWorkoutDetailMapAndWeatherTableViewCell_snapshotGenerator) = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (CHWorkoutDetailMapAndWeatherTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)configureWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6 parent:(id)a7 locationReadings:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = self;
  sub_10058BFDC(v14, (uint64_t)a4, v17, v19);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHWorkoutDetailMapAndWeatherTableViewCell_snapshotGenerator));
  sub_10019B9F8((uint64_t)self + OBJC_IVAR___CHWorkoutDetailMapAndWeatherTableViewCell_navigationDelegate);
  v3 = (char *)self + OBJC_IVAR___CHWorkoutDetailMapAndWeatherTableViewCell_analyticsHandler;

  sub_10019B9F8((uint64_t)v3);
}

@end