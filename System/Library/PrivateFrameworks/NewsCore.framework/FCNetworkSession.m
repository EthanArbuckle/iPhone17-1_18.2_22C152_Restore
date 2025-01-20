@interface FCNetworkSession
- (BOOL)wifiReachable;
- (FCNetworkSession)init;
- (NSArray)eventGroups;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)generateSessionJSONDataWithOptions:(unint64_t)a3 error:(id *)a4;
- (int64_t)cellularRadioAccessTechnology;
- (unint64_t)totalFailureCount;
- (unint64_t)totalSuccessCount;
- (void)addEventGroup:(id)a3;
- (void)setCellularRadioAccessTechnology:(int64_t)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setWifiReachable:(BOOL)a3;
@end

@implementation FCNetworkSession

- (FCNetworkSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)FCNetworkSession;
  v2 = [(FCNetworkSession *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    eventGroups = v2->_eventGroups;
    v2->_eventGroups = (NSMutableArray *)v3;
  }
  return v2;
}

- (NSDate)startDate
{
  v2 = [(NSMutableArray *)self->_eventGroups valueForKeyPath:@"startDate"];
  uint64_t v3 = [v2 sortedArrayUsingSelector:sel_compare_];
  v4 = [v3 firstObject];

  return (NSDate *)v4;
}

- (NSDate)endDate
{
  v2 = [(NSMutableArray *)self->_eventGroups valueForKeyPath:@"endDate"];
  uint64_t v3 = [v2 sortedArrayUsingSelector:sel_compare_];
  v4 = [v3 lastObject];

  return (NSDate *)v4;
}

- (unint64_t)totalSuccessCount
{
  v2 = [(NSMutableArray *)self->_eventGroups valueForKeyPath:@"@sum.successesCount"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (unint64_t)totalFailureCount
{
  v2 = [(NSMutableArray *)self->_eventGroups valueForKeyPath:@"@sum.failuresCount"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (id)generateSessionJSONDataWithOptions:(unint64_t)a3 error:(id *)a4
{
  objc_super v6 = [(NSMutableArray *)self->_eventGroups fc_arrayByTransformingWithBlock:&__block_literal_global_197];
  v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v6 options:a3 error:a4];

  return v7;
}

uint64_t __61__FCNetworkSession_generateSessionJSONDataWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (void)addEventGroup:(id)a3
{
}

- (BOOL)wifiReachable
{
  return self->_wifiReachable;
}

- (void)setWifiReachable:(BOOL)a3
{
  self->_wifiReachable = a3;
}

- (int64_t)cellularRadioAccessTechnology
{
  return self->_cellularRadioAccessTechnology;
}

- (void)setCellularRadioAccessTechnology:(int64_t)a3
{
  self->_cellularRadioAccessTechnology = a3;
}

- (NSArray)eventGroups
{
  return &self->_eventGroups->super;
}

- (void)setStartDate:(id)a3
{
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventGroups, 0);
}

@end