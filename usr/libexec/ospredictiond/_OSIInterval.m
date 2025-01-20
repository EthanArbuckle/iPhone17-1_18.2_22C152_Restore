@interface _OSIInterval
- (BOOL)hasReasonableDuration;
- (BOOL)isValidInterval;
- (BOOL)localizeDatesWithSecondsFromGMT:(int64_t)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDuration:(double)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation _OSIInterval

- (BOOL)isValidInterval
{
  if (!self->_startDate) {
    goto LABEL_5;
  }
  endDate = self->_endDate;
  if (endDate)
  {
    -[NSDate timeIntervalSinceDate:](endDate, "timeIntervalSinceDate:");
    if (v4 > 0.0)
    {
      LOBYTE(endDate) = v4 == self->_duration;
      return (char)endDate;
    }
LABEL_5:
    LOBYTE(endDate) = 0;
  }
  return (char)endDate;
}

- (BOOL)hasReasonableDuration
{
  return self->_duration >= 0.0;
}

- (NSString)description
{
  startDate = self->_startDate;
  double v4 = +[NSLocale systemLocale];
  v5 = [(NSDate *)startDate descriptionWithLocale:v4];

  endDate = self->_endDate;
  v7 = +[NSLocale systemLocale];
  v8 = [(NSDate *)endDate descriptionWithLocale:v7];

  v9 = &AnalyticsSendEventLazy_ptr;
  double duration = self->_duration;
  LODWORD(v9) = llround(duration);
  v11 = +[NSString stringWithFormat:@"start = %@ | end = %@ | double duration = %d sec / %.1f min / %.2f hr", v5, v8, v9, duration / 60.0, duration / 3600.0];

  return (NSString *)v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = [(_OSIInterval *)self startDate];
  id v6 = [v5 copy];
  [v4 setStartDate:v6];

  v7 = [(_OSIInterval *)self endDate];
  id v8 = [v7 copy];
  [v4 setEndDate:v8];

  [(_OSIInterval *)self duration];
  [v4 setDuration:];
  return v4;
}

- (BOOL)localizeDatesWithSecondsFromGMT:(int64_t)a3
{
  v5 = +[NSTimeZone localTimeZone];
  id v6 = [v5 secondsFromGMT];

  uint64_t v7 = a3 - (void)v6;
  if ((id)a3 != v6)
  {
    id v8 = [(_OSIInterval *)self startDate];
    double v9 = (double)v7;
    v10 = [v8 dateByAddingTimeInterval:(double)v7];
    [(_OSIInterval *)self setStartDate:v10];

    v11 = [(_OSIInterval *)self endDate];
    v12 = [v11 dateByAddingTimeInterval:v9];
    [(_OSIInterval *)self setEndDate:v12];
  }
  return a3 != (void)v6;
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

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end