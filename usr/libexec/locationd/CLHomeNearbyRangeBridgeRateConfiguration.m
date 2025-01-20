@interface CLHomeNearbyRangeBridgeRateConfiguration
- (CLHomeNearbyRangeBridgeRateConfiguration)initWithUpdateRate:(uint64_t)a3 withDuration:(int64_t)a4;
- (double)rateDurationInSeconds;
- (int64_t)updateRate;
- (uint64_t)setRateDurationInSeconds:(uint64_t)result;
- (void)setUpdateRate:(int64_t)a3;
@end

@implementation CLHomeNearbyRangeBridgeRateConfiguration

- (CLHomeNearbyRangeBridgeRateConfiguration)initWithUpdateRate:(uint64_t)a3 withDuration:(int64_t)a4
{
  v7.receiver = a1;
  v7.super_class = (Class)CLHomeNearbyRangeBridgeRateConfiguration;
  result = [(CLHomeNearbyRangeBridgeRateConfiguration *)&v7 init];
  if (result)
  {
    result->_updateRate = a4;
    *(double *)&result[1].super.isa = a2;
  }
  return result;
}

- (int64_t)updateRate
{
  return self->_updateRate;
}

- (void)setUpdateRate:(int64_t)a3
{
  self->_updateRate = a3;
}

- (double)rateDurationInSeconds
{
  return *(double *)(a1 + 16);
}

- (uint64_t)setRateDurationInSeconds:(uint64_t)result
{
  *(double *)(result + 16) = a2;
  return result;
}

@end