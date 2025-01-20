@interface CHWorkoutDetailSegmentDataSource
- (CHWorkoutDetailSegmentDataSource)init;
- (CHWorkoutDetailSegmentDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 formattingManager:(id)a5;
- (CHWorkoutDetailSegmentDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 trackDistanceUnit:(unint64_t)a5 formattingManager:(id)a6;
@end

@implementation CHWorkoutDetailSegmentDataSource

- (CHWorkoutDetailSegmentDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 trackDistanceUnit:(unint64_t)a5 formattingManager:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = (CHWorkoutDetailSegmentDataSource *)sub_100363784(v9, v10, a5, v11);

  return v12;
}

- (CHWorkoutDetailSegmentDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 formattingManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (CHWorkoutDetailSegmentDataSource *)sub_100363C78(v7, v8, v9);

  return v10;
}

- (CHWorkoutDetailSegmentDataSource)init
{
  result = (CHWorkoutDetailSegmentDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___CHWorkoutDetailSegmentDataSource__metrics;
  uint64_t v4 = sub_1000AFA94(&qword_100953A98);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___CHWorkoutDetailSegmentDataSource__columns;
  uint64_t v6 = sub_1000AFA94(&qword_100958970);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end