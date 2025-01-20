@interface MBCKThroughputEstimator
- (MBCKThroughputEstimator)initWithSamplingPeriod:(double)a3 maximumNumberOfPeriods:(unint64_t)a4;
- (NSDate)startDateOfCurrentPeriod;
- (NSMutableArray)throughputs;
- (double)samplingPeriod;
- (unint64_t)maxSamplingPeriods;
- (unint64_t)uploadedBytesInCurrentPeriod;
- (void)_storeAndComputeThroughput:(id)a3;
- (void)finishSampling;
- (void)incrementRetryCount;
- (void)sampleUploadedBytes:(unint64_t)a3;
- (void)setMaxSamplingPeriods:(unint64_t)a3;
- (void)setSamplingPeriod:(double)a3;
- (void)setStartDateOfCurrentPeriod:(id)a3;
- (void)setThroughputs:(id)a3;
- (void)setUploadedBytesInCurrentPeriod:(unint64_t)a3;
@end

@implementation MBCKThroughputEstimator

- (MBCKThroughputEstimator)initWithSamplingPeriod:(double)a3 maximumNumberOfPeriods:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MBCKThroughputEstimator;
  v6 = [(MBCKThroughputEstimator *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(MBCKThroughputEstimator *)v6 setSamplingPeriod:a3];
    [(MBCKThroughputEstimator *)v7 setMaxSamplingPeriods:a4];
    v8 = objc_opt_new();
    [(MBCKThroughputEstimator *)v7 setThroughputs:v8];

    [(MBCKThroughputEstimator *)v7 setStartDateOfCurrentPeriod:0];
    [(MBCKThroughputEstimator *)v7 setUploadedBytesInCurrentPeriod:0];
    atomic_store(0, &v7->_retriesInCurrentPeriod);
  }
  return v7;
}

- (void)sampleUploadedBytes:(unint64_t)a3
{
  id v11 = +[NSDate now];
  v5 = [(MBCKThroughputEstimator *)self startDateOfCurrentPeriod];

  if (!v5) {
    [(MBCKThroughputEstimator *)self setStartDateOfCurrentPeriod:v11];
  }
  v6 = [(MBCKThroughputEstimator *)self startDateOfCurrentPeriod];
  [v11 timeIntervalSinceDate:v6];
  double v8 = v7;
  [(MBCKThroughputEstimator *)self samplingPeriod];
  double v10 = v9;

  if (v8 >= v10)
  {
    [(MBCKThroughputEstimator *)self _storeAndComputeThroughput:v11];
    [(MBCKThroughputEstimator *)self setStartDateOfCurrentPeriod:v11];
  }
  else
  {
    a3 += [(MBCKThroughputEstimator *)self uploadedBytesInCurrentPeriod];
  }
  [(MBCKThroughputEstimator *)self setUploadedBytesInCurrentPeriod:a3];
}

- (void)_storeAndComputeThroughput:(id)a3
{
  id v16 = a3;
  v4 = [(MBCKThroughputEstimator *)self startDateOfCurrentPeriod];

  if (v4)
  {
    v5 = +[NSDateFormatter ISO8601Formatter];
    v6 = [(MBCKThroughputEstimator *)self startDateOfCurrentPeriod];
    double v7 = [v5 stringFromDate:v6];

    unint64_t v8 = atomic_exchange((atomic_ullong *volatile)&self->_retriesInCurrentPeriod, 0);
    double v9 = (double)[(MBCKThroughputEstimator *)self uploadedBytesInCurrentPeriod];
    double v10 = [(MBCKThroughputEstimator *)self startDateOfCurrentPeriod];
    [v16 timeIntervalSinceDate:v10];
    unint64_t v12 = (unint64_t)(v9 / v11);

    throughputs = self->_throughputs;
    v14 = +[NSString stringWithFormat:@"%@|%lu|%lu", v7, v12, v8];
    [(NSMutableArray *)throughputs addObject:v14];

    id v15 = [(NSMutableArray *)self->_throughputs count];
    if (v15 > (id)[(MBCKThroughputEstimator *)self maxSamplingPeriods]) {
      [(NSMutableArray *)self->_throughputs removeObjectAtIndex:0];
    }
  }
}

- (void)incrementRetryCount
{
}

- (void)finishSampling
{
  id v3 = +[NSDate now];
  [(MBCKThroughputEstimator *)self _storeAndComputeThroughput:v3];
}

- (NSMutableArray)throughputs
{
  return self->_throughputs;
}

- (void)setThroughputs:(id)a3
{
}

- (double)samplingPeriod
{
  return self->_samplingPeriod;
}

- (void)setSamplingPeriod:(double)a3
{
  self->_samplingPeriod = a3;
}

- (unint64_t)maxSamplingPeriods
{
  return self->_maxSamplingPeriods;
}

- (void)setMaxSamplingPeriods:(unint64_t)a3
{
  self->_maxSamplingPeriods = a3;
}

- (NSDate)startDateOfCurrentPeriod
{
  return self->_startDateOfCurrentPeriod;
}

- (void)setStartDateOfCurrentPeriod:(id)a3
{
}

- (unint64_t)uploadedBytesInCurrentPeriod
{
  return self->_uploadedBytesInCurrentPeriod;
}

- (void)setUploadedBytesInCurrentPeriod:(unint64_t)a3
{
  self->_uploadedBytesInCurrentPeriod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDateOfCurrentPeriod, 0);
  objc_storeStrong((id *)&self->_throughputs, 0);
}

@end