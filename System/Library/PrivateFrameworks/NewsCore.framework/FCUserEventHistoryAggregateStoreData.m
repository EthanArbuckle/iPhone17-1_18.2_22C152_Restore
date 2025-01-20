@interface FCUserEventHistoryAggregateStoreData
+ (FCUserEventHistoryAggregateStoreData)empty;
- (FCUserEventHistoryAggregateCounts)aggregateCounts;
- (FCUserEventHistoryAggregateStoreData)init;
- (int64_t)baselineStatelessEventCount;
- (int64_t)baselineTimestamp;
- (int64_t)baselineTotalEventCount;
- (void)setAggregateCounts:(id)a3;
- (void)setBaselineStatelessEventCount:(int64_t)a3;
- (void)setBaselineTimestamp:(int64_t)a3;
- (void)setBaselineTotalEventCount:(int64_t)a3;
@end

@implementation FCUserEventHistoryAggregateStoreData

- (void)setBaselineTotalEventCount:(int64_t)a3
{
  self->_baselineTotalEventCount = a3;
}

- (void)setBaselineTimestamp:(int64_t)a3
{
  self->_baselineTimestamp = a3;
}

- (void)setBaselineStatelessEventCount:(int64_t)a3
{
  self->_baselineStatelessEventCount = a3;
}

- (FCUserEventHistoryAggregateStoreData)init
{
  v6.receiver = self;
  v6.super_class = (Class)FCUserEventHistoryAggregateStoreData;
  v2 = [(FCUserEventHistoryAggregateStoreData *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    aggregateCounts = v2->_aggregateCounts;
    v2->_aggregateCounts = (FCUserEventHistoryAggregateCounts *)v3;
  }
  return v2;
}

+ (FCUserEventHistoryAggregateStoreData)empty
{
  v2 = objc_opt_new();
  [v2 setBaselineTimestamp:-1];
  [v2 setBaselineStatelessEventCount:-1];
  [v2 setBaselineTotalEventCount:-1];
  uint64_t v3 = +[FCUserEventHistoryAggregateCounts empty];
  [v2 setAggregateCounts:v3];

  return (FCUserEventHistoryAggregateStoreData *)v2;
}

- (int64_t)baselineTimestamp
{
  return self->_baselineTimestamp;
}

- (int64_t)baselineStatelessEventCount
{
  return self->_baselineStatelessEventCount;
}

- (int64_t)baselineTotalEventCount
{
  return self->_baselineTotalEventCount;
}

- (FCUserEventHistoryAggregateCounts)aggregateCounts
{
  return self->_aggregateCounts;
}

- (void)setAggregateCounts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end