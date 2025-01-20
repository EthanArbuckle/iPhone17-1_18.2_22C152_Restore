@interface CHWorkoutDetailTrackLapDataSource
- (CHWorkoutDetailTrackLapDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 formattingManager:(id)a5;
- (CHWorkoutDetailTrackLapDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 trackDistanceUnit:(unint64_t)a5 formattingManager:(id)a6;
- (unint64_t)distanceUnit;
- (void)setDistanceUnit:(unint64_t)a3;
@end

@implementation CHWorkoutDetailTrackLapDataSource

- (unint64_t)distanceUnit
{
  return *(unint64_t *)((char *)&self->super.super.isa
                             + OBJC_IVAR___CHWorkoutDetailTrackLapDataSource_distanceUnit);
}

- (void)setDistanceUnit:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CHWorkoutDetailTrackLapDataSource_distanceUnit) = (Class)a3;
}

- (CHWorkoutDetailTrackLapDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 trackDistanceUnit:(unint64_t)a5 formattingManager:(id)a6
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CHWorkoutDetailTrackLapDataSource_distanceUnit) = (Class)1;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = (CHWorkoutDetailTrackLapDataSource *)sub_100363784(v9, v10, a5, v11);

  return v12;
}

- (CHWorkoutDetailTrackLapDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 formattingManager:(id)a5
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___CHWorkoutDetailTrackLapDataSource_distanceUnit) = (Class)1;
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (CHWorkoutDetailTrackLapDataSource *)sub_100363C78(v7, v8, v9);

  return v10;
}

@end