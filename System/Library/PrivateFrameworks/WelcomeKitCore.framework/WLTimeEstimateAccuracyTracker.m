@interface WLTimeEstimateAccuracyTracker
- (NSArray)samples;
- (NSArray)thresholds;
- (WLTimeEstimateAccuracyTracker)init;
- (unint64_t)_indexOfThresholdGreaterThanOrEqualToEstimate:(unint64_t)a3;
- (unint64_t)_thresholdAtIndex:(unint64_t)a3;
- (void)didCalculateTimeEstimate:(unint64_t)a3 atDate:(id)a4 associatedObject:(id)a5;
- (void)estimatesDidResolveAtDate:(id)a3 block:(id)a4;
- (void)setSamples:(id)a3;
- (void)setThresholds:(id)a3;
@end

@implementation WLTimeEstimateAccuracyTracker

- (WLTimeEstimateAccuracyTracker)init
{
  v5.receiver = self;
  v5.super_class = (Class)WLTimeEstimateAccuracyTracker;
  v2 = [(WLTimeEstimateAccuracyTracker *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(WLTimeEstimateAccuracyTracker *)v2 setThresholds:&unk_26DF8E660];
    [(WLTimeEstimateAccuracyTracker *)v3 setSamples:MEMORY[0x263EFFA68]];
  }
  return v3;
}

- (unint64_t)_thresholdAtIndex:(unint64_t)a3
{
  objc_super v5 = [(WLTimeEstimateAccuracyTracker *)self thresholds];
  unint64_t v6 = [v5 count];

  v7 = [(WLTimeEstimateAccuracyTracker *)self thresholds];
  v8 = v7;
  if (v6 <= a3)
  {
    v11 = [v7 lastObject];
    uint64_t v12 = [v11 unsignedIntegerValue];

    v8 = [(WLTimeEstimateAccuracyTracker *)self thresholds];
    unint64_t v10 = (a3 - [v8 count] + 2) * v12;
  }
  else
  {
    v9 = [v7 objectAtIndexedSubscript:a3];
    unint64_t v10 = [v9 unsignedIntegerValue];
  }
  return v10;
}

- (unint64_t)_indexOfThresholdGreaterThanOrEqualToEstimate:(unint64_t)a3
{
  unint64_t v5 = -1;
  do
    ++v5;
  while ([(WLTimeEstimateAccuracyTracker *)self _thresholdAtIndex:v5] < a3);
  return v5;
}

- (void)didCalculateTimeEstimate:(unint64_t)a3 atDate:(id)a4 associatedObject:(id)a5
{
  id v16 = a4;
  id v8 = a5;
  if (a3)
  {
    v9 = [(WLTimeEstimateAccuracyTracker *)self samples];
    if ([v9 count])
    {
      unint64_t thresholdBelowLastSample = self->_thresholdBelowLastSample;

      if (thresholdBelowLastSample < a3) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    unint64_t v11 = [(WLTimeEstimateAccuracyTracker *)self _indexOfThresholdGreaterThanOrEqualToEstimate:a3];
    unint64_t v12 = v11 - 1;
    v13 = objc_alloc_init(WLTimeEstimateSample);
    [(WLTimeEstimateSample *)v13 setEstimate:a3];
    [(WLTimeEstimateSample *)v13 setStartDate:v16];
    [(WLTimeEstimateSample *)v13 setThreshold:[(WLTimeEstimateAccuracyTracker *)self _thresholdAtIndex:v11]];
    [(WLTimeEstimateSample *)v13 setAssociatedObject:v8];
    v14 = [(WLTimeEstimateAccuracyTracker *)self samples];
    v15 = [v14 arrayByAddingObject:v13];
    [(WLTimeEstimateAccuracyTracker *)self setSamples:v15];

    self->_unint64_t thresholdBelowLastSample = [(WLTimeEstimateAccuracyTracker *)self _thresholdAtIndex:v12];
  }
LABEL_7:
}

- (void)estimatesDidResolveAtDate:(id)a3 block:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t, unint64_t, void *))a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(WLTimeEstimateAccuracyTracker *)self samples];
  uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        unint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v13 = [v12 startDate];
        [v6 timeIntervalSinceDate:v13];
        double v15 = v14;

        uint64_t v16 = [v12 estimate];
        uint64_t v17 = [v12 threshold];
        v18 = [v12 associatedObject];
        v7[2](v7, v16, v17, vcvtpd_u64_f64(v15), v18);
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
}

- (NSArray)thresholds
{
  return self->_thresholds;
}

- (void)setThresholds:(id)a3
{
}

- (NSArray)samples
{
  return self->_samples;
}

- (void)setSamples:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_thresholds, 0);
}

@end