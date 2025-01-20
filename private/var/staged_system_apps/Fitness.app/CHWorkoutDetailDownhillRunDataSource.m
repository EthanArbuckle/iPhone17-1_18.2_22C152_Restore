@interface CHWorkoutDetailDownhillRunDataSource
- (CHWorkoutDetailDownhillRunDataSource)init;
- (CHWorkoutDetailDownhillRunDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 formattingManager:(id)a5;
@end

@implementation CHWorkoutDetailDownhillRunDataSource

- (CHWorkoutDetailDownhillRunDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 formattingManager:(id)a5
{
  return (CHWorkoutDetailDownhillRunDataSource *)sub_100294AF8(a3, a4, a5);
}

- (CHWorkoutDetailDownhillRunDataSource)init
{
  result = (CHWorkoutDetailDownhillRunDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___CHWorkoutDetailDownhillRunDataSource__metrics;
  uint64_t v4 = sub_1000AFA94(&qword_100953A98);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end