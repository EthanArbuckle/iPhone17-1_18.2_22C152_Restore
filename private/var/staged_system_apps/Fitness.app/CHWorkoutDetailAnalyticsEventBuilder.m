@interface CHWorkoutDetailAnalyticsEventBuilder
- (CHWorkoutDetailAnalyticsEventBuilder)init;
- (CHWorkoutDetailAnalyticsEventBuilder)initWithWorkout:(id)a3 workoutActivity:(id)a4;
- (NSDictionary)analyticsPayload;
- (NSString)analyticsEventName;
- (void)didEndMirroredWorkoutWith:(double)a3;
- (void)didExpandDetailSection:(int64_t)a3;
- (void)didPresentHeartRateNoDataInfo;
- (void)didPresentMediaMomentItem;
- (void)didPresentRouteView;
@end

@implementation CHWorkoutDetailAnalyticsEventBuilder

- (CHWorkoutDetailAnalyticsEventBuilder)initWithWorkout:(id)a3 workoutActivity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (CHWorkoutDetailAnalyticsEventBuilder *)sub_10046160C((uint64_t)v5, a4);

  return v7;
}

- (NSString)analyticsEventName
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (NSDictionary)analyticsPayload
{
  NSString v2 = self;
  uint64_t v3 = sub_100460E84();

  if (v3)
  {
    sub_1000A88A4();
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSDictionary *)v4.super.isa;
}

- (CHWorkoutDetailAnalyticsEventBuilder)init
{
  result = (CHWorkoutDetailAnalyticsEventBuilder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)didExpandDetailSection:(int64_t)a3
{
  sub_10045CE48();
  Swift::Int v5 = v4;
  Swift::Int v7 = v6;
  swift_beginAccess();
  v8 = self;
  sub_1001E9330(&v9, v5, v7);
  swift_endAccess();

  swift_bridgeObjectRelease();
}

- (void)didPresentRouteView
{
}

- (void)didPresentMediaMomentItem
{
}

- (void)didPresentHeartRateNoDataInfo
{
}

- (void)didEndMirroredWorkoutWith:(double)a3
{
  v5[3] = &type metadata for Double;
  *(double *)Swift::Int v5 = a3;
  swift_beginAccess();
  Swift::Int v4 = self;
  sub_1005CE920((uint64_t)v5, 0xD000000000000018, 0x80000001007C9500);
  swift_endAccess();
}

@end