@interface ATXScoreDistribution
- (ATXScoreDistribution)init;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXDeviceLevelMetricsScoreDistribution:(id)a3;
- (double)max;
- (double)mean;
- (double)min;
- (double)standardDeviation;
- (unint64_t)hash;
- (void)enumerateAsHistogramWithNumberOfBins:(unint64_t)a3 binHandler:(id)a4;
- (void)recordScore:(double)a3;
@end

@implementation ATXScoreDistribution

- (ATXScoreDistribution)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXScoreDistribution;
  v2 = [(ATXScoreDistribution *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    scores = v2->_scores;
    v2->_scores = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)recordScore:(double)a3
{
  if (![(NSMutableArray *)self->_scores count] || self->_min > a3) {
    self->_min = a3;
  }
  if (![(NSMutableArray *)self->_scores count] || self->_max < a3) {
    self->_max = a3;
  }
  self->_sum = self->_sum + a3;
  scores = self->_scores;
  id v6 = [NSNumber numberWithDouble:a3];
  [(NSMutableArray *)scores addObject:v6];
}

- (double)mean
{
  if (![(NSMutableArray *)self->_scores count]) {
    return 0.0;
  }
  double sum = self->_sum;
  return sum / (double)(unint64_t)[(NSMutableArray *)self->_scores count];
}

- (double)standardDeviation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_scores count]) {
    return 0.0;
  }
  [(ATXScoreDistribution *)self mean];
  double v4 = v3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_scores;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "doubleValue", (void)v13);
        double v9 = v9 + (v11 - v4) * (v11 - v4);
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  return sqrt(v9 / (double)(unint64_t)[(NSMutableArray *)self->_scores count]);
}

- (void)enumerateAsHistogramWithNumberOfBins:(unint64_t)a3 binHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(void, __n128, __n128, __n128))a4;
  if (a3 && [(NSMutableArray *)self->_scores count])
  {
    v8.n128_u64[0] = *(void *)&self->_min;
    v9.n128_u64[0] = *(void *)&self->_max;
    if (v8.n128_f64[0] == v9.n128_f64[0])
    {
      v7.n128_u64[0] = 1.0;
      v6[2](v6, v7, v8, v9);
    }
    else
    {
      v23 = v6;
      v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
      unint64_t v11 = a3;
      do
      {
        [v10 addObject:&unk_1F0627DC0];
        --v11;
      }
      while (v11);
      double v12 = (self->_max - self->_min) / (double)a3;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      obj = self->_scores;
      uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v29;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v29 != v15) {
              objc_enumerationMutation(obj);
            }
            [*(id *)(*((void *)&v28 + 1) + 8 * v16) doubleValue];
            double v18 = (v17 - self->_min) / v12;
            if ((unint64_t)v18 >= a3) {
              unint64_t v19 = a3 - 1;
            }
            else {
              unint64_t v19 = (unint64_t)v18;
            }
            v20 = NSNumber;
            v21 = [v10 objectAtIndexedSubscript:v19];
            v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "unsignedIntegerValue") + 1);
            [v10 setObject:v22 atIndexedSubscript:v19];

            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v14);
      }

      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __72__ATXScoreDistribution_enumerateAsHistogramWithNumberOfBins_binHandler___block_invoke;
      v25[3] = &unk_1E5F00D70;
      double v27 = v12;
      v25[4] = self;
      uint64_t v6 = v23;
      v26 = v23;
      [v10 enumerateObjectsUsingBlock:v25];
    }
  }
  else
  {
    v7.n128_u64[0] = 0;
    v8.n128_u64[0] = 0;
    v9.n128_u64[0] = 0;
    v6[2](v6, v7, v8, v9);
  }
}

uint64_t __72__ATXScoreDistribution_enumerateAsHistogramWithNumberOfBins_binHandler___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v4 = *(double *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 40);
  double v6 = *(double *)(*(void *)(a1 + 32) + 24) + (double)a3 * v4;
  double v7 = v4 + v6;
  [a2 doubleValue];
  v9.n128_f64[0] = v8 / (double)(unint64_t)[*(id *)(*(void *)(a1 + 32) + 8) count];
  v10 = *(uint64_t (**)(uint64_t, __n128, __n128, __n128))(v5 + 16);
  v11.n128_f64[0] = v6;
  v12.n128_f64[0] = v7;
  return v10(v5, v9, v11, v12);
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (ATXScoreDistribution *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXScoreDistribution *)self isEqualToATXDeviceLevelMetricsScoreDistribution:v5];

  return v6;
}

- (BOOL)isEqualToATXDeviceLevelMetricsScoreDistribution:(id)a3
{
  double v4 = self->_scores;
  uint64_t v5 = v4;
  if (v4 == *((NSMutableArray **)a3 + 1)) {
    char v6 = 1;
  }
  else {
    char v6 = -[NSMutableArray isEqual:](v4, "isEqual:");
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_scores hash];
}

- (double)min
{
  return self->_min;
}

- (double)max
{
  return self->_max;
}

- (void).cxx_destruct
{
}

@end