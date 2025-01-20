@interface ICSTimeZoneChange
- (BOOL)isCloseTo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ICSTimeZoneChange)initWithTimeInterval:(double)a3 tzOffsetTo:(int64_t)a4;
- (double)interval;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)tzOffsetTo;
@end

@implementation ICSTimeZoneChange

- (ICSTimeZoneChange)initWithTimeInterval:(double)a3 tzOffsetTo:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICSTimeZoneChange;
  result = [(ICSTimeZoneChange *)&v7 init];
  result->_interval = a3;
  result->_tzOffsetTo = a4;
  return result;
}

- (double)interval
{
  return self->_interval;
}

- (int64_t)tzOffsetTo
{
  return self->_tzOffsetTo;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  double interval = self->_interval;
  [v4 interval];
  if (vabdd_f64(interval, v6) >= 2.22044605e-16)
  {
    BOOL v8 = 0;
  }
  else
  {
    int64_t tzOffsetTo = self->_tzOffsetTo;
    BOOL v8 = tzOffsetTo == [v4 tzOffsetTo];
  }

  return v8;
}

- (BOOL)isCloseTo:(id)a3
{
  id v4 = a3;
  double interval = self->_interval;
  [v4 interval];
  if (vabdd_f64(interval, v6) >= 86400.0)
  {
    BOOL v8 = 0;
  }
  else
  {
    int64_t tzOffsetTo = self->_tzOffsetTo;
    BOOL v8 = tzOffsetTo == [v4 tzOffsetTo];
  }

  return v8;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
  id v4 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:self->_tzOffsetTo];
  [v3 setTimeZone:v4];

  v5 = NSString;
  double v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_interval];
  objc_super v7 = [v3 stringFromDate:v6];
  BOOL v8 = [v5 stringWithFormat:@"interval: %@, offset: %ld", v7, self->_tzOffsetTo];

  return v8;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  [(ICSTimeZoneChange *)self interval];
  double v6 = v5;
  [v4 interval];
  if (v6 >= v7)
  {
    [(ICSTimeZoneChange *)self interval];
    double v10 = v9;
    [v4 interval];
    int64_t v8 = v10 > v11;
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

@end