@interface TAInterVisitMetricPerDeviceSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (TAInterVisitMetricPerDeviceSettings)init;
- (TAInterVisitMetricPerDeviceSettings)initWithCoder:(id)a3;
- (TAInterVisitMetricPerDeviceSettings)initWithSampledObservationLocationsInterval:(double)a3 sampledObservationLocationsBufferSize:(unint64_t)a4;
- (double)sampledObservationLocationsInterval;
- (unint64_t)sampledObservationLocationsBufferSize;
- (void)encodeWithCoder:(id)a3;
- (void)setSampledObservationLocationsBufferSize:(unint64_t)a3;
- (void)setSampledObservationLocationsInterval:(double)a3;
@end

@implementation TAInterVisitMetricPerDeviceSettings

- (TAInterVisitMetricPerDeviceSettings)init
{
  return [(TAInterVisitMetricPerDeviceSettings *)self initWithSampledObservationLocationsInterval:20 sampledObservationLocationsBufferSize:180.0];
}

- (TAInterVisitMetricPerDeviceSettings)initWithSampledObservationLocationsInterval:(double)a3 sampledObservationLocationsBufferSize:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TAInterVisitMetricPerDeviceSettings;
  result = [(TAInterVisitMetricPerDeviceSettings *)&v7 init];
  if (result)
  {
    result->_sampledObservationLocationsInterval = a3;
    result->_sampledObservationLocationsBufferSize = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TAInterVisitMetricPerDeviceSettings *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(TAInterVisitMetricPerDeviceSettings *)self sampledObservationLocationsInterval];
      double v7 = v6;
      [(TAInterVisitMetricPerDeviceSettings *)v5 sampledObservationLocationsInterval];
      if (v7 == v8)
      {
        unint64_t v9 = [(TAInterVisitMetricPerDeviceSettings *)self sampledObservationLocationsBufferSize];
        BOOL v10 = v9 == [(TAInterVisitMetricPerDeviceSettings *)v5 sampledObservationLocationsBufferSize];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAInterVisitMetricPerDeviceSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"SampleInterval"];
  double v6 = v5;
  uint64_t v7 = [v4 decodeIntegerForKey:@"BufferSize"];

  return [(TAInterVisitMetricPerDeviceSettings *)self initWithSampledObservationLocationsInterval:v7 sampledObservationLocationsBufferSize:v6];
}

- (void)encodeWithCoder:(id)a3
{
  double sampledObservationLocationsInterval = self->_sampledObservationLocationsInterval;
  id v5 = a3;
  [v5 encodeDouble:@"SampleInterval" forKey:sampledObservationLocationsInterval];
  [v5 encodeInteger:self->_sampledObservationLocationsBufferSize forKey:@"BufferSize"];
}

- (double)sampledObservationLocationsInterval
{
  return self->_sampledObservationLocationsInterval;
}

- (void)setSampledObservationLocationsInterval:(double)a3
{
  self->_double sampledObservationLocationsInterval = a3;
}

- (unint64_t)sampledObservationLocationsBufferSize
{
  return self->_sampledObservationLocationsBufferSize;
}

- (void)setSampledObservationLocationsBufferSize:(unint64_t)a3
{
  self->_sampledObservationLocationsBufferSize = a3;
}

@end