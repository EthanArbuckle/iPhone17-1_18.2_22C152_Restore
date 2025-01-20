@interface MOAnalyticsStats
- (MOAnalyticsStats)init;
- (MOAnalyticsStats)initWithTimeSeries:(id)a3;
- (double)max;
- (double)mean;
- (double)min;
- (double)std;
- (unint64_t)count;
- (void)setCount:(unint64_t)a3;
- (void)setMax:(double)a3;
- (void)setMean:(double)a3;
- (void)setMin:(double)a3;
- (void)setStd:(double)a3;
@end

@implementation MOAnalyticsStats

- (MOAnalyticsStats)init
{
  v3.receiver = self;
  v3.super_class = (Class)MOAnalyticsStats;
  result = [(MOAnalyticsStats *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_min = xmmword_1002BB0B0;
    result->_std = 0.0;
    result->_count = 0;
    result->_mean = 0.0;
  }
  return result;
}

- (MOAnalyticsStats)initWithTimeSeries:(id)a3
{
  id v4 = a3;
  v5 = [(MOAnalyticsStats *)self init];
  if (v5)
  {
    v5->_count = (unint64_t)[v4 count];
    if ([v4 count])
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v6 = v4;
      id v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
      double v8 = 0.0;
      double v9 = 0.0;
      if (v7)
      {
        id v10 = v7;
        uint64_t v11 = *(void *)v31;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v31 != v11) {
              objc_enumerationMutation(v6);
            }
            v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            double min = v5->_min;
            [v13 value];
            if (min < v15) {
              double v15 = min;
            }
            v5->_double min = v15;
            double max = v5->_max;
            [v13 value];
            if (max >= v17) {
              double v17 = max;
            }
            v5->_double max = v17;
            [v13 value];
            double v9 = v9 + v18;
          }
          id v10 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v10);
      }

      v5->_mean = v9 / (double)v5->_count;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v19 = v6;
      id v20 = [v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v27;
        double v8 = 0.0;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v27 != v22) {
              objc_enumerationMutation(v19);
            }
            [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) value:v26];
            double v8 = v8 + (v24 - v5->_mean) * (v24 - v5->_mean);
          }
          id v21 = [v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
        }
        while (v21);
      }

      v5->_std = v8 / (double)v5->_count;
    }
  }

  return v5;
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_double min = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_double max = a3;
}

- (double)mean
{
  return self->_mean;
}

- (void)setMean:(double)a3
{
  self->_mean = a3;
}

- (double)std
{
  return self->_std;
}

- (void)setStd:(double)a3
{
  self->_std = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

@end