@interface HDMHValenceDistributionSummaryBuilder
- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange;
- (BOOL)_value:(double)a3 isBetweenMinValue:(double)a4 maxValue:(double)a5;
- (HDMHValenceDistributionSummaryBuilder)initWithDayIndexRange:(id)a3 gregorianCalendar:(id)a4;
- (NSCalendar)gregorianCalendar;
- (NSMutableArray)dailyValenceValues;
- (NSMutableArray)momentaryValenceDistributions;
- (double)_valenceMergeInterval;
- (double)valenceMergeInterval;
- (id)_calculateAverageDailyValenceDistribution;
- (id)valenceDistributionSummary;
- (void)_mergeAdjacentValenceDistributions:(id)a3;
- (void)_mergeStatesOfMind:(id)a3 intoValenceDistributions:(id)a4;
- (void)addDaySummary:(id)a3;
- (void)setDailyValenceValues:(id)a3;
- (void)setMomentaryValenceDistributions:(id)a3;
- (void)setValenceMergeInterval:(double)a3;
@end

@implementation HDMHValenceDistributionSummaryBuilder

- (HDMHValenceDistributionSummaryBuilder)initWithDayIndexRange:(id)a3 gregorianCalendar:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDMHValenceDistributionSummaryBuilder;
  v9 = [(HDMHValenceDistributionSummaryBuilder *)&v17 init];
  v10 = v9;
  if (v9)
  {
    v9->_dayIndexRange.start = var0;
    v9->_dayIndexRange.duration = var1;
    objc_storeStrong((id *)&v9->_gregorianCalendar, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    dailyValenceValues = v10->_dailyValenceValues;
    v10->_dailyValenceValues = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    momentaryValenceDistributions = v10->_momentaryValenceDistributions;
    v10->_momentaryValenceDistributions = v13;

    [(HDMHValenceDistributionSummaryBuilder *)v10 _valenceMergeInterval];
    v10->_valenceMergeInterval = v15;
  }

  return v10;
}

- (void)addDaySummary:(id)a3
{
  id v10 = a3;
  v4 = [v10 momentaryStatesOfMind];
  [(HDMHValenceDistributionSummaryBuilder *)self _mergeStatesOfMind:v4 intoValenceDistributions:self->_momentaryValenceDistributions];

  v5 = [v10 dailyStateOfMind];

  if (v5)
  {
    v6 = [(HDMHValenceDistributionSummaryBuilder *)self dailyValenceValues];
    v7 = NSNumber;
    id v8 = [v10 dailyStateOfMind];
    [v8 valence];
    v9 = objc_msgSend(v7, "numberWithDouble:");
    [v6 addObject:v9];
  }
}

- (id)valenceDistributionSummary
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:self->_momentaryValenceDistributions];
  if ([(NSMutableArray *)self->_dailyValenceValues count])
  {
    v4 = [(HDMHValenceDistributionSummaryBuilder *)self _calculateAverageDailyValenceDistribution];
    [v3 addObject:v4];
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263F55060]), "initWithDayIndexRange:valenceDistributions:", self->_dayIndexRange.start, self->_dayIndexRange.duration, v3);

  return v5;
}

- (id)_calculateAverageDailyValenceDistribution
{
  v3 = [(NSMutableArray *)self->_dailyValenceValues valueForKeyPath:@"@avg.doubleValue"];
  [v3 doubleValue];
  double v5 = v4;

  v6 = objc_msgSend(objc_alloc(MEMORY[0x263F55058]), "initWithMinimumValence:maximumValence:sampleCount:reflectiveInterval:", -[NSMutableArray count](self->_dailyValenceValues, "count"), 2, v5, v5);
  return v6;
}

- (void)_mergeStatesOfMind:(id)a3 intoValenceDistributions:(id)a4
{
  id v6 = a4;
  objc_msgSend(a3, "hk_map:", &__block_literal_global);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v6 addObjectsFromArray:v7];
  [(HDMHValenceDistributionSummaryBuilder *)self _mergeAdjacentValenceDistributions:v6];
}

id __85__HDMHValenceDistributionSummaryBuilder__mergeStatesOfMind_intoValenceDistributions___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F55058];
  id v3 = a2;
  id v4 = [v2 alloc];
  [v3 valence];
  double v6 = v5;
  [v3 valence];
  double v8 = v7;
  uint64_t v9 = [v3 reflectiveInterval];

  id v10 = (void *)[v4 initWithMinimumValence:1 maximumValence:v9 sampleCount:v6 reflectiveInterval:v8];
  return v10;
}

- (void)_mergeAdjacentValenceDistributions:(id)a3
{
  id v18 = a3;
  [v18 sortUsingComparator:&__block_literal_global_292];
  if ((unint64_t)[v18 count] >= 2)
  {
    int v4 = 0;
    uint64_t v5 = 1;
    int v6 = 1;
    do
    {
      double v7 = [v18 objectAtIndexedSubscript:v5];
      [v7 minimumValence];
      double v9 = v8;

      id v10 = [v18 objectAtIndexedSubscript:v4];
      [v10 minimumValence];
      double v12 = v11 - self->_valenceMergeInterval;

      v13 = [v18 objectAtIndexedSubscript:v4];
      [v13 maximumValence];
      double v15 = v14 + self->_valenceMergeInterval;

      if ([(HDMHValenceDistributionSummaryBuilder *)self _value:v9 isBetweenMinValue:v12 maxValue:v15])
      {
        v16 = [v18 objectAtIndexedSubscript:v4];
        objc_super v17 = [v18 objectAtIndexedSubscript:v5];
        [v16 addValenceDistribution:v17];

        [v18 removeObjectAtIndex:v5];
      }
      else
      {
        ++v4;
        ++v6;
      }
      uint64_t v5 = v6;
    }
    while ([v18 count] > (unint64_t)v6);
  }
}

uint64_t __76__HDMHValenceDistributionSummaryBuilder__mergeAdjacentValenceDistributions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 minimumValence];
  unint64_t v6 = v5;
  [v4 minimumValence];
  unint64_t v8 = v7;

  v9.n128_u64[0] = v6;
  v10.n128_u64[0] = v8;
  return MEMORY[0x270EF3638](v9, v10);
}

- (double)_valenceMergeInterval
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v3 = [v2 objectForKey:@"HDMHMentalHealthValenceMergeInterval"];

  double v4 = 0.001;
  if (v3)
  {
    unint64_t v5 = [MEMORY[0x263F0A980] sharedBehavior];
    int v6 = [v5 isAppleInternalInstall];

    if (v6)
    {
      [v3 doubleValue];
      double v4 = v7;
    }
  }

  return v4;
}

- (BOOL)_value:(double)a3 isBetweenMinValue:(double)a4 maxValue:(double)a5
{
  BOOL v5 = a3 > a4 && a3 < a5;
  return v5 || vabdd_f64(a3, a4) < 2.22044605e-16 || vabdd_f64(a3, a5) < 2.22044605e-16;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange
{
  int64_t duration = self->_dayIndexRange.duration;
  int64_t start = self->_dayIndexRange.start;
  result.int64_t var1 = duration;
  result.int64_t var0 = start;
  return result;
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (NSMutableArray)dailyValenceValues
{
  return self->_dailyValenceValues;
}

- (void)setDailyValenceValues:(id)a3
{
}

- (NSMutableArray)momentaryValenceDistributions
{
  return self->_momentaryValenceDistributions;
}

- (void)setMomentaryValenceDistributions:(id)a3
{
}

- (double)valenceMergeInterval
{
  return self->_valenceMergeInterval;
}

- (void)setValenceMergeInterval:(double)a3
{
  self->_valenceMergeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentaryValenceDistributions, 0);
  objc_storeStrong((id *)&self->_dailyValenceValues, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
}

@end