@interface SignpostSupportValueStats
- (BOOL)supportsDynamicPercentiles;
- (NSArray)sortedValues;
- (NSString)debugDescription;
- (NSString)unitsLabel;
- (SignpostSupportValueStats)initWithValues:(id)a3 unitsLabel:(id)a4 supportsDynamicPercentiles:(BOOL)a5;
- (double)average;
- (double)max;
- (double)min;
- (double)p50;
- (double)p90;
- (double)p95;
- (double)p99;
- (double)stddev;
- (double)sum;
- (id)dictionaryRepresentation;
- (id)jsonDescription:(unint64_t)a3;
- (id)valueForPercentile:(double)a3;
- (unint64_t)count;
@end

@implementation SignpostSupportValueStats

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(SignpostSupportValueStats *)self jsonDescription:3];
}

- (id)dictionaryRepresentation
{
  v26[11] = *MEMORY[0x1E4F143B8];
  v25[0] = @"Count";
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[SignpostSupportValueStats count](self, "count"));
  v26[0] = v24;
  v25[1] = @"Sum";
  v3 = NSNumber;
  [(SignpostSupportValueStats *)self sum];
  v23 = objc_msgSend(v3, "numberWithDouble:");
  v26[1] = v23;
  v25[2] = @"Average";
  v4 = NSNumber;
  [(SignpostSupportValueStats *)self average];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v26[2] = v5;
  v25[3] = @"Min";
  v6 = NSNumber;
  [(SignpostSupportValueStats *)self min];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  v26[3] = v7;
  v25[4] = @"Max";
  v8 = NSNumber;
  [(SignpostSupportValueStats *)self max];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  v26[4] = v9;
  v25[5] = @"StdDev";
  v10 = NSNumber;
  [(SignpostSupportValueStats *)self stddev];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  v26[5] = v11;
  v25[6] = @"P50";
  v12 = NSNumber;
  [(SignpostSupportValueStats *)self p50];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  v26[6] = v13;
  v25[7] = @"P90";
  v14 = NSNumber;
  [(SignpostSupportValueStats *)self p90];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  v26[7] = v15;
  v25[8] = @"P95";
  v16 = NSNumber;
  [(SignpostSupportValueStats *)self p95];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  v26[8] = v17;
  v25[9] = @"P99";
  v18 = NSNumber;
  [(SignpostSupportValueStats *)self p99];
  v19 = objc_msgSend(v18, "numberWithDouble:");
  v26[9] = v19;
  v25[10] = @"Units";
  v20 = [(SignpostSupportValueStats *)self unitsLabel];
  v26[10] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:11];

  return v21;
}

- (SignpostSupportValueStats)initWithValues:(id)a3 unitsLabel:(id)a4 supportsDynamicPercentiles:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 sortedArrayUsingSelector:sel_compare_];
  unint64_t v11 = [v8 count];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
  double v14 = 0.0;
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v37;
    double v17 = 0.0;
    double v18 = 1.79769313e308;
    double v19 = 0.0;
    double v20 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * i) doubleValue];
        double v20 = v20 + v22;
        if (v18 >= v22) {
          double v18 = v22;
        }
        if (v19 < v22) {
          double v19 = v22;
        }
        double v17 = v17 + v22 * v22;
      }
      uint64_t v15 = [v12 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v15);
  }
  else
  {
    double v18 = 1.79769313e308;
    double v17 = 0.0;
    double v19 = 0.0;
    double v20 = 0.0;
  }

  double v23 = 0.0;
  if ([v10 count])
  {
    double v14 = sqrt((v17 - v20 * v20 / (double)v11) / (double)v11);
    double v23 = v18;
  }
  v35.receiver = self;
  v35.super_class = (Class)SignpostSupportValueStats;
  v24 = [(SignpostSupportValueStats *)&v35 init];
  v25 = v24;
  if (v24)
  {
    if (v5)
    {
      if (!v10) {
        v10 = (void *)MEMORY[0x1E4F1CBF0];
      }
      objc_storeStrong((id *)&v24->_sortedValues, v10);
    }
    objc_storeStrong((id *)&v25->_unitsLabel, a4);
    v25->_count = v11;
    v25->_sum = v20;
    v25->_min = v23;
    v25->_max = v19;
    v25->_stddev = v14;
    v26 = _valueForPercentile(v10, 50.0);
    [v26 doubleValue];
    v25->_p50 = v27;

    v28 = _valueForPercentile(v10, 90.0);
    [v28 doubleValue];
    v25->_p90 = v29;

    v30 = _valueForPercentile(v10, 95.0);
    [v30 doubleValue];
    v25->_p95 = v31;

    v32 = _valueForPercentile(v10, 99.0);
    [v32 doubleValue];
    v25->_p99 = v33;
  }
  return v25;
}

- (double)average
{
  if (![(SignpostSupportValueStats *)self count]) {
    return 0.0;
  }
  [(SignpostSupportValueStats *)self sum];
  return v3 / (double)[(SignpostSupportValueStats *)self count];
}

- (id)valueForPercentile:(double)a3
{
  v4 = [(SignpostSupportValueStats *)self sortedValues];
  BOOL v5 = _valueForPercentile(v4, a3);

  return v5;
}

- (BOOL)supportsDynamicPercentiles
{
  v2 = [(SignpostSupportValueStats *)self sortedValues];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)count
{
  return self->_count;
}

- (double)sum
{
  return self->_sum;
}

- (double)min
{
  return self->_min;
}

- (double)max
{
  return self->_max;
}

- (double)stddev
{
  return self->_stddev;
}

- (double)p50
{
  return self->_p50;
}

- (double)p90
{
  return self->_p90;
}

- (double)p95
{
  return self->_p95;
}

- (double)p99
{
  return self->_p99;
}

- (NSString)unitsLabel
{
  return self->_unitsLabel;
}

- (NSArray)sortedValues
{
  return self->_sortedValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedValues, 0);

  objc_storeStrong((id *)&self->_unitsLabel, 0);
}

@end