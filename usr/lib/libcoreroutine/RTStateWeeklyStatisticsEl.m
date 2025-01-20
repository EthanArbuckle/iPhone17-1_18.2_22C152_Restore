@interface RTStateWeeklyStatisticsEl
- (NSUUID)stateUUID;
- (RTStateWeeklyStatisticsEl)init;
- (double)avgAggTime_s;
- (double)daysPerWeek;
- (double)numOfClustEntPerWeek;
- (double)stdAggTime_s;
- (double)topMedian;
- (void)setAvgAggTime_s:(double)a3;
- (void)setDaysPerWeek:(double)a3;
- (void)setNumOfClustEntPerWeek:(double)a3;
- (void)setStateUUID:(id)a3;
- (void)setStdAggTime_s:(double)a3;
- (void)setTopMedian:(double)a3;
@end

@implementation RTStateWeeklyStatisticsEl

- (RTStateWeeklyStatisticsEl)init
{
  v5.receiver = self;
  v5.super_class = (Class)RTStateWeeklyStatisticsEl;
  v2 = [(RTStateWeeklyStatisticsEl *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(RTStateWeeklyStatisticsEl *)v2 setAvgAggTime_s:-1.0];
    [(RTStateWeeklyStatisticsEl *)v3 setStdAggTime_s:-1.0];
    [(RTStateWeeklyStatisticsEl *)v3 setDaysPerWeek:0.0];
    [(RTStateWeeklyStatisticsEl *)v3 setNumOfClustEntPerWeek:0.0];
    [(RTStateWeeklyStatisticsEl *)v3 setTopMedian:0.0];
  }
  return v3;
}

- (double)numOfClustEntPerWeek
{
  return self->_numOfClustEntPerWeek;
}

- (void)setNumOfClustEntPerWeek:(double)a3
{
  self->_numOfClustEntPerWeek = a3;
}

- (double)avgAggTime_s
{
  return self->_avgAggTime_s;
}

- (void)setAvgAggTime_s:(double)a3
{
  self->_avgAggTime_s = a3;
}

- (double)stdAggTime_s
{
  return self->_stdAggTime_s;
}

- (void)setStdAggTime_s:(double)a3
{
  self->_stdAggTime_s = a3;
}

- (double)daysPerWeek
{
  return self->_daysPerWeek;
}

- (void)setDaysPerWeek:(double)a3
{
  self->_daysPerWeek = a3;
}

- (NSUUID)stateUUID
{
  return self->_stateUUID;
}

- (void)setStateUUID:(id)a3
{
}

- (double)topMedian
{
  return self->_topMedian;
}

- (void)setTopMedian:(double)a3
{
  self->_topMedian = a3;
}

- (void).cxx_destruct
{
}

@end