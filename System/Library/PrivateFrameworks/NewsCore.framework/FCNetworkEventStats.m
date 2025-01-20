@interface FCNetworkEventStats
- (FCNetworkEventStats)initWithValues:(id)a3;
- (unint64_t)count;
- (unint64_t)max;
- (unint64_t)mean;
- (unint64_t)median;
- (unint64_t)min;
- (unint64_t)percentile95;
- (void)setCount:(unint64_t)a3;
- (void)setMax:(unint64_t)a3;
- (void)setMean:(unint64_t)a3;
- (void)setMedian:(unint64_t)a3;
- (void)setMin:(unint64_t)a3;
- (void)setPercentile95:(unint64_t)a3;
@end

@implementation FCNetworkEventStats

- (FCNetworkEventStats)initWithValues:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)FCNetworkEventStats;
  v5 = [(FCNetworkEventStats *)&v43 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF > 0"];
    v7 = [v4 filteredArrayUsingPredicate:v6];
    if ([v7 count])
    {
      v5->_count = [v7 count];
      v8 = [NSString stringWithFormat:@"@min.self"];
      v9 = [v7 valueForKeyPath:v8];
      [v9 doubleValue];
      v5->_min = (unint64_t)v10;

      v11 = [NSString stringWithFormat:@"@max.self"];
      v12 = [v7 valueForKeyPath:v11];
      [v12 doubleValue];
      v5->_max = (unint64_t)v13;

      v14 = [NSString stringWithFormat:@"@avg.self"];
      v15 = [v7 valueForKeyPath:v14];
      [v15 doubleValue];
      v5->_mean = (unint64_t)v16;

      v17 = [v7 sortedArrayUsingSelector:sel_compare_];
      double v18 = (double)(unint64_t)[v17 count] * 0.5;
      double v19 = (double)(unint64_t)[v17 count] * 0.95;
      double v20 = floor(v18);
      double v21 = (double)(unint64_t)([v7 count] - 1);
      if (v20 < v21) {
        double v21 = v20;
      }
      unint64_t v22 = (unint64_t)v21;
      double v23 = ceil(v18);
      double v24 = (double)(unint64_t)([v7 count] - 1);
      if (v23 < v24) {
        double v24 = v23;
      }
      unint64_t v25 = (unint64_t)v24;
      double v26 = floor(v19);
      double v27 = (double)(unint64_t)([v7 count] - 1);
      if (v26 < v27) {
        double v27 = v26;
      }
      unint64_t v28 = (unint64_t)v27;
      double v29 = ceil(v19);
      double v30 = (double)(unint64_t)([v7 count] - 1);
      if (v29 < v30) {
        double v30 = v29;
      }
      unint64_t v31 = (unint64_t)v30;
      v32 = [v17 objectAtIndex:v22];
      [v32 doubleValue];
      double v34 = v33;
      v35 = [v17 objectAtIndex:v25];
      [v35 doubleValue];
      v5->_median = (unint64_t)((v34 + v36) * 0.5);

      v37 = [v17 objectAtIndex:v28];
      [v37 doubleValue];
      double v39 = v38;
      v40 = [v17 objectAtIndex:v31];
      [v40 doubleValue];
      v5->_percentile95 = (unint64_t)((v39 + v41) * 0.5);
    }
  }

  return v5;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)mean
{
  return self->_mean;
}

- (void)setMean:(unint64_t)a3
{
  self->_mean = a3;
}

- (unint64_t)median
{
  return self->_median;
}

- (void)setMedian:(unint64_t)a3
{
  self->_median = a3;
}

- (unint64_t)percentile95
{
  return self->_percentile95;
}

- (void)setPercentile95:(unint64_t)a3
{
  self->_percentile95 = a3;
}

- (unint64_t)min
{
  return self->_min;
}

- (void)setMin:(unint64_t)a3
{
  self->_min = a3;
}

- (unint64_t)max
{
  return self->_max;
}

- (void)setMax:(unint64_t)a3
{
  self->_max = a3;
}

@end