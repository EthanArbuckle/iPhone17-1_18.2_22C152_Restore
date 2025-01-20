@interface RTStateDepictionAggStateStats
- (RTStateDepictionAggStateStats)init;
- (RTStateModelLocation)location;
- (double)aggregateTime_s;
- (double)lastExit_s;
- (int)numOfEntries;
- (void)setAggregateTime_s:(double)a3;
- (void)setLastExit_s:(double)a3;
- (void)setLocation:(id)a3;
- (void)setNumOfEntries:(int)a3;
@end

@implementation RTStateDepictionAggStateStats

- (RTStateDepictionAggStateStats)init
{
  v5.receiver = self;
  v5.super_class = (Class)RTStateDepictionAggStateStats;
  v2 = [(RTStateDepictionAggStateStats *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(RTStateModelLocation);
    [(RTStateDepictionAggStateStats *)v2 setLocation:v3];

    [(RTStateDepictionAggStateStats *)v2 setAggregateTime_s:-1.0];
    [(RTStateDepictionAggStateStats *)v2 setLastExit_s:-1.0];
    [(RTStateDepictionAggStateStats *)v2 setNumOfEntries:0];
  }
  return v2;
}

- (RTStateModelLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (double)aggregateTime_s
{
  return self->_aggregateTime_s;
}

- (void)setAggregateTime_s:(double)a3
{
  self->_aggregateTime_s = a3;
}

- (double)lastExit_s
{
  return self->_lastExit_s;
}

- (void)setLastExit_s:(double)a3
{
  self->_lastExit_s = a3;
}

- (int)numOfEntries
{
  return self->_numOfEntries;
}

- (void)setNumOfEntries:(int)a3
{
  self->_numOfEntries = a3;
}

- (void).cxx_destruct
{
}

@end