@interface ICCloudThrottlingLevel
- (ICCloudThrottlingLevel)initWithBatchInterval:(double)a3 numberOfBatches:(unint64_t)a4;
- (double)batchInterval;
- (id)description;
- (unint64_t)numberOfBatches;
- (void)setBatchInterval:(double)a3;
- (void)setNumberOfBatches:(unint64_t)a3;
@end

@implementation ICCloudThrottlingLevel

- (ICCloudThrottlingLevel)initWithBatchInterval:(double)a3 numberOfBatches:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ICCloudThrottlingLevel;
  v6 = [(ICCloudThrottlingLevel *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(ICCloudThrottlingLevel *)v6 setBatchInterval:a3];
    [(ICCloudThrottlingLevel *)v7 setNumberOfBatches:a4];
  }
  return v7;
}

- (id)description
{
  [(ICCloudThrottlingLevel *)self batchInterval];
  return +[NSString stringWithFormat:@"<batchInterval=%d numberOfBatches=%d>", (int)v3, [(ICCloudThrottlingLevel *)self numberOfBatches]];
}

- (double)batchInterval
{
  return self->_batchInterval;
}

- (void)setBatchInterval:(double)a3
{
  self->_batchInterval = a3;
}

- (unint64_t)numberOfBatches
{
  return self->_numberOfBatches;
}

- (void)setNumberOfBatches:(unint64_t)a3
{
  self->_numberOfBatches = a3;
}

@end