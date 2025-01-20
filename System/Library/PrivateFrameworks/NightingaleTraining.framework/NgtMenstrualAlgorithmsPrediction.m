@interface NgtMenstrualAlgorithmsPrediction
+ (BOOL)supportsSecureCoding;
- (BOOL)isOngoingMenstruation;
- (NgtMenstrualAlgorithmsPrediction)initWithCoder:(id)a3;
- (_NSRange)lowRange;
- (double)endProbabilityLowRangeEnd;
- (double)endProbabilityLowRangeStart;
- (double)endProbabilityMean;
- (double)endProbabilityStdDev;
- (double)startProbabilityLowRangeEnd;
- (double)startProbabilityLowRangeStart;
- (double)startProbabilityMean;
- (double)startProbabilityStdDev;
- (int64_t)daysOffsetFromCalendarMethod;
- (unsigned)julianDayOfWindowStart;
- (unsigned)predictionPrimarySource;
- (void)encodeWithCoder:(id)a3;
- (void)setDaysOffsetFromCalendarMethod:(int64_t)a3;
- (void)setEndProbabilityLowRangeEnd:(double)a3;
- (void)setEndProbabilityLowRangeStart:(double)a3;
- (void)setEndProbabilityMean:(double)a3;
- (void)setEndProbabilityStdDev:(double)a3;
- (void)setIsOngoingMenstruation:(BOOL)a3;
- (void)setJulianDayOfWindowStart:(unsigned int)a3;
- (void)setLowRange:(_NSRange)a3;
- (void)setPredictionPrimarySource:(unsigned __int8)a3;
- (void)setStartProbabilityLowRangeEnd:(double)a3;
- (void)setStartProbabilityLowRangeStart:(double)a3;
- (void)setStartProbabilityMean:(double)a3;
- (void)setStartProbabilityStdDev:(double)a3;
@end

@implementation NgtMenstrualAlgorithmsPrediction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NgtMenstrualAlgorithmsPrediction)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NgtMenstrualAlgorithmsPrediction *)self init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_julianDayOfWindowStart);
    v5->_julianDayOfWindowStart = [v4 decodeInt32ForKey:v6];

    v7 = NSStringFromSelector(sel_startProbabilityMean);
    [v4 decodeDoubleForKey:v7];
    v5->_startProbabilityMean = v8;

    v9 = NSStringFromSelector(sel_endProbabilityMean);
    [v4 decodeDoubleForKey:v9];
    v5->_endProbabilityMean = v10;

    v11 = NSStringFromSelector(sel_startProbabilityLowRangeStart);
    [v4 decodeDoubleForKey:v11];
    v5->_startProbabilityLowRangeStart = v12;

    v13 = NSStringFromSelector(sel_endProbabilityLowRangeStart);
    [v4 decodeDoubleForKey:v13];
    v5->_endProbabilityLowRangeStart = v14;

    v15 = NSStringFromSelector(sel_startProbabilityLowRangeEnd);
    [v4 decodeDoubleForKey:v15];
    v5->_startProbabilityLowRangeEnd = v16;

    v17 = NSStringFromSelector(sel_endProbabilityLowRangeEnd);
    [v4 decodeDoubleForKey:v17];
    v5->_endProbabilityLowRangeEnd = v18;

    v19 = NSStringFromSelector(sel_startProbabilityStdDev);
    [v4 decodeDoubleForKey:v19];
    v5->_startProbabilityStdDev = v20;

    v21 = NSStringFromSelector(sel_endProbabilityStdDev);
    [v4 decodeDoubleForKey:v21];
    v5->_endProbabilityStdDev = v22;

    uint64_t v23 = objc_opt_class();
    v24 = NSStringFromSelector(sel_lowRange);
    v25 = [v4 decodeObjectOfClass:v23 forKey:v24];

    v5->_lowRange.location = [v25 rangeValue];
    v5->_lowRange.length = v26;
    v27 = NSStringFromSelector(sel_isOngoingMenstruation);
    v5->_isOngoingMenstruation = [v4 decodeBoolForKey:v27];

    v28 = NSStringFromSelector(sel_predictionPrimarySource);
    v5->_predictionPrimarySource = [v4 decodeInt32ForKey:v28];

    v29 = NSStringFromSelector(sel_daysOffsetFromCalendarMethod);
    v5->_daysOffsetFromCalendarMethod = [v4 decodeIntegerForKey:v29];

    v30 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v29 = a3;
  uint64_t julianDayOfWindowStart = self->_julianDayOfWindowStart;
  v5 = NSStringFromSelector(sel_julianDayOfWindowStart);
  [v29 encodeInt32:julianDayOfWindowStart forKey:v5];

  double startProbabilityMean = self->_startProbabilityMean;
  v7 = NSStringFromSelector(sel_startProbabilityMean);
  [v29 encodeDouble:v7 forKey:startProbabilityMean];

  double endProbabilityMean = self->_endProbabilityMean;
  v9 = NSStringFromSelector(sel_endProbabilityMean);
  [v29 encodeDouble:v9 forKey:endProbabilityMean];

  double startProbabilityLowRangeStart = self->_startProbabilityLowRangeStart;
  v11 = NSStringFromSelector(sel_startProbabilityLowRangeStart);
  [v29 encodeDouble:v11 forKey:startProbabilityLowRangeStart];

  double endProbabilityLowRangeStart = self->_endProbabilityLowRangeStart;
  v13 = NSStringFromSelector(sel_endProbabilityLowRangeStart);
  [v29 encodeDouble:v13 forKey:endProbabilityLowRangeStart];

  double startProbabilityLowRangeEnd = self->_startProbabilityLowRangeEnd;
  v15 = NSStringFromSelector(sel_startProbabilityLowRangeEnd);
  [v29 encodeDouble:v15 forKey:startProbabilityLowRangeEnd];

  double endProbabilityLowRangeEnd = self->_endProbabilityLowRangeEnd;
  v17 = NSStringFromSelector(sel_endProbabilityLowRangeEnd);
  [v29 encodeDouble:v17 forKey:endProbabilityLowRangeEnd];

  double startProbabilityStdDev = self->_startProbabilityStdDev;
  v19 = NSStringFromSelector(sel_startProbabilityStdDev);
  [v29 encodeDouble:v19 forKey:startProbabilityStdDev];

  double endProbabilityStdDev = self->_endProbabilityStdDev;
  v21 = NSStringFromSelector(sel_endProbabilityStdDev);
  [v29 encodeDouble:v21 forKey:endProbabilityStdDev];

  double v22 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", self->_lowRange.location, self->_lowRange.length);
  uint64_t v23 = NSStringFromSelector(sel_lowRange);
  [v29 encodeObject:v22 forKey:v23];

  LODWORD(v23) = self->_isOngoingMenstruation;
  v24 = NSStringFromSelector(sel_isOngoingMenstruation);
  [v29 encodeBool:v23 != 0 forKey:v24];

  uint64_t predictionPrimarySource = self->_predictionPrimarySource;
  NSUInteger v26 = NSStringFromSelector(sel_predictionPrimarySource);
  [v29 encodeInt32:predictionPrimarySource forKey:v26];

  int64_t daysOffsetFromCalendarMethod = self->_daysOffsetFromCalendarMethod;
  v28 = NSStringFromSelector(sel_daysOffsetFromCalendarMethod);
  [v29 encodeInteger:daysOffsetFromCalendarMethod forKey:v28];
}

- (unsigned)julianDayOfWindowStart
{
  return self->_julianDayOfWindowStart;
}

- (void)setJulianDayOfWindowStart:(unsigned int)a3
{
  self->_uint64_t julianDayOfWindowStart = a3;
}

- (double)startProbabilityMean
{
  return self->_startProbabilityMean;
}

- (void)setStartProbabilityMean:(double)a3
{
  self->_double startProbabilityMean = a3;
}

- (double)endProbabilityMean
{
  return self->_endProbabilityMean;
}

- (void)setEndProbabilityMean:(double)a3
{
  self->_double endProbabilityMean = a3;
}

- (double)startProbabilityStdDev
{
  return self->_startProbabilityStdDev;
}

- (void)setStartProbabilityStdDev:(double)a3
{
  self->_double startProbabilityStdDev = a3;
}

- (double)endProbabilityStdDev
{
  return self->_endProbabilityStdDev;
}

- (void)setEndProbabilityStdDev:(double)a3
{
  self->_double endProbabilityStdDev = a3;
}

- (double)startProbabilityLowRangeStart
{
  return self->_startProbabilityLowRangeStart;
}

- (void)setStartProbabilityLowRangeStart:(double)a3
{
  self->_double startProbabilityLowRangeStart = a3;
}

- (double)endProbabilityLowRangeStart
{
  return self->_endProbabilityLowRangeStart;
}

- (void)setEndProbabilityLowRangeStart:(double)a3
{
  self->_double endProbabilityLowRangeStart = a3;
}

- (double)startProbabilityLowRangeEnd
{
  return self->_startProbabilityLowRangeEnd;
}

- (void)setStartProbabilityLowRangeEnd:(double)a3
{
  self->_double startProbabilityLowRangeEnd = a3;
}

- (double)endProbabilityLowRangeEnd
{
  return self->_endProbabilityLowRangeEnd;
}

- (void)setEndProbabilityLowRangeEnd:(double)a3
{
  self->_double endProbabilityLowRangeEnd = a3;
}

- (_NSRange)lowRange
{
  NSUInteger length = self->_lowRange.length;
  NSUInteger location = self->_lowRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setLowRange:(_NSRange)a3
{
  self->_lowRange = a3;
}

- (BOOL)isOngoingMenstruation
{
  return self->_isOngoingMenstruation;
}

- (void)setIsOngoingMenstruation:(BOOL)a3
{
  self->_isOngoingMenstruation = a3;
}

- (unsigned)predictionPrimarySource
{
  return self->_predictionPrimarySource;
}

- (void)setPredictionPrimarySource:(unsigned __int8)a3
{
  self->_uint64_t predictionPrimarySource = a3;
}

- (int64_t)daysOffsetFromCalendarMethod
{
  return self->_daysOffsetFromCalendarMethod;
}

- (void)setDaysOffsetFromCalendarMethod:(int64_t)a3
{
  self->_int64_t daysOffsetFromCalendarMethod = a3;
}

@end