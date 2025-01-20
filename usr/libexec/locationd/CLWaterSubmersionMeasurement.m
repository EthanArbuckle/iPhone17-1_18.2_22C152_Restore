@interface CLWaterSubmersionMeasurement
- (double)depth;
- (double)pressure;
- (double)startAt;
- (double)surfacePressure;
- (double)temperature;
- (double)temperatureUncertainty;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)state;
- (void)setDepth:(double)a3;
- (void)setPressure:(double)a3;
- (void)setStartAt:(double)a3;
- (void)setState:(int64_t)a3;
- (void)setSurfacePressure:(double)a3;
- (void)setTemperature:(double)a3;
- (void)setTemperatureUncertainty:(double)a3;
@end

@implementation CLWaterSubmersionMeasurement

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_opt_new();
  *((void *)result + 1) = *(void *)&self->_startAt;
  *((void *)result + 2) = *(void *)&self->_pressure;
  *((void *)result + 3) = *(void *)&self->_depth;
  *((void *)result + 4) = *(void *)&self->_temperature;
  *((void *)result + 5) = *(void *)&self->_temperatureUncertainty;
  *((void *)result + 6) = *(void *)&self->_surfacePressure;
  *((void *)result + 7) = self->_state;
  return result;
}

- (double)startAt
{
  return self->_startAt;
}

- (void)setStartAt:(double)a3
{
  self->_startAt = a3;
}

- (double)pressure
{
  return self->_pressure;
}

- (void)setPressure:(double)a3
{
  self->_pressure = a3;
}

- (double)depth
{
  return self->_depth;
}

- (void)setDepth:(double)a3
{
  self->_depth = a3;
}

- (double)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(double)a3
{
  self->_temperature = a3;
}

- (double)temperatureUncertainty
{
  return self->_temperatureUncertainty;
}

- (void)setTemperatureUncertainty:(double)a3
{
  self->_temperatureUncertainty = a3;
}

- (double)surfacePressure
{
  return self->_surfacePressure;
}

- (void)setSurfacePressure:(double)a3
{
  self->_surfacePressure = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

@end