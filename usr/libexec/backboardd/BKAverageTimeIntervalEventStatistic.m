@interface BKAverageTimeIntervalEventStatistic
+ (id)statisticWithLabel:(id)a3 scale:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (double)value;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)begin;
- (void)end;
- (void)reset;
- (void)setValue:(double)a3;
@end

@implementation BKAverageTimeIntervalEventStatistic

+ (id)statisticWithLabel:(id)a3 scale:(int64_t)a4
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___BKAverageTimeIntervalEventStatistic;
  v5 = [super statisticWithLabel:a3];
  v5[4] = a4;

  return v5;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  double value = self->_value;
  if (value != 0.0)
  {
    int64_t scale = self->_scale;
    if (scale <= 0)
    {
      self->_int64_t scale = 1;
      double value = self->_value;
      CFStringRef v7 = @" (s)";
      double v8 = 1.0;
    }
    else
    {
      CFStringRef v6 = @" (s)";
      if (scale == 1000000) {
        CFStringRef v6 = @" (µs)";
      }
      if (scale == 1000) {
        CFStringRef v7 = @" (ms)";
      }
      else {
        CFStringRef v7 = v6;
      }
      double v8 = (double)scale;
    }
    double v9 = value * v8;
    id v10 = a3;
    v11 = [(BKEventStatistic *)self label];
    v12 = [v11 stringByAppendingString:v7];
    id v13 = [v10 appendDouble:v12 withName:2 decimalPrecision:v9];

    v14.receiver = self;
    v14.super_class = (Class)BKAverageTimeIntervalEventStatistic;
    [(BKEventStatistic *)&v14 appendDescriptionToFormatter:v10];
  }
}

- (void)end
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v4 = v3 - self->_startInterval + self->_cumulativeInterval;
  self->_cumulativeInterval = v4;
  int64_t v5 = self->_count + 1;
  self->_count = v5;
  self->_double value = v4 / (double)v5;

  [(BKEventStatistic *)self setNeedsLogging:1];
}

- (void)begin
{
  +[NSDate timeIntervalSinceReferenceDate];
  self->_startInterval = v3;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)BKAverageTimeIntervalEventStatistic;
  [(BKEventStatistic *)&v3 reset];
  self->_double value = 0.0;
  self->_cumulativeInterval = 0.0;
  self->_count = 0;
}

- (double)value
{
  return self->_value;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKAverageTimeIntervalEventStatistic;
  id result = [(BKEventStatistic *)&v5 copyWithZone:a3];
  *((void *)result + 8) = *(void *)&self->_value;
  return result;
}

- (void)setValue:(double)a3
{
  if (self->_value != a3)
  {
    self->_double value = a3;
    [(BKEventStatistic *)self setNeedsLogging:1];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      CFStringRef v7 = v6;
    }
    else {
      CFStringRef v7 = 0;
    }
  }
  else
  {
    CFStringRef v7 = 0;
  }
  id v8 = v7;

  [v8 value];
  double v10 = v9;

  BOOL v11 = v10 == self->_value;
  return v11;
}

- (unint64_t)hash
{
  v2 = +[NSNumber numberWithDouble:self->_value];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

@end