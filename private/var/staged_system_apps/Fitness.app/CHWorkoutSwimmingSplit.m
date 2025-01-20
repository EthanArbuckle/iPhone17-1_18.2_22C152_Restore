@interface CHWorkoutSwimmingSplit
- (CHWorkoutSwimmingSplit)initWithSplitDelimiterDistance:(int64_t)a3 distanceInUserUnit:(double)a4 strokeCount:(int64_t)a5 duration:(double)a6;
- (double)_fractionToFillTotalSplitDelimiterDistance;
- (double)distanceInUserUnit;
- (double)duration;
- (double)durationScaledToFillSplit;
- (id)description;
- (id)formattedPaceWithFormattingManager:(id)a3;
- (id)formattedStrokeCount;
- (int64_t)splitDelimiterDistance;
- (int64_t)strokeCount;
- (int64_t)strokeCountScaledToFillSplit;
- (void)setDistanceInUserUnit:(double)a3;
- (void)setDuration:(double)a3;
- (void)setDurationScaledToFillSplit:(double)a3;
- (void)setSplitDelimiterDistance:(int64_t)a3;
- (void)setStrokeCount:(int64_t)a3;
- (void)setStrokeCountScaledToFillSplit:(int64_t)a3;
@end

@implementation CHWorkoutSwimmingSplit

- (CHWorkoutSwimmingSplit)initWithSplitDelimiterDistance:(int64_t)a3 distanceInUserUnit:(double)a4 strokeCount:(int64_t)a5 duration:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)CHWorkoutSwimmingSplit;
  result = [(CHWorkoutSwimmingSplit *)&v11 init];
  if (result)
  {
    result->_splitDelimiterDistance = a3;
    result->_distanceInUserUnit = a4;
    result->_strokeCount = a5;
    result->_duration = a6;
  }
  return result;
}

- (double)_fractionToFillTotalSplitDelimiterDistance
{
  double v3 = (double)[(CHWorkoutSwimmingSplit *)self splitDelimiterDistance];
  [(CHWorkoutSwimmingSplit *)self distanceInUserUnit];
  return v3 / v4;
}

- (int64_t)strokeCountScaledToFillSplit
{
  [(CHWorkoutSwimmingSplit *)self _fractionToFillTotalSplitDelimiterDistance];
  return llround(v3 * (double)[(CHWorkoutSwimmingSplit *)self strokeCount]);
}

- (double)durationScaledToFillSplit
{
  [(CHWorkoutSwimmingSplit *)self duration];
  double v4 = v3;
  [(CHWorkoutSwimmingSplit *)self _fractionToFillTotalSplitDelimiterDistance];
  return v4 * v5;
}

- (id)formattedStrokeCount
{
  v2 = +[NSNumber numberWithInteger:[(CHWorkoutSwimmingSplit *)self strokeCountScaledToFillSplit]];
  double v3 = +[FIUIFormattingManager stringWithNumber:v2 decimalPrecision:1];

  return v3;
}

- (id)formattedPaceWithFormattingManager:(id)a3
{
  id v4 = a3;
  [(CHWorkoutSwimmingSplit *)self durationScaledToFillSplit];
  double v5 = [v4 stringWithDuration:1];

  return v5;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)CHWorkoutSwimmingSplit;
  double v3 = [(CHWorkoutSwimmingSplit *)&v9 description];
  [(CHWorkoutSwimmingSplit *)self duration];
  id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  double v5 = +[NSNumber numberWithInteger:[(CHWorkoutSwimmingSplit *)self splitDelimiterDistance]];
  v6 = +[NSNumber numberWithInteger:[(CHWorkoutSwimmingSplit *)self strokeCount]];
  v7 = +[NSString stringWithFormat:@"%@: %@ seconds, %@ m/yd, %@ strokes", v3, v4, v5, v6];

  return v7;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)splitDelimiterDistance
{
  return self->_splitDelimiterDistance;
}

- (void)setSplitDelimiterDistance:(int64_t)a3
{
  self->_splitDelimiterDistance = a3;
}

- (double)distanceInUserUnit
{
  return self->_distanceInUserUnit;
}

- (void)setDistanceInUserUnit:(double)a3
{
  self->_distanceInUserUnit = a3;
}

- (int64_t)strokeCount
{
  return self->_strokeCount;
}

- (void)setStrokeCount:(int64_t)a3
{
  self->_strokeCount = a3;
}

- (void)setStrokeCountScaledToFillSplit:(int64_t)a3
{
  self->_strokeCountScaledToFillSplit = a3;
}

- (void)setDurationScaledToFillSplit:(double)a3
{
  self->_durationScaledToFillSplit = a3;
}

@end