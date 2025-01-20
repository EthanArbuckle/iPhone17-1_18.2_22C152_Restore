@interface CLMeanSeaLevelPressureData
- (CLMeanSeaLevelPressureData)init;
- (double)meanSeaLevelPressure;
- (double)pressureMeasurement;
- (double)timestamp;
- (double)uncertainty;
- (void)setMeanSeaLevelPressure:(double)a3;
- (void)setPressureMeasurement:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setUncertainty:(double)a3;
@end

@implementation CLMeanSeaLevelPressureData

- (CLMeanSeaLevelPressureData)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLMeanSeaLevelPressureData;
  result = [(CLMeanSeaLevelPressureData *)&v4 init];
  if (result)
  {
    int64x2_t v3 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(int64x2_t *)&result->_timestamp = v3;
    *(int64x2_t *)&result->_uncertainty = v3;
  }
  return result;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)meanSeaLevelPressure
{
  return self->_meanSeaLevelPressure;
}

- (void)setMeanSeaLevelPressure:(double)a3
{
  self->_meanSeaLevelPressure = a3;
}

- (double)uncertainty
{
  return self->_uncertainty;
}

- (void)setUncertainty:(double)a3
{
  self->_uncertainty = a3;
}

- (double)pressureMeasurement
{
  return self->_pressureMeasurement;
}

- (void)setPressureMeasurement:(double)a3
{
  self->_pressureMeasurement = a3;
}

@end