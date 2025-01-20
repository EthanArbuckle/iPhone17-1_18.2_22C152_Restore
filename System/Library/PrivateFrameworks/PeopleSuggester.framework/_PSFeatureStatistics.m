@interface _PSFeatureStatistics
- (NSDictionary)percentiles;
- (NSMutableArray)list;
- (_PSFeatureStatistics)initWithList:(id)a3;
- (double)avg;
- (double)max;
- (double)min;
- (double)mode;
- (double)stdev;
- (void)addValue:(id)a3;
- (void)calculateStats;
- (void)setAvg:(double)a3;
- (void)setList:(id)a3;
- (void)setMax:(double)a3;
- (void)setMin:(double)a3;
- (void)setMode:(double)a3;
- (void)setPercentiles:(id)a3;
- (void)setStdev:(double)a3;
@end

@implementation _PSFeatureStatistics

- (_PSFeatureStatistics)initWithList:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PSFeatureStatistics;
  v5 = [(_PSFeatureStatistics *)&v8 init];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v4];
    [(_PSFeatureStatistics *)v5 setList:v6];

    [(_PSFeatureStatistics *)v5 calculateStats];
  }

  return v5;
}

- (void)calculateStats
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  double v3 = 0.0;
  [(_PSFeatureStatistics *)self setMax:0.0];
  [(_PSFeatureStatistics *)self setMin:100.0];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = [(_PSFeatureStatistics *)self list];
  uint64_t v5 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
  double v6 = 0.0;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v64 != v8) {
          objc_enumerationMutation(obj);
        }
        [*(id *)(*((void *)&v63 + 1) + 8 * i) doubleValue];
        double v11 = v10;
        [(_PSFeatureStatistics *)self max];
        if (v11 > v12) {
          [(_PSFeatureStatistics *)self setMax:v11];
        }
        [(_PSFeatureStatistics *)self min];
        if (v11 < v13) {
          [(_PSFeatureStatistics *)self setMin:v11];
        }
        v14 = objc_msgSend(NSString, "stringWithFormat:", @"%.01f", *(void *)&v11);
        v15 = [v4 valueForKey:v14];

        v16 = NSNumber;
        if (v15)
        {
          v17 = [v4 objectForKeyedSubscript:v14];
          v18 = objc_msgSend(v16, "numberWithInt:", objc_msgSend(v17, "intValue") + 1);
          [v4 setObject:v18 forKeyedSubscript:v14];
        }
        else
        {
          v17 = [NSNumber numberWithInt:1];
          [v4 setValue:v17 forKey:v14];
        }
        double v6 = v6 + v11;
        double v3 = v3 + v11 * v11;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
    }
    while (v7);
  }

  [(_PSFeatureStatistics *)self setMode:0.0];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v19 = v4;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    int v22 = 0;
    uint64_t v23 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v60 != v23) {
          objc_enumerationMutation(v19);
        }
        v25 = *(void **)(*((void *)&v59 + 1) + 8 * j);
        v26 = [v19 valueForKey:v25];
        int v27 = [v26 intValue];

        if (v27 > v22)
        {
          [v25 doubleValue];
          -[_PSFeatureStatistics setMode:](self, "setMode:");
          int v22 = v27;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v59 objects:v67 count:16];
    }
    while (v21);
  }

  v28 = [(_PSFeatureStatistics *)self list];
  uint64_t v29 = [v28 count];

  if (!v29)
  {
    [(_PSFeatureStatistics *)self setMax:0.0];
    [(_PSFeatureStatistics *)self setMin:0.0];
  }
  [(_PSFeatureStatistics *)self setAvg:0.0];
  [(_PSFeatureStatistics *)self setStdev:0.0];
  v30 = [(_PSFeatureStatistics *)self list];
  uint64_t v31 = [v30 count];

  if (v31)
  {
    v32 = [(_PSFeatureStatistics *)self list];
    -[_PSFeatureStatistics setAvg:](self, "setAvg:", v6 / (double)(unint64_t)[v32 count]);

    v33 = [(_PSFeatureStatistics *)self list];
    double v34 = v3 - v6 * v6 / (double)(unint64_t)[v33 count];
    v35 = [(_PSFeatureStatistics *)self list];
    double v36 = v34 / (double)(unint64_t)([v35 count] - 1);

    [(_PSFeatureStatistics *)self setStdev:sqrt(v36)];
  }
  v37 = [(_PSFeatureStatistics *)self list];
  v38 = [v37 sortedArrayUsingSelector:sel_compare_];
  v39 = (void *)[v38 mutableCopy];
  [(_PSFeatureStatistics *)self setList:v39];

  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v41 = [(_PSFeatureStatistics *)self list];
  uint64_t v42 = [v41 count];

  if (v42)
  {
    v43 = [(_PSFeatureStatistics *)self list];
    v44 = [(_PSFeatureStatistics *)self list];
    v45 = objc_msgSend(v43, "objectAtIndexedSubscript:", (int)(ceil((double)(unint64_t)objc_msgSend(v44, "count") * 0.1) + -1.0));
    [v40 setObject:v45 forKeyedSubscript:@"10%"];

    v46 = [(_PSFeatureStatistics *)self list];
    v47 = [(_PSFeatureStatistics *)self list];
    v48 = objc_msgSend(v46, "objectAtIndexedSubscript:", (int)(ceil((double)(unint64_t)objc_msgSend(v47, "count") * 0.25) + -1.0));
    [v40 setObject:v48 forKeyedSubscript:@"25%"];

    v49 = [(_PSFeatureStatistics *)self list];
    v50 = [(_PSFeatureStatistics *)self list];
    v51 = objc_msgSend(v49, "objectAtIndexedSubscript:", (int)(ceil((double)(unint64_t)objc_msgSend(v50, "count") * 0.5) + -1.0));
    [v40 setObject:v51 forKeyedSubscript:@"50%"];

    v52 = [(_PSFeatureStatistics *)self list];
    v53 = [(_PSFeatureStatistics *)self list];
    v54 = objc_msgSend(v52, "objectAtIndexedSubscript:", (int)(ceil((double)(unint64_t)objc_msgSend(v53, "count") * 0.75) + -1.0));
    [v40 setObject:v54 forKeyedSubscript:@"75%"];

    v55 = [(_PSFeatureStatistics *)self list];
    v56 = [(_PSFeatureStatistics *)self list];
    v57 = objc_msgSend(v55, "objectAtIndexedSubscript:", (int)(ceil((double)(unint64_t)objc_msgSend(v56, "count") * 0.9) + -1.0));
    [v40 setObject:v57 forKeyedSubscript:@"90%"];
  }
  [(_PSFeatureStatistics *)self setPercentiles:v40];
}

- (void)addValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_PSFeatureStatistics *)self list];
  [v5 addObject:v4];

  [(_PSFeatureStatistics *)self calculateStats];
}

- (NSMutableArray)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (double)avg
{
  return self->_avg;
}

- (void)setAvg:(double)a3
{
  self->_avg = a3;
}

- (double)stdev
{
  return self->_stdev;
}

- (void)setStdev:(double)a3
{
  self->_stdev = a3;
}

- (double)mode
{
  return self->_mode;
}

- (void)setMode:(double)a3
{
  self->_mode = a3;
}

- (NSDictionary)percentiles
{
  return self->_percentiles;
}

- (void)setPercentiles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentiles, 0);

  objc_storeStrong((id *)&self->_list, 0);
}

@end