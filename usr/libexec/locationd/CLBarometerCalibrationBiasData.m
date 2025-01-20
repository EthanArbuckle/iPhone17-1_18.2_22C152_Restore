@interface CLBarometerCalibrationBiasData
- (double)biasInMeters;
- (double)estimatedMeanSeaLevelPressure;
- (double)estimatedUncertainty;
- (double)timestamp;
- (double)uncertaintyInMeters;
- (double)weatherEstimateInMeter;
- (unint64_t)previousCumulativeDeltaIOSTime;
- (unint64_t)statusInfo;
- (void)setBiasInMeters:(double)a3;
- (void)setEstimatedMeanSeaLevelPressure:(double)a3;
- (void)setEstimatedUncertainty:(double)a3;
- (void)setPreviousCumulativeDeltaIOSTime:(unint64_t)a3;
- (void)setStatusInfo:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
- (void)setUncertaintyInMeters:(double)a3;
- (void)setWeatherEstimateInMeter:(double)a3;
@end

@implementation CLBarometerCalibrationBiasData

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)biasInMeters
{
  return self->_biasInMeters;
}

- (void)setBiasInMeters:(double)a3
{
  self->_biasInMeters = a3;
}

- (double)uncertaintyInMeters
{
  return self->_uncertaintyInMeters;
}

- (void)setUncertaintyInMeters:(double)a3
{
  self->_uncertaintyInMeters = a3;
}

- (double)estimatedMeanSeaLevelPressure
{
  return self->_estimatedMeanSeaLevelPressure;
}

- (void)setEstimatedMeanSeaLevelPressure:(double)a3
{
  self->_estimatedMeanSeaLevelPressure = a3;
}

- (double)estimatedUncertainty
{
  return self->_estimatedUncertainty;
}

- (void)setEstimatedUncertainty:(double)a3
{
  self->_estimatedUncertainty = a3;
}

- (double)weatherEstimateInMeter
{
  return self->_weatherEstimateInMeter;
}

- (void)setWeatherEstimateInMeter:(double)a3
{
  self->_weatherEstimateInMeter = a3;
}

- (unint64_t)previousCumulativeDeltaIOSTime
{
  return self->_previousCumulativeDeltaIOSTime;
}

- (void)setPreviousCumulativeDeltaIOSTime:(unint64_t)a3
{
  self->_previousCumulativeDeltaIOSTime = a3;
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