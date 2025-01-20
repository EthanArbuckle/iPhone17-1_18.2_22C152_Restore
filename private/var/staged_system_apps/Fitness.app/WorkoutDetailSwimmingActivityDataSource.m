@interface WorkoutDetailSwimmingActivityDataSource
- (WorkoutDetailSwimmingActivityDataSource)init;
- (WorkoutDetailSwimmingActivityDataSource)initWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6;
@end

@implementation WorkoutDetailSwimmingActivityDataSource

- (WorkoutDetailSwimmingActivityDataSource)initWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  return (WorkoutDetailSwimmingActivityDataSource *)sub_1002DF234(v9, a4, a5, a6);
}

- (WorkoutDetailSwimmingActivityDataSource)init
{
  result = (WorkoutDetailSwimmingActivityDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___WorkoutDetailSwimmingActivityDataSource__paceDistance;
  uint64_t v4 = sub_1000AFA94(&qword_10094BDC8);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end