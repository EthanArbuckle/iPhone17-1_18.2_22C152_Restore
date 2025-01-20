@interface RTLearnedPlaceTypeInferenceDailyStats
- (NSDate)end;
- (NSDate)start;
- (RTLearnedPlaceTypeInferenceDailyStats)initWithStart:(id)a3 end:(id)a4 visitCount:(unint64_t)a5 aggregateDwellTimeBetweenDateRange:(double)a6;
- (double)aggregateDwellTimeBetweenDateRange;
- (id)description;
- (unint64_t)visitCount;
@end

@implementation RTLearnedPlaceTypeInferenceDailyStats

- (RTLearnedPlaceTypeInferenceDailyStats)initWithStart:(id)a3 end:(id)a4 visitCount:(unint64_t)a5 aggregateDwellTimeBetweenDateRange:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RTLearnedPlaceTypeInferenceDailyStats;
  v13 = [(RTLearnedPlaceTypeInferenceDailyStats *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_start, a3);
    objc_storeStrong((id *)&v14->_end, a4);
    v14->_visitCount = a5;
    v14->_aggregateDwellTimeBetweenDateRange = a6;
  }

  return v14;
}

- (id)description
{
  v3 = NSString;
  v4 = [(NSDate *)self->_start stringFromDate];
  v5 = [(NSDate *)self->_end stringFromDate];
  v6 = [v3 stringWithFormat:@"start, %@, end, %@, visitCount, %lu, aggregateDwellTimeBetweenDateRange, %.2f", v4, v5, self->_visitCount, *(void *)&self->_aggregateDwellTimeBetweenDateRange];

  return v6;
}

- (NSDate)start
{
  return self->_start;
}

- (NSDate)end
{
  return self->_end;
}

- (unint64_t)visitCount
{
  return self->_visitCount;
}

- (double)aggregateDwellTimeBetweenDateRange
{
  return self->_aggregateDwellTimeBetweenDateRange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);

  objc_storeStrong((id *)&self->_start, 0);
}

@end