@interface _PSContactFillerDataCollectionStatistics
- (NSMutableArray)list;
- (_PSContactFillerDataCollectionStatistics)initWithList:(id)a3;
- (double)avg;
- (double)max;
- (double)min;
- (double)stdev;
- (void)addValue:(id)a3;
- (void)calculateStats;
- (void)setAvg:(double)a3;
- (void)setList:(id)a3;
- (void)setMax:(double)a3;
- (void)setMin:(double)a3;
- (void)setStdev:(double)a3;
@end

@implementation _PSContactFillerDataCollectionStatistics

- (_PSContactFillerDataCollectionStatistics)initWithList:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PSContactFillerDataCollectionStatistics;
  v5 = [(_PSContactFillerDataCollectionStatistics *)&v8 init];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v4];
    [(_PSContactFillerDataCollectionStatistics *)v5 setList:v6];

    [(_PSContactFillerDataCollectionStatistics *)v5 calculateStats];
  }

  return v5;
}

- (void)calculateStats
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  double v3 = 0.0;
  [(_PSContactFillerDataCollectionStatistics *)self setMax:0.0];
  [(_PSContactFillerDataCollectionStatistics *)self setMin:100.0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [(_PSContactFillerDataCollectionStatistics *)self list];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  double v6 = 0.0;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v9) doubleValue];
        double v11 = v10;
        [(_PSContactFillerDataCollectionStatistics *)self max];
        if (v11 > v12) {
          [(_PSContactFillerDataCollectionStatistics *)self setMax:v11];
        }
        [(_PSContactFillerDataCollectionStatistics *)self min];
        if (v11 < v13) {
          [(_PSContactFillerDataCollectionStatistics *)self setMin:v11];
        }
        double v6 = v6 + v11;
        double v3 = v3 + v11 * v11;
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  v14 = [(_PSContactFillerDataCollectionStatistics *)self list];
  uint64_t v15 = [v14 count];

  if (!v15)
  {
    [(_PSContactFillerDataCollectionStatistics *)self setMax:0.0];
    [(_PSContactFillerDataCollectionStatistics *)self setMin:0.0];
  }
  [(_PSContactFillerDataCollectionStatistics *)self setAvg:0.0];
  [(_PSContactFillerDataCollectionStatistics *)self setStdev:0.0];
  v16 = [(_PSContactFillerDataCollectionStatistics *)self list];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    v18 = [(_PSContactFillerDataCollectionStatistics *)self list];
    -[_PSContactFillerDataCollectionStatistics setAvg:](self, "setAvg:", v6 / (double)(unint64_t)[v18 count]);

    v19 = [(_PSContactFillerDataCollectionStatistics *)self list];
    double v20 = v3 - v6 * v6 / (double)(unint64_t)[v19 count];
    v21 = [(_PSContactFillerDataCollectionStatistics *)self list];
    double v22 = v20 / (double)(unint64_t)([v21 count] - 1);

    [(_PSContactFillerDataCollectionStatistics *)self setStdev:sqrt(v22)];
  }
  [(_PSContactFillerDataCollectionStatistics *)self max];
  +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForDouble:");
  -[_PSContactFillerDataCollectionStatistics setMax:](self, "setMax:");
  [(_PSContactFillerDataCollectionStatistics *)self min];
  +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForDouble:");
  -[_PSContactFillerDataCollectionStatistics setMin:](self, "setMin:");
  [(_PSContactFillerDataCollectionStatistics *)self avg];
  +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForDouble:");
  -[_PSContactFillerDataCollectionStatistics setAvg:](self, "setAvg:");
  [(_PSContactFillerDataCollectionStatistics *)self stdev];
  +[_PSContactFillerDataCollectionUtilities enforceOneSignificantFigureForDouble:](_PSContactFillerDataCollectionUtilities, "enforceOneSignificantFigureForDouble:");
  -[_PSContactFillerDataCollectionStatistics setStdev:](self, "setStdev:");
}

- (void)addValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_PSContactFillerDataCollectionStatistics *)self list];
  [v5 addObject:v4];

  [(_PSContactFillerDataCollectionStatistics *)self calculateStats];
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

- (void).cxx_destruct
{
}

@end