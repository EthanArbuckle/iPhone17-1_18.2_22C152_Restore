@interface RTLearnedPlaceTypeInferenceStats
- (NSArray)weeklyStats;
- (RTLearnedPlaceTypeInferenceStats)initWithWeeklyStats:(id)a3 topMedianDwellTime:(double)a4;
- (double)topMedianDwellTime;
- (double)weeklyAggregateDwellTimeBetweenDateRangeAverage;
- (double)weeklyAggregateDwellTimeBetweenDateRangeStandardDeviation;
- (double)weeklyDaysWithNonZeroDwellTimeAverage;
- (double)weeklyTotalDailyVisitCountAverage;
- (id)description;
- (int64_t)totalDailyVisitCount;
- (int64_t)weeksWithNonZeroDwellTime;
@end

@implementation RTLearnedPlaceTypeInferenceStats

- (RTLearnedPlaceTypeInferenceStats)initWithWeeklyStats:(id)a3 topMedianDwellTime:(double)a4
{
  id v7 = a3;
  v29.receiver = self;
  v29.super_class = (Class)RTLearnedPlaceTypeInferenceStats;
  v8 = [(RTLearnedPlaceTypeInferenceStats *)&v29 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_weeklyStats, a3);
    v9->_topMedianDwellTime = a4;
    *(_OWORD *)&v9->_weeklyAggregateDwellTimeBetweenDateRangeAverage = 0u;
    *(_OWORD *)&v9->_weeklyTotalDailyVisitCountAverage = 0u;
    v10 = [v7 valueForKeyPath:@"@sum.totalDailyVisitCount"];
    v9->_totalDailyVisitCount = [v10 unsignedIntegerValue];

    v9->_uint64_t weeksWithNonZeroDwellTime = 0;
    v11 = [v7 valueForKeyPath:@"@sum.dailyAggregateDwellTimeBetweenDateRangeAverage"];
    [v11 doubleValue];
    double v13 = v12;

    v14 = [v7 valueForKeyPath:@"@sum.dailyAggregateDwellTimeBetweenDateRangeStandardDeviation"];
    [v14 doubleValue];
    double v16 = v15;

    v17 = [v7 valueForKeyPath:@"@sum.totalDailyVisitCount"];
    [v17 doubleValue];
    double v19 = v18;

    v20 = [v7 valueForKeyPath:@"@sum.daysWithNonZeroDwellTime"];
    [v20 doubleValue];
    double v22 = v21;

    weeklyStats = v9->_weeklyStats;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __75__RTLearnedPlaceTypeInferenceStats_initWithWeeklyStats_topMedianDwellTime___block_invoke;
    v27[3] = &unk_1E6B9C768;
    v24 = v9;
    v28 = v24;
    [(NSArray *)weeklyStats enumerateObjectsUsingBlock:v27];
    uint64_t weeksWithNonZeroDwellTime = v9->_weeksWithNonZeroDwellTime;
    if (weeksWithNonZeroDwellTime >= 1)
    {
      v9->_weeklyAggregateDwellTimeBetweenDateRangeAverage = v13 / (double)weeksWithNonZeroDwellTime;
      v24[3] = v16 / (double)weeksWithNonZeroDwellTime;
      v24[4] = v19 / (double)weeksWithNonZeroDwellTime;
      v24[5] = v22 / (double)weeksWithNonZeroDwellTime;
    }
  }
  return v9;
}

uint64_t __75__RTLearnedPlaceTypeInferenceStats_initWithWeeklyStats_topMedianDwellTime___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 daysWithNonZeroDwellTime];
  if (result >= 1) {
    ++*(void *)(*(void *)(a1 + 32) + 56);
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = [(RTLearnedPlaceTypeInferenceStats *)self weeklyStats];
  uint64_t v5 = [v4 count];
  int64_t v6 = [(RTLearnedPlaceTypeInferenceStats *)self totalDailyVisitCount];
  int64_t v7 = [(RTLearnedPlaceTypeInferenceStats *)self weeksWithNonZeroDwellTime];
  [(RTLearnedPlaceTypeInferenceStats *)self weeklyAggregateDwellTimeBetweenDateRangeAverage];
  uint64_t v9 = v8;
  [(RTLearnedPlaceTypeInferenceStats *)self weeklyAggregateDwellTimeBetweenDateRangeStandardDeviation];
  uint64_t v11 = v10;
  [(RTLearnedPlaceTypeInferenceStats *)self weeklyTotalDailyVisitCountAverage];
  uint64_t v13 = v12;
  [(RTLearnedPlaceTypeInferenceStats *)self weeklyDaysWithNonZeroDwellTimeAverage];
  uint64_t v15 = v14;
  [(RTLearnedPlaceTypeInferenceStats *)self topMedianDwellTime];
  v17 = [v3 stringWithFormat:@"weeklyStats, %lu, totalWeeklyVisitCount, %lu, weeksWithNonZeroDwellTime, %lu, weeklyAggregateDwellTimeBetweenDateRangeAverage, %.2f, weeklyAggregateDwellTimeBetweenDateRangeStandardDeviation, %.2f, weeklyTotalDailyVisitCountAverage, %.2f, weeklyDaysWithNonZeroDwellTimeAverage, %.2f, topMedianDwellTime, %.2f", v5, v6, v7, v9, v11, v13, v15, v16];

  return v17;
}

- (NSArray)weeklyStats
{
  return self->_weeklyStats;
}

- (double)weeklyAggregateDwellTimeBetweenDateRangeAverage
{
  return self->_weeklyAggregateDwellTimeBetweenDateRangeAverage;
}

- (double)weeklyAggregateDwellTimeBetweenDateRangeStandardDeviation
{
  return self->_weeklyAggregateDwellTimeBetweenDateRangeStandardDeviation;
}

- (double)weeklyTotalDailyVisitCountAverage
{
  return self->_weeklyTotalDailyVisitCountAverage;
}

- (double)weeklyDaysWithNonZeroDwellTimeAverage
{
  return self->_weeklyDaysWithNonZeroDwellTimeAverage;
}

- (int64_t)totalDailyVisitCount
{
  return self->_totalDailyVisitCount;
}

- (int64_t)weeksWithNonZeroDwellTime
{
  return self->_weeksWithNonZeroDwellTime;
}

- (double)topMedianDwellTime
{
  return self->_topMedianDwellTime;
}

- (void).cxx_destruct
{
}

@end