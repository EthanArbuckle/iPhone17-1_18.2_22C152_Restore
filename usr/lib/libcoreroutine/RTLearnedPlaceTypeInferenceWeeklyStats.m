@interface RTLearnedPlaceTypeInferenceWeeklyStats
- (RTLearnedPlaceTypeInferenceWeeklyStats)initWithDailyStats:(id)a3;
- (double)dailyAggregateDwellTimeBetweenDateRangeAverage;
- (double)dailyAggregateDwellTimeBetweenDateRangeStandardDeviation;
- (id)description;
- (int64_t)daysWithNonZeroDwellTime;
- (int64_t)totalDailyVisitCount;
@end

@implementation RTLearnedPlaceTypeInferenceWeeklyStats

- (RTLearnedPlaceTypeInferenceWeeklyStats)initWithDailyStats:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RTLearnedPlaceTypeInferenceWeeklyStats;
  v5 = [(RTLearnedPlaceTypeInferenceWeeklyStats *)&v23 init];
  v6 = v5;
  if (v5)
  {
    v5->_dailyAggregateDwellTimeBetweenDateRangeAverage = 0.0;
    v5->_dailyAggregateDwellTimeBetweenDateRangeStandardDeviation = 0.0;
    v7 = [v4 valueForKeyPath:@"@sum.visitCount"];
    v6->_totalDailyVisitCount = [v7 unsignedIntegerValue];

    v6->_uint64_t daysWithNonZeroDwellTime = 0;
    uint64_t v19 = 0;
    v20 = (double *)&v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0;
    uint64_t v15 = 0;
    v16 = (double *)&v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__RTLearnedPlaceTypeInferenceWeeklyStats_initWithDailyStats___block_invoke;
    v11[3] = &unk_1E6B9C740;
    v12 = v6;
    v13 = &v19;
    v14 = &v15;
    [v4 enumerateObjectsUsingBlock:v11];
    uint64_t daysWithNonZeroDwellTime = v6->_daysWithNonZeroDwellTime;
    if (daysWithNonZeroDwellTime >= 1)
    {
      double v9 = v20[3] / (double)daysWithNonZeroDwellTime;
      v6->_dailyAggregateDwellTimeBetweenDateRangeAverage = v9;
      v6->_dailyAggregateDwellTimeBetweenDateRangeStandardDeviation = sqrt(v16[3] / (double)daysWithNonZeroDwellTime- v9 * v9);
    }

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);
  }

  return v6;
}

void __61__RTLearnedPlaceTypeInferenceWeeklyStats_initWithDailyStats___block_invoke(void *a1, void *a2)
{
  id v8 = a2;
  [v8 aggregateDwellTimeBetweenDateRange];
  if (v3 > 0.0)
  {
    ++*(void *)(a1[4] + 32);
    [v8 aggregateDwellTimeBetweenDateRange];
    *(double *)(*(void *)(a1[5] + 8) + 24) = v4 + *(double *)(*(void *)(a1[5] + 8) + 24);
    [v8 aggregateDwellTimeBetweenDateRange];
    double v6 = v5;
    [v8 aggregateDwellTimeBetweenDateRange];
    *(double *)(*(void *)(a1[6] + 8) + 24) = *(double *)(*(void *)(a1[6] + 8) + 24) + v6 * v7;
  }
}

- (id)description
{
  double v3 = NSString;
  int64_t v4 = [(RTLearnedPlaceTypeInferenceWeeklyStats *)self daysWithNonZeroDwellTime];
  int64_t v5 = [(RTLearnedPlaceTypeInferenceWeeklyStats *)self totalDailyVisitCount];
  [(RTLearnedPlaceTypeInferenceWeeklyStats *)self dailyAggregateDwellTimeBetweenDateRangeAverage];
  uint64_t v7 = v6;
  [(RTLearnedPlaceTypeInferenceWeeklyStats *)self dailyAggregateDwellTimeBetweenDateRangeStandardDeviation];
  return (id)[v3 stringWithFormat:@"daysWithNonZeroDwellTime, %lu, totalDailyVisitCount, %lu, dailyAggregateDwellTimeBetweenDateRangeAverage, %.2f, dailyAggregateDwellTimeBetweenDateRangeStandardDeviation, %.2f", v4, v5, v7, v8];
}

- (double)dailyAggregateDwellTimeBetweenDateRangeAverage
{
  return self->_dailyAggregateDwellTimeBetweenDateRangeAverage;
}

- (double)dailyAggregateDwellTimeBetweenDateRangeStandardDeviation
{
  return self->_dailyAggregateDwellTimeBetweenDateRangeStandardDeviation;
}

- (int64_t)totalDailyVisitCount
{
  return self->_totalDailyVisitCount;
}

- (int64_t)daysWithNonZeroDwellTime
{
  return self->_daysWithNonZeroDwellTime;
}

@end