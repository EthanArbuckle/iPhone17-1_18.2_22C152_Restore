@interface CLBarometerCalibrationAbsoluteAltitude
- (double)accuracy;
- (double)altitude;
- (double)filteredPressure;
- (double)precision;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)statusInfo;
- (void)setAccuracy:(double)a3;
- (void)setAltitude:(double)a3;
- (void)setFilteredPressure:(double)a3;
- (void)setPrecision:(double)a3;
- (void)setStatusInfo:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation CLBarometerCalibrationAbsoluteAltitude

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_opt_new();
  *((void *)result + 1) = *(void *)&self->_timestamp;
  *((void *)result + 2) = *(void *)&self->_altitude;
  *((void *)result + 3) = *(void *)&self->_accuracy;
  *((void *)result + 4) = *(void *)&self->_precision;
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

- (double)altitude
{
  return self->_altitude;
}

- (void)setAltitude:(double)a3
{
  self->_altitude = a3;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (void)setAccuracy:(double)a3
{
  self->_accuracy = a3;
}

- (double)precision
{
  return self->_precision;
}

- (void)setPrecision:(double)a3
{
  self->_precision = a3;
}

- (double)filteredPressure
{
  return self->_filteredPressure;
}

- (void)setFilteredPressure:(double)a3
{
  self->_filteredPressure = a3;
}

- (unint64_t)statusInfo
{
  return self->_statusInfo;
}

- (void)setStatusInfo:(unint64_t)a3
{
  self->_statusInfo = a3;
}

@end