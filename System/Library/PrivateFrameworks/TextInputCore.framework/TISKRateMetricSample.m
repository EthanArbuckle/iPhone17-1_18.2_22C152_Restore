@interface TISKRateMetricSample
+ (BOOL)supportsSecureCoding;
+ (id)makeMetric;
- (BOOL)isEqual:(id)a3;
- (TISKRateMetricSample)init;
- (TISKRateMetricSample)initWithCoder:(id)a3;
- (double)durationFactor;
- (id)description;
- (id)rate;
- (int)countFactor;
- (void)addToCounter:(int)a3;
- (void)addToDuration:(double)a3;
- (void)encodeWithCoder:(id)a3;
- (void)merge:(id)a3;
- (void)setCountFactor:(int)a3;
- (void)setDurationFactor:(double)a3;
@end

@implementation TISKRateMetricSample

- (void)setDurationFactor:(double)a3
{
  self->_durationFactor = a3;
}

- (double)durationFactor
{
  return self->_durationFactor;
}

- (void)setCountFactor:(int)a3
{
  self->_countFactor = a3;
}

- (int)countFactor
{
  return self->_countFactor;
}

- (TISKRateMetricSample)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TISKRateMetricSample;
  v5 = [(TISKRateMetricSample *)&v8 init];
  if (v5)
  {
    v5->_countFactor = [v4 decodeIntForKey:@"RateMetricSampleCounter"];
    [v4 decodeDoubleForKey:@"RateMetricSampleDuration"];
    v5->_durationFactor = v6;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[TISKRateMetricSample countFactor](self, "countFactor"), @"RateMetricSampleCounter");
  [(TISKRateMetricSample *)self durationFactor];
  objc_msgSend(v4, "encodeDouble:forKey:", @"RateMetricSampleDuration");
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%d/%f", self->_countFactor, *(void *)&self->_durationFactor);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TISKRateMetricSample *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    int countFactor = self->_countFactor;
    if (countFactor == [(TISKRateMetricSample *)v4 countFactor])
    {
      double durationFactor = self->_durationFactor;
      [(TISKRateMetricSample *)v5 durationFactor];
      BOOL v9 = durationFactor == v8;
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (void)merge:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v5 = IXADefaultLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s [SensorKit] [rateMetricSample merge: other doesn't respond to countFactor selector %d : %d", "-[TISKRateMetricSample merge:]", self->_countFactor, objc_msgSend(v4, "countFactor"));
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_error_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  -[TISKRateMetricSample setCountFactor:](self, "setCountFactor:", [v4 countFactor] + -[TISKRateMetricSample countFactor](self, "countFactor"));
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    double v6 = IXADefaultLogFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = NSString;
      double durationFactor = self->_durationFactor;
      [v4 durationFactor];
      v14 = objc_msgSend(v11, "stringWithFormat:", @"%s [SensorKit] [rateMetricSample merge: other doesn't respond to durationFactor selector %f : %f", "-[TISKRateMetricSample merge:]", *(void *)&durationFactor, v13);
      *(_DWORD *)buf = 138412290;
      v16 = v14;
      _os_log_error_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  [(TISKRateMetricSample *)self durationFactor];
  double v8 = v7;
  [v4 durationFactor];
  [(TISKRateMetricSample *)self setDurationFactor:v8 + v9];
}

- (id)rate
{
  double durationFactor = self->_durationFactor;
  if (durationFactor <= 0.0 || (int countFactor = self->_countFactor, countFactor < 1))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [NSNumber numberWithDouble:(double)countFactor / durationFactor];
  }

  return v4;
}

- (void)addToDuration:(double)a3
{
  self->_double durationFactor = self->_durationFactor + a3;
}

- (void)addToCounter:(int)a3
{
  self->_countFactor += a3;
}

- (TISKRateMetricSample)init
{
  v3.receiver = self;
  v3.super_class = (Class)TISKRateMetricSample;
  result = [(TISKRateMetricSample *)&v3 init];
  if (result)
  {
    result->_double durationFactor = 0.0;
    result->_int countFactor = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)makeMetric
{
  v2 = objc_alloc_init(TISKRateMetricSample);

  return v2;
}

@end