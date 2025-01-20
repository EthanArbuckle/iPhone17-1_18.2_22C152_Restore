@interface CHWorkoutSwimmingSet
+ (id)_decimalNumberFormatter;
- (HKQuantity)distance;
- (NSDate)endDate;
- (NSDate)movementEndDate;
- (NSDate)startDate;
- (double)_activeDuration;
- (double)_restingDuration;
- (id)description;
- (id)formattedActiveDurationWithFormattingManager:(id)a3;
- (id)formattedDistanceValueWithFormattingManager:(id)a3;
- (id)formattedDominantStrokeStyle;
- (id)formattedPaceUsingFormatType:(int64_t)a3 formattingManager:(id)a4;
- (id)formattedRestDurationWithFormattingManager:(id)a3;
- (id)formattedStrokeCountUsingFormatType:(int64_t)a3 formattingManager:(id)a4;
- (int64_t)dominantStrokeStyle;
- (int64_t)strokeCount;
- (int64_t)swolfScore;
- (void)setDistance:(id)a3;
- (void)setDominantStrokeStyle:(int64_t)a3;
- (void)setEndDate:(id)a3;
- (void)setMovementEndDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStrokeCount:(int64_t)a3;
- (void)setSwolfScore:(int64_t)a3;
@end

@implementation CHWorkoutSwimmingSet

- (double)_activeDuration
{
  v3 = [(CHWorkoutSwimmingSet *)self movementEndDate];
  v4 = [(CHWorkoutSwimmingSet *)self startDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (double)_restingDuration
{
  v3 = [(CHWorkoutSwimmingSet *)self endDate];
  v4 = [(CHWorkoutSwimmingSet *)self movementEndDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (id)formattedActiveDurationWithFormattingManager:(id)a3
{
  id v4 = a3;
  [(CHWorkoutSwimmingSet *)self _activeDuration];
  double v5 = [v4 stringWithDuration:3];

  return v5;
}

- (id)formattedRestDurationWithFormattingManager:(id)a3
{
  id v4 = a3;
  [(CHWorkoutSwimmingSet *)self _restingDuration];
  double v5 = [v4 stringWithDuration:3];

  return v5;
}

+ (id)_decimalNumberFormatter
{
  if (qword_10096B5D8 != -1) {
    dispatch_once(&qword_10096B5D8, &stru_1008ADDC8);
  }
  v2 = (void *)qword_10096B5D0;

  return v2;
}

- (id)formattedDistanceValueWithFormattingManager:(id)a3
{
  id v4 = a3;
  double v5 = [(CHWorkoutSwimmingSet *)self distance];
  double v6 = +[HKUnit meterUnit];
  [v5 doubleValueForUnit:v6];
  v7 = [v4 localizedStringWithDistanceInMeters:3 distanceType:1 unitStyle:];

  return v7;
}

- (id)formattedPaceUsingFormatType:(int64_t)a3 formattingManager:(id)a4
{
  id v6 = a4;
  [(CHWorkoutSwimmingSet *)self _activeDuration];
  double v8 = v7;
  v9 = [(CHWorkoutSwimmingSet *)self distance];
  v10 = [v6 localizedSwimmingPaceStringWithDistance:v9 overDuration:a3 paceFormat:v8];

  return v10;
}

- (id)formattedStrokeCountUsingFormatType:(int64_t)a3 formattingManager:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(CHWorkoutSwimmingSet *)self strokeCount];
  double v8 = [(CHWorkoutSwimmingSet *)self distance];
  v9 = [v6 localizedStrokeCountStringWithCount:v7 overDistance:v8 paceFormat:a3];

  return v9;
}

- (id)formattedDominantStrokeStyle
{
  [(CHWorkoutSwimmingSet *)self dominantStrokeStyle];

  return (id)FILocalizedStrokeStyleName();
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)CHWorkoutSwimmingSet;
  v3 = [(CHWorkoutSwimmingSet *)&v11 description];
  id v4 = [(CHWorkoutSwimmingSet *)self startDate];
  double v5 = [(CHWorkoutSwimmingSet *)self endDate];
  id v6 = [(CHWorkoutSwimmingSet *)self distance];
  int64_t v7 = +[NSNumber numberWithInteger:[(CHWorkoutSwimmingSet *)self strokeCount]];
  double v8 = +[NSNumber numberWithInteger:[(CHWorkoutSwimmingSet *)self dominantStrokeStyle]];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Start: %@; End: %@; Distance: %@; Stroke Count: %@; Stroke Style: %@",
    v3,
    v4,
    v5,
    v6,
    v7,
  v9 = v8);

  return v9;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)movementEndDate
{
  return self->_movementEndDate;
}

- (void)setMovementEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (int64_t)dominantStrokeStyle
{
  return self->_dominantStrokeStyle;
}

- (void)setDominantStrokeStyle:(int64_t)a3
{
  self->_dominantStrokeStyle = a3;
}

- (int64_t)strokeCount
{
  return self->_strokeCount;
}

- (void)setStrokeCount:(int64_t)a3
{
  self->_strokeCount = a3;
}

- (HKQuantity)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
}

- (int64_t)swolfScore
{
  return self->_swolfScore;
}

- (void)setSwolfScore:(int64_t)a3
{
  self->_swolfScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_movementEndDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end