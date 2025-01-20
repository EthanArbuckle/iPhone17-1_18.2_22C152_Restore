@interface CHWorkoutDetailIntervalDataSource
- (CHWorkoutDetailIntervalDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 formattingManager:(id)a5;
- (CHWorkoutDetailIntervalDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 trackDistanceUnit:(unint64_t)a5 formattingManager:(id)a6;
@end

@implementation CHWorkoutDetailIntervalDataSource

- (CHWorkoutDetailIntervalDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 trackDistanceUnit:(unint64_t)a5 formattingManager:(id)a6
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___CHWorkoutDetailIntervalDataSource____lazy_storage___configuration) = (Class)1;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = (CHWorkoutDetailIntervalDataSource *)sub_100363784(v9, v10, a5, v11);

  return v12;
}

- (CHWorkoutDetailIntervalDataSource)initWithWorkout:(id)a3 dataCalculator:(id)a4 formattingManager:(id)a5
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___CHWorkoutDetailIntervalDataSource____lazy_storage___configuration) = (Class)1;
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (CHWorkoutDetailIntervalDataSource *)sub_100363C78(v7, v8, v9);

  return v10;
}

- (void).cxx_destruct
{
  sub_1002210E8(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR___CHWorkoutDetailIntervalDataSource____lazy_storage___configuration));
}

@end