@interface ICCloudThrottlingLevel
- (ICCloudThrottlingLevel)init;
- (ICCloudThrottlingLevel)initWithBatchInterval:(double)a3 maximumBatchIntervalFactor:(double)a4 numberOfBatches:(unint64_t)a5;
- (double)batchInterval;
- (double)maximumBatchIntervalFactor;
- (id)description;
- (unint64_t)numberOfBatches;
@end

@implementation ICCloudThrottlingLevel

- (id)description
{
  v3 = NSString;
  [(ICCloudThrottlingLevel *)self batchInterval];
  uint64_t v5 = (int)v4;
  [(ICCloudThrottlingLevel *)self maximumBatchIntervalFactor];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<batchInterval=%d maximumBatchIntervalFactor=%d numberOfBatches=%d>", v5, (int)v6, -[ICCloudThrottlingLevel numberOfBatches](self, "numberOfBatches"));
}

- (double)maximumBatchIntervalFactor
{
  return self->_maximumBatchIntervalFactor;
}

- (double)batchInterval
{
  return self->_batchInterval;
}

- (unint64_t)numberOfBatches
{
  return self->_numberOfBatches;
}

- (ICCloudThrottlingLevel)initWithBatchInterval:(double)a3 maximumBatchIntervalFactor:(double)a4 numberOfBatches:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)ICCloudThrottlingLevel;
  result = [(ICCloudThrottlingLevel *)&v9 init];
  if (result)
  {
    result->_batchInterval = a3;
    result->_maximumBatchIntervalFactor = a4;
    result->_numberOfBatches = a5;
  }
  return result;
}

- (ICCloudThrottlingLevel)init
{
  return 0;
}

@end