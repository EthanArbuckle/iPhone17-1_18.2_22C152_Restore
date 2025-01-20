@interface CLPeopleDensityMediumSignalClassifierConfig
- (BOOL)isInMidRangeRssi:(int)a3;
- (CLPeopleDensityMediumSignalClassifierConfig)initWithDefaults;
- (CLPeopleDensityMediumSignalClassifierConfig)initWithRssiLowerBound:(int64_t)a3 RssiUpperBound:(int64_t)a4 deviceThreshold:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)midRangRssiLowerBound;
- (int64_t)midRangRssiUpperBound;
- (unint64_t)midRangRssiDeviceThreshold;
@end

@implementation CLPeopleDensityMediumSignalClassifierConfig

- (CLPeopleDensityMediumSignalClassifierConfig)initWithDefaults
{
  return [(CLPeopleDensityMediumSignalClassifierConfig *)self initWithRssiLowerBound:-73 RssiUpperBound:-62 deviceThreshold:1];
}

- (CLPeopleDensityMediumSignalClassifierConfig)initWithRssiLowerBound:(int64_t)a3 RssiUpperBound:(int64_t)a4 deviceThreshold:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CLPeopleDensityMediumSignalClassifierConfig;
  v8 = [(CLPeopleDensityMediumSignalClassifierConfig *)&v11 init];
  v9 = 0;
  if (a3 <= a4 && v8)
  {
    v8->_midRangRssiLowerBound = a3;
    v8->_midRangRssiUpperBound = a4;
    v9 = v8;
    v8->_midRangRssiDeviceThreshold = a5;
  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CLPeopleDensityMediumSignalClassifierConfig allocWithZone:a3];
  int64_t v5 = [(CLPeopleDensityMediumSignalClassifierConfig *)self midRangRssiLowerBound];
  int64_t v6 = [(CLPeopleDensityMediumSignalClassifierConfig *)self midRangRssiUpperBound];
  unint64_t v7 = [(CLPeopleDensityMediumSignalClassifierConfig *)self midRangRssiDeviceThreshold];

  return [(CLPeopleDensityMediumSignalClassifierConfig *)v4 initWithRssiLowerBound:v5 RssiUpperBound:v6 deviceThreshold:v7];
}

- (BOOL)isInMidRangeRssi:(int)a3
{
  return self->_midRangRssiUpperBound >= a3 && self->_midRangRssiLowerBound <= a3;
}

- (int64_t)midRangRssiLowerBound
{
  return self->_midRangRssiLowerBound;
}

- (int64_t)midRangRssiUpperBound
{
  return self->_midRangRssiUpperBound;
}

- (unint64_t)midRangRssiDeviceThreshold
{
  return self->_midRangRssiDeviceThreshold;
}

@end