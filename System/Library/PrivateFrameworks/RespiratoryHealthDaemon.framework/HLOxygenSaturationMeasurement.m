@interface HLOxygenSaturationMeasurement
- (HLHeartRateData)averageHeartRateData;
- (NSDateInterval)dateInterval;
- (NSNumber)oxygenSaturationPercentage;
- (NSNumber)pressureInKilopascals;
- (void)setAverageHeartRateData:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setOxygenSaturationPercentage:(id)a3;
- (void)setPressureInKilopascals:(id)a3;
@end

@implementation HLOxygenSaturationMeasurement

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (NSNumber)oxygenSaturationPercentage
{
  return self->_oxygenSaturationPercentage;
}

- (void)setOxygenSaturationPercentage:(id)a3
{
}

- (HLHeartRateData)averageHeartRateData
{
  return self->_averageHeartRateData;
}

- (void)setAverageHeartRateData:(id)a3
{
}

- (NSNumber)pressureInKilopascals
{
  return self->_pressureInKilopascals;
}

- (void)setPressureInKilopascals:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pressureInKilopascals, 0);
  objc_storeStrong((id *)&self->_averageHeartRateData, 0);
  objc_storeStrong((id *)&self->_oxygenSaturationPercentage, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end