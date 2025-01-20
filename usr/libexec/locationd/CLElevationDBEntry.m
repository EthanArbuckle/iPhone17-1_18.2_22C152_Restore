@interface CLElevationDBEntry
- (CLElevationDBEntry)init;
- (double)pressure;
- (double)pressureUncertainty;
- (double)timestamp;
- (void)setPressure:(double)a3;
- (void)setPressureUncertainty:(double)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation CLElevationDBEntry

- (CLElevationDBEntry)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLElevationDBEntry;
  result = [(CLElevationDBEntry *)&v3 init];
  if (result)
  {
    *(int64x2_t *)&result->_timestamp = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    result->_pressureUncertainty = 1.79769313e308;
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

- (double)pressure
{
  return self->_pressure;
}

- (void)setPressure:(double)a3
{
  self->_pressure = a3;
}

- (double)pressureUncertainty
{
  return self->_pressureUncertainty;
}

- (void)setPressureUncertainty:(double)a3
{
  self->_pressureUncertainty = a3;
}

@end