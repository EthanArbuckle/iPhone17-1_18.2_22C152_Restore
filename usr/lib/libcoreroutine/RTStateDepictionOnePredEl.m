@interface RTStateDepictionOnePredEl
- (NSMutableArray)visitHist;
- (RTStateDepictionOnePredEl)init;
- (double)aggregateTime_s;
- (double)density;
- (double)earliestVisitTime_s;
- (double)latestVisitTime_s;
- (int)numOfClustEntries;
- (void)setAggregateTime_s:(double)a3;
- (void)setDensity:(double)a3;
- (void)setEarliestVisitTime_s:(double)a3;
- (void)setLatestVisitTime_s:(double)a3;
- (void)setNumOfClustEntries:(int)a3;
- (void)setVisitHist:(id)a3;
@end

@implementation RTStateDepictionOnePredEl

- (RTStateDepictionOnePredEl)init
{
  v6.receiver = self;
  v6.super_class = (Class)RTStateDepictionOnePredEl;
  v2 = [(RTStateDepictionOnePredEl *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(RTStateDepictionOnePredEl *)v2 setNumOfClustEntries:0];
    [(RTStateDepictionOnePredEl *)v3 setAggregateTime_s:0.0];
    [(RTStateDepictionOnePredEl *)v3 setLatestVisitTime_s:-1.0];
    [(RTStateDepictionOnePredEl *)v3 setDensity:0.0];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(RTStateDepictionOnePredEl *)v3 setVisitHist:v4];
  }
  return v3;
}

- (int)numOfClustEntries
{
  return self->_numOfClustEntries;
}

- (void)setNumOfClustEntries:(int)a3
{
  self->_numOfClustEntries = a3;
}

- (double)aggregateTime_s
{
  return self->_aggregateTime_s;
}

- (void)setAggregateTime_s:(double)a3
{
  self->_aggregateTime_s = a3;
}

- (double)latestVisitTime_s
{
  return self->_latestVisitTime_s;
}

- (void)setLatestVisitTime_s:(double)a3
{
  self->_latestVisitTime_s = a3;
}

- (double)earliestVisitTime_s
{
  return self->_earliestVisitTime_s;
}

- (void)setEarliestVisitTime_s:(double)a3
{
  self->_earliestVisitTime_s = a3;
}

- (NSMutableArray)visitHist
{
  return self->_visitHist;
}

- (void)setVisitHist:(id)a3
{
}

- (double)density
{
  return self->_density;
}

- (void)setDensity:(double)a3
{
  self->_density = a3;
}

- (void).cxx_destruct
{
}

@end