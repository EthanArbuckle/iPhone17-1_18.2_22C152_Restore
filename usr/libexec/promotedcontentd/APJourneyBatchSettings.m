@interface APJourneyBatchSettings
- (APJourneyBatchSettings)init;
- (NSNumber)batchSize;
- (NSNumber)periodicDelay;
- (double)periodicDelayTimeInterval;
- (unint64_t)batchSizeUInteger;
- (void)setBatchSize:(id)a3;
- (void)setPeriodicDelay:(id)a3;
@end

@implementation APJourneyBatchSettings

- (APJourneyBatchSettings)init
{
  v13.receiver = self;
  v13.super_class = (Class)APJourneyBatchSettings;
  v2 = [(APJourneyBatchSettings *)&v13 init];
  if (v2)
  {
    v3 = +[APConfigurationMediator configurationForClass:objc_opt_class()];
    batchSize = v2->_batchSize;
    v2->_batchSize = (NSNumber *)&off_100249DE8;

    periodicDelay = v2->_periodicDelay;
    v2->_periodicDelay = (NSNumber *)&off_100249E00;

    if (v3)
    {
      v6 = [v3 periodicDelay];

      if (v6)
      {
        uint64_t v7 = [v3 periodicDelay];
        v8 = v2->_periodicDelay;
        v2->_periodicDelay = (NSNumber *)v7;
      }
      v9 = [v3 periodicDelay];

      if (v9)
      {
        uint64_t v10 = [v3 batchSize];
        v11 = v2->_batchSize;
        v2->_batchSize = (NSNumber *)v10;
      }
    }
  }
  return v2;
}

- (unint64_t)batchSizeUInteger
{
  v2 = [(APJourneyBatchSettings *)self batchSize];
  id v3 = [v2 integerValue];

  return (unint64_t)v3;
}

- (double)periodicDelayTimeInterval
{
  v2 = [(APJourneyBatchSettings *)self periodicDelay];
  [v2 doubleValue];
  double v4 = (double)(unint64_t)v3;

  return v4;
}

- (NSNumber)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(id)a3
{
}

- (NSNumber)periodicDelay
{
  return self->_periodicDelay;
}

- (void)setPeriodicDelay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicDelay, 0);

  objc_storeStrong((id *)&self->_batchSize, 0);
}

@end