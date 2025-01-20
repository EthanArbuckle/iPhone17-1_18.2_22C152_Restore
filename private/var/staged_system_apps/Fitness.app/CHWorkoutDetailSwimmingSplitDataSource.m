@interface CHWorkoutDetailSwimmingSplitDataSource
- (CHWorkoutDetailSwimmingSplitDataSource)initWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6;
@end

@implementation CHWorkoutDetailSwimmingSplitDataSource

- (CHWorkoutDetailSwimmingSplitDataSource)initWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  return (CHWorkoutDetailSwimmingSplitDataSource *)sub_1005675D8(v9, a4, a5, a6);
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___CHWorkoutDetailSwimmingSplitDataSource__metrics;
  uint64_t v3 = sub_1000AFA94(&qword_100962400);
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end