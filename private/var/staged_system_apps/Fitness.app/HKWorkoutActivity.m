@interface HKWorkoutActivity
- (BOOL)hasChartableMetrics;
- (FIUIWorkoutActivityType)fiui_activityType;
- (HKQuantityType)distanceType;
- (double)elapsedTime;
- (double)fiui_averageCadence;
- (double)fiui_totalStepCount;
- (id)fiui_customSplits;
- (id)fiui_elevationGain;
- (id)fiui_splitsForUserPreferredDistanceUnit:(id)a3;
@end

@implementation HKWorkoutActivity

- (HKQuantityType)distanceType
{
  v2 = self;
  v3 = [(HKWorkoutActivity *)v2 workoutConfiguration];
  [(HKWorkoutConfiguration *)v3 activityType];

  id v4 = (id)_HKWorkoutDistanceTypeForActivityType();

  return (HKQuantityType *)v4;
}

- (double)elapsedTime
{
  v2 = self;
  double v3 = sub_1006CC05C();

  return v3;
}

- (BOOL)hasChartableMetrics
{
  v2 = self;
  double v3 = [(HKWorkoutActivity *)v2 fiui_activityType];
  id v4 = sub_100651C40();

  uint64_t v5 = v4[2];
  swift_bridgeObjectRelease();
  return v5 != 0;
}

- (FIUIWorkoutActivityType)fiui_activityType
{
  v2 = self;
  id v3 = sub_1006CC378();

  return (FIUIWorkoutActivityType *)v3;
}

- (double)fiui_averageCadence
{
  v2 = self;
  double v3 = sub_1006CCA98((uint64_t)&_HKPrivateMetadataKeyWorkoutAverageCadence, (SEL *)&selRef__countPerMinuteUnit);

  return v3;
}

- (id)fiui_customSplits
{
  v2 = self;
  Class isa = [(HKWorkoutActivity *)v2 workoutEvents];
  if (!isa)
  {
    sub_10007E2D8(0, (unint64_t *)&qword_10094BED8);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  id v4 = (id)FICustomSplits();

  sub_10007E2D8(0, (unint64_t *)&qword_10094BED8);
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  sub_1006CD07C(v5);
  swift_bridgeObjectRelease();
  sub_10007E2D8(0, &qword_100962BC8);
  v6.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)fiui_elevationGain
{
  v2 = self;
  double v3 = (void *)sub_1006CC684();

  return v3;
}

- (id)fiui_splitsForUserPreferredDistanceUnit:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_1006CC8FC(v4);

  sub_10007E2D8(0, &qword_100962BC8);
  v6.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (double)fiui_totalStepCount
{
  v2 = self;
  double v3 = sub_1006CCA98((uint64_t)&_HKPrivateMetadataKeyWorkoutStepCount, (SEL *)&selRef_countUnit);

  return v3;
}

@end