@interface CHWorkoutDownhillRun
+ (BOOL)supportsActivityType:(unint64_t)a3;
- (CHWorkoutDownhillRun)init;
- (CHWorkoutDownhillRun)initWithDownhillRun:(id)a3;
- (HKQuantity)alpineSlope;
- (HKQuantity)averageHeartRate;
- (HKQuantity)averageSpeed;
- (HKQuantity)distance;
- (HKQuantity)elevationAscended;
- (HKQuantity)elevationDescended;
- (HKQuantity)maximumSpeed;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSString)description;
- (WODownhillRun)downhillRun;
- (double)workoutTime;
@end

@implementation CHWorkoutDownhillRun

- (WODownhillRun)downhillRun
{
  return (WODownhillRun *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR___CHWorkoutDownhillRun_downhillRun));
}

- (NSDate)startTime
{
  return (NSDate *)sub_10056E9AC(self, (uint64_t)a2, (void (*)(void))&DownhillRun.startTime.getter);
}

- (NSDate)endTime
{
  return (NSDate *)sub_10056E9AC(self, (uint64_t)a2, (void (*)(void))&DownhillRun.endTime.getter);
}

- (double)workoutTime
{
  v2 = self;
  dispatch thunk of DownhillRun.workoutTime.getter();
  double v4 = v3;

  return v4;
}

- (HKQuantity)averageSpeed
{
  v2 = self;
  double v3 = (void *)DownhillRun.averageSpeed.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)maximumSpeed
{
  v2 = self;
  double v3 = (void *)DownhillRun.maximumSpeed.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)alpineSlope
{
  v2 = self;
  double v3 = (void *)DownhillRun.alpineSlope.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)elevationAscended
{
  v2 = self;
  double v3 = (void *)DownhillRun.elevationAscended.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)elevationDescended
{
  v2 = self;
  double v3 = (void *)DownhillRun.elevationDescended.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)distance
{
  v2 = self;
  double v3 = (void *)dispatch thunk of DownhillRun.distance.getter();

  return (HKQuantity *)v3;
}

- (HKQuantity)averageHeartRate
{
  v2 = self;
  double v3 = (void *)dispatch thunk of DownhillRun.averageHeartRate.getter();

  return (HKQuantity *)v3;
}

- (CHWorkoutDownhillRun)initWithDownhillRun:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutDownhillRun_downhillRun) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DownhillRunBridge();
  id v4 = a3;
  return [(CHWorkoutDownhillRun *)&v6 init];
}

- (NSString)description
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHWorkoutDownhillRun_downhillRun);
  double v3 = self;
  id v4 = [v2 description];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

+ (BOOL)supportsActivityType:(unint64_t)a3
{
  return static DownhillRun.supports(activityType:)() & 1;
}

- (CHWorkoutDownhillRun)init
{
  result = (CHWorkoutDownhillRun *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end