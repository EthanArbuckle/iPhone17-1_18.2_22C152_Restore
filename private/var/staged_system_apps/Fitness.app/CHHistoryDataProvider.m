@interface CHHistoryDataProvider
- (CHHistoryDataProvider)init;
- (CHHistoryDataProvider)initWithHealthStore:(id)a3;
- (CHWorkoutDataProvider)workoutDataProvider;
- (FIMindfulnessSessionDataProvider)mindfulnessSessionDataProvider;
- (void)setMindfulnessSessionDataProvider:(id)a3;
- (void)setWorkoutDataProvider:(id)a3;
@end

@implementation CHHistoryDataProvider

- (CHWorkoutDataProvider)workoutDataProvider
{
  return (CHWorkoutDataProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___CHHistoryDataProvider_workoutDataProvider));
}

- (void)setWorkoutDataProvider:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHHistoryDataProvider_workoutDataProvider);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHHistoryDataProvider_workoutDataProvider) = (Class)a3;
  id v3 = a3;
}

- (FIMindfulnessSessionDataProvider)mindfulnessSessionDataProvider
{
  return (FIMindfulnessSessionDataProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR___CHHistoryDataProvider_mindfulnessSessionDataProvider));
}

- (void)setMindfulnessSessionDataProvider:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHHistoryDataProvider_mindfulnessSessionDataProvider);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHHistoryDataProvider_mindfulnessSessionDataProvider) = (Class)a3;
  id v3 = a3;
}

- (CHHistoryDataProvider)initWithHealthStore:(id)a3
{
  return (CHHistoryDataProvider *)sub_10005D250(a3);
}

- (CHHistoryDataProvider)init
{
  result = (CHHistoryDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHHistoryDataProvider_queue);
}

@end