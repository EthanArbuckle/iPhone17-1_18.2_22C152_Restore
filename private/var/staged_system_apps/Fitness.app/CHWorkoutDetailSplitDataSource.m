@interface CHWorkoutDetailSplitDataSource
- (CHWorkoutDetailSplitDataSource)init;
- (CHWorkoutDetailSplitDataSource)initWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6;
@end

@implementation CHWorkoutDetailSplitDataSource

- (CHWorkoutDetailSplitDataSource)initWithWorkout:(id)a3 workoutActivity:(id)a4 dataCalculator:(id)a5 formattingManager:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  return (CHWorkoutDetailSplitDataSource *)sub_1005A40FC(v9, a4, a5, a6);
}

- (CHWorkoutDetailSplitDataSource)init
{
  result = (CHWorkoutDetailSplitDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___CHWorkoutDetailSplitDataSource__metrics;
  uint64_t v4 = sub_1000AFA94(&qword_100962400);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___CHWorkoutDetailSplitDataSource__columns;
  uint64_t v6 = sub_1000AFA94(&qword_100958970);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end