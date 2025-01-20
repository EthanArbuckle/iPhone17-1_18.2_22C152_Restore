@interface ICURLAggregatedPerformanceMetrics
+ (id)aggregatedMetricsFromAggregatedMetrics:(id)a3 addingAggregatedMetrics:(id)a4;
+ (id)aggregatedMetricsFromAggregatedMetrics:(id)a3 addingMetrics:(id)a4;
- (BOOL)isNotEmpty;
- (ICURLAggregatedPerformanceMetrics)initWithURLMetrics:(id)a3;
- (NSArray)urlMetrics;
- (double)networkTime;
- (void)setUrlMetrics:(id)a3;
@end

@implementation ICURLAggregatedPerformanceMetrics

- (void).cxx_destruct
{
}

- (NSArray)urlMetrics
{
  return self->_urlMetrics;
}

+ (id)aggregatedMetricsFromAggregatedMetrics:(id)a3 addingMetrics:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = [v5 urlMetrics];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      v9 = [v5 urlMetrics];
      v10 = [v9 arrayByAddingObject:v6];

      v11 = [ICURLAggregatedPerformanceMetrics alloc];
    }
    else
    {
      v13 = [ICURLAggregatedPerformanceMetrics alloc];
      v15[0] = v6;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      v11 = v13;
    }
    v12 = [(ICURLAggregatedPerformanceMetrics *)v11 initWithURLMetrics:v10];
  }
  else
  {
    v12 = (ICURLAggregatedPerformanceMetrics *)v5;
  }

  return v12;
}

- (ICURLAggregatedPerformanceMetrics)initWithURLMetrics:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICURLAggregatedPerformanceMetrics;
  id v5 = [(ICURLAggregatedPerformanceMetrics *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(ICURLAggregatedPerformanceMetrics *)v5 setUrlMetrics:v4];
  }

  return v6;
}

- (void)setUrlMetrics:(id)a3
{
}

- (double)networkTime
{
  v2 = [(ICURLAggregatedPerformanceMetrics *)self urlMetrics];
  v3 = (void *)[v2 mutableCopy];

  double v4 = 0.0;
  while ([v3 count])
  {
    id v5 = [v3 lastObject];
    [v5 fetchStartTime];
    double v7 = v6;
    [v5 endTime];
    if (v7 >= v8) {
      double v9 = v7;
    }
    else {
      double v9 = v8;
    }
    [v3 removeLastObject];
    uint64_t v10 = [v3 count];
    if (v10 - 1 >= 1)
    {
      do
      {
        v11 = [v3 objectAtIndexedSubscript:--v10];
        [v11 fetchStartTime];
        if (v12 <= v9)
        {
          [v11 responseEndTime];
          if (v13 >= v7)
          {
            [v11 fetchStartTime];
            if (v14 < v7) {
              double v7 = v14;
            }
            [v11 endTime];
            if (v15 >= v9) {
              double v9 = v15;
            }
            [v3 removeObjectAtIndex:v10];
          }
        }
      }
      while (v10 > 1);
    }
    double v4 = v4 + v9 - v7;
  }
  return v4;
}

- (BOOL)isNotEmpty
{
  v2 = [(ICURLAggregatedPerformanceMetrics *)self urlMetrics];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

+ (id)aggregatedMetricsFromAggregatedMetrics:(id)a3 addingAggregatedMetrics:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 urlMetrics];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    double v9 = [v6 urlMetrics];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      v11 = [v5 urlMetrics];
      double v12 = [v6 urlMetrics];
      double v13 = [v11 arrayByAddingObjectsFromArray:v12];

      double v14 = [[ICURLAggregatedPerformanceMetrics alloc] initWithURLMetrics:v13];
      goto LABEL_7;
    }
    double v15 = (ICURLAggregatedPerformanceMetrics *)v5;
  }
  else
  {
    double v15 = (ICURLAggregatedPerformanceMetrics *)v6;
  }
  double v14 = v15;
LABEL_7:

  return v14;
}

@end