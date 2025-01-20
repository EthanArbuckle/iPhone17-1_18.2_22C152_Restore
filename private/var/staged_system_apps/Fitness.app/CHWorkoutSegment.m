@interface CHWorkoutSegment
+ (id)_decimalNumberFormatter;
- (HKQuantity)activeEnergy;
- (HKQuantity)distance;
- (NSDate)endDate;
- (NSDate)startDate;
- (double)distanceGoalAchievedTime;
- (double)elapsedTime;
- (id)description;
- (id)formattedActiveEnergyValueForUnit:(id)a3;
- (id)formattedDistanceAchievedDurationValueWithFormattingManager:(id)a3;
- (id)formattedDistanceValueForUnit:(id)a3;
- (id)formattedDurationValueWithFormattingManager:(id)a3;
- (id)formattedPaceUsingFormatType:(int64_t)a3 formattingManager:(id)a4 distanceType:(unint64_t)a5;
- (void)setActiveEnergy:(id)a3;
- (void)setDistance:(id)a3;
- (void)setDistanceGoalAchievedTime:(double)a3;
- (void)setElapsedTime:(double)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation CHWorkoutSegment

- (id)formattedDurationValueWithFormattingManager:(id)a3
{
  id v4 = a3;
  [(CHWorkoutSegment *)self elapsedTime];
  if (round(v5) >= 3600.0) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 3;
  }
  v7 = [v4 stringWithDuration:v6];

  return v7;
}

- (id)formattedActiveEnergyValueForUnit:(id)a3
{
  id v4 = a3;
  double v5 = [(CHWorkoutSegment *)self activeEnergy];
  [v5 doubleValueForUnit:v4];
  double v7 = v6;

  v8 = +[NSNumber numberWithDouble:v7];
  v9 = +[FIUIFormattingManager stringWithNumber:v8 decimalPrecision:1];

  return v9;
}

+ (id)_decimalNumberFormatter
{
  if (qword_10096B688[0] != -1) {
    dispatch_once(qword_10096B688, &stru_1008AE4F8);
  }
  v2 = (void *)qword_10096B680;

  return v2;
}

- (id)formattedDistanceValueForUnit:(id)a3
{
  id v4 = a3;
  double v5 = [(CHWorkoutSegment *)self distance];
  [v5 doubleValueForUnit:v4];
  double v7 = v6;

  v8 = [(id)objc_opt_class() _decimalNumberFormatter];
  v9 = +[NSNumber numberWithDouble:v7];
  v10 = [v8 stringFromNumber:v9];

  return v10;
}

- (id)formattedPaceUsingFormatType:(int64_t)a3 formattingManager:(id)a4 distanceType:(unint64_t)a5
{
  id v8 = a4;
  [(CHWorkoutSegment *)self distanceGoalAchievedTime];
  if (v9 <= 0.0) {
    [(CHWorkoutSegment *)self elapsedTime];
  }
  else {
    [(CHWorkoutSegment *)self distanceGoalAchievedTime];
  }
  double v11 = v10;
  if (fabs(v10) < 2.22044605e-16)
  {
    v12 = [(CHWorkoutSegment *)self endDate];
    v13 = [(CHWorkoutSegment *)self startDate];
    [v12 timeIntervalSinceDate:v13];
    double v11 = v14;
  }
  v15 = [(CHWorkoutSegment *)self distance];
  v16 = [v8 localizedPaceStringWithDistance:v15 overDuration:a3 paceFormat:a5 distanceType:v11];

  return v16;
}

- (id)formattedDistanceAchievedDurationValueWithFormattingManager:(id)a3
{
  id v4 = a3;
  [(CHWorkoutSegment *)self distanceGoalAchievedTime];
  if (v5 <= 0.0)
  {
    double v7 = 0;
  }
  else
  {
    [(CHWorkoutSegment *)self distanceGoalAchievedTime];
    double v7 = [v4 stringWithDuration:3 durationFormat:round(v6)];
  }

  return v7;
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)CHWorkoutSegment;
  v3 = [(CHWorkoutSegment *)&v12 description];
  [(CHWorkoutSegment *)self elapsedTime];
  double v5 = +[NSNumber numberWithDouble:v4 / 60.0];
  double v6 = +[HKUnit kilocalorieUnit];
  double v7 = [(CHWorkoutSegment *)self formattedActiveEnergyValueForUnit:v6];
  id v8 = +[HKUnit mileUnit];
  double v9 = [(CHWorkoutSegment *)self formattedDistanceValueForUnit:v8];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Duration: %@ min; Energy: %@ Cal; Distance: %@ mi",
    v3,
    v5,
    v7,
  double v10 = v9);

  return v10;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (HKQuantity)activeEnergy
{
  return self->_activeEnergy;
}

- (void)setActiveEnergy:(id)a3
{
}

- (HKQuantity)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (double)distanceGoalAchievedTime
{
  return self->_distanceGoalAchievedTime;
}

- (void)setDistanceGoalAchievedTime:(double)a3
{
  self->_distanceGoalAchievedTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_activeEnergy, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end