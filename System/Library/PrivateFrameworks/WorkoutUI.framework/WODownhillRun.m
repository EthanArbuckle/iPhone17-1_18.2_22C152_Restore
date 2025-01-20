@interface WODownhillRun
+ (BOOL)supportsWithActivityType:(unint64_t)a3;
+ (NSArray)metadataKeys;
+ (double)calculateWorkoutTimeWithDateInterval:(id)a3 pauseResumeEvents:(id)a4;
+ (id)makeDownhillRunWithDownhillRunEvent:(id)a3 workout:(id)a4 healthStore:(id)a5;
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
- (WODownhillRun)init;
- (WODownhillRun)initWithDownhillRunEvent:(id)a3 workoutTime:(double)a4 distance:(id)a5 averageHeartRate:(id)a6;
- (double)workoutTime;
- (void)setAverageHeartRate:(id)a3;
- (void)setDistance:(id)a3;
- (void)setWorkoutTime:(double)a3;
@end

@implementation WODownhillRun

- (NSDate)startTime
{
  v2 = (void *)sub_261B8AD48();
  return (NSDate *)v2;
}

- (NSDate)endTime
{
  v2 = (void *)sub_261B8AD48();
  return (NSDate *)v2;
}

- (double)workoutTime
{
  v2 = (double *)((char *)self + OBJC_IVAR___WODownhillRun_workoutTime);
  swift_beginAccess();
  return *v2;
}

- (void)setWorkoutTime:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___WODownhillRun_workoutTime);
  swift_beginAccess();
  double *v4 = a3;
}

- (HKQuantity)averageSpeed
{
  return (HKQuantity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___WODownhillRun_averageSpeed));
}

- (HKQuantity)maximumSpeed
{
  return (HKQuantity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___WODownhillRun_maximumSpeed));
}

- (HKQuantity)alpineSlope
{
  return (HKQuantity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___WODownhillRun_alpineSlope));
}

- (HKQuantity)elevationAscended
{
  return (HKQuantity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___WODownhillRun_elevationAscended));
}

- (HKQuantity)elevationDescended
{
  return (HKQuantity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___WODownhillRun_elevationDescended));
}

- (HKQuantity)distance
{
  return (HKQuantity *)sub_261AA8820((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WODownhillRun_distance);
}

- (void)setDistance:(id)a3
{
}

- (HKQuantity)averageHeartRate
{
  return (HKQuantity *)sub_261AA8820((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WODownhillRun_averageHeartRate);
}

- (void)setAverageHeartRate:(id)a3
{
}

+ (NSArray)metadataKeys
{
  if (qword_26A942E88 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  v2 = (void *)sub_261B8F2C8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (WODownhillRun)initWithDownhillRunEvent:(id)a3 workoutTime:(double)a4 distance:(id)a5 averageHeartRate:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = (WODownhillRun *)sub_261AAAE6C(v9, a5, a6, a4);

  return v12;
}

+ (id)makeDownhillRunWithDownhillRunEvent:(id)a3 workout:(id)a4 healthStore:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = _s9WorkoutUI11DownhillRunC04makecD008downhillD5Event7workout11healthStoreACSo09HKWorkoutG0C_So0K0CSo08HKHealthJ0CtFZ_0(v7, v8, v9);

  return v10;
}

+ (double)calculateWorkoutTimeWithDateInterval:(id)a3 pauseResumeEvents:(id)a4
{
  uint64_t v5 = sub_261B8A858();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  id v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_261B8A808();
  if (a4)
  {
    sub_261A0CCCC(0, &qword_26A943798);
    a4 = (id)sub_261B8F2D8();
  }
  double v9 = _s9WorkoutUI11DownhillRunC09calculateA4Time12dateInterval17pauseResumeEventsSd10Foundation04DateH0V_SaySo14HKWorkoutEventCGSgtFZ_0((uint64_t)v8, a4);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v9;
}

+ (BOOL)supportsWithActivityType:(unint64_t)a3
{
  return a3 == 61 || a3 == 67;
}

- (WODownhillRun)init
{
  result = (WODownhillRun *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___WODownhillRun_startTime;
  uint64_t v4 = sub_261B8ADD8();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___WODownhillRun_endTime, v4);

  uint64_t v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___WODownhillRun_averageHeartRate);
}

- (NSString)description
{
  v2 = self;
  DownhillRun.description.getter();

  v3 = (void *)sub_261B8F0B8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end