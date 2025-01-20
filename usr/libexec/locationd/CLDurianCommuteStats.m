@interface CLDurianCommuteStats
- (BOOL)containsDate:(id)a3;
- (CLDurianCommuteStats)initWithDate:(id)a3;
- (CLDurianCommuteStats)initWithNVP:(CLNameValuePair)a3;
- (CLNameValuePair)getNVPFromStats;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSMutableDictionary)itemJourneyStats;
- (NSMutableSet)carryingItems;
- (int64_t)deviceJourneyCount;
- (void)addCarryingItem:(id)a3;
- (void)completeJourney;
- (void)dealloc;
- (void)removeAllCarryingItems;
- (void)resetWithDate:(id)a3;
- (void)setCarryingItems:(id)a3;
- (void)setDeviceJourneyCount:(int64_t)a3;
- (void)setEndDate:(id)a3;
- (void)setItemJourneyStats:(id)a3;
- (void)setStartDate:(id)a3;
- (void)updateStatsWithNVP:(CLNameValuePair)a3;
@end

@implementation CLDurianCommuteStats

- (CLDurianCommuteStats)initWithNVP:(CLNameValuePair)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLDurianCommuteStats;
  v3 = [(CLDurianCommuteStats *)&v6 init];
  if (v3)
  {
    [(CLDurianCommuteStats *)v3 setCarryingItems:(id)objc_opt_new()];
    [(CLDurianCommuteStats *)v3 setItemJourneyStats:(id)objc_opt_new()];
    sub_1004CE794(v5);
    [(CLDurianCommuteStats *)v3 updateStatsWithNVP:v5];
    sub_10013F3C4(v5);
  }
  return v3;
}

- (void)updateStatsWithNVP:(CLNameValuePair)a3
{
  var0 = a3.var0;
  double v12 = 0.0;
  if (sub_1000A699C((uint64_t)a3.var0, (const char *)objc_msgSend(@"kCLDurianCommuteMetricsKeyStartDate", "UTF8String", a3.var0, a3.var1), &v12))
  {
    v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v12];
    if (![(CLDurianCommuteStats *)self startDate]
      || ([(NSDate *)[(CLDurianCommuteStats *)self startDate] timeIntervalSinceDate:v5], v6 > 0.0))
    {
      [(CLDurianCommuteStats *)self setStartDate:v5];
    }
  }
  if (sub_1000A699C((uint64_t)var0, (const char *)[@"kCLDurianCommuteMetricsKeyEndDate" UTF8String], &v12))
  {
    v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v12];
    if (![(CLDurianCommuteStats *)self endDate]
      || ([(NSDate *)[(CLDurianCommuteStats *)self endDate] timeIntervalSinceDate:v7], v8 < 0.0))
    {
      [(CLDurianCommuteStats *)self setEndDate:v7];
    }
  }
  uint64_t v11 = 0;
  sub_1004D0EA0((uint64_t)var0, (const char *)[@"kCLDurianCommuteMetricsKeyJourneyCount" UTF8String], &v11);
  int64_t v9 = [(CLDurianCommuteStats *)self deviceJourneyCount];
  [(CLDurianCommuteStats *)self setDeviceJourneyCount:v11 + v9];
  sub_1000E9354(v10);
  sub_100012960((uint64_t)var0, (const char *)[@"kCLDurianCommuteMetricsKeyItemJourneyCounts" UTF8String], v10);
  sub_1004CFF34((uint64_t)v10);
}

- (CLNameValuePair)getNVPFromStats
{
  uint64_t v4 = v2;
  sub_1000E9354();
  v5 = (const char *)[@"kCLDurianCommuteMetricsKeyStartDate" UTF8String];
  [(NSDate *)[(CLDurianCommuteStats *)self startDate] timeIntervalSinceReferenceDate];
  v24[0] = v6;
  sub_10016332C(v4, v5, v24);
  v7 = (const char *)[@"kCLDurianCommuteMetricsKeyEndDate" UTF8String];
  [(NSDate *)[(CLDurianCommuteStats *)self endDate] timeIntervalSinceReferenceDate];
  v24[0] = v8;
  sub_10016332C(v4, v7, v24);
  int64_t v9 = (const char *)[@"kCLDurianCommuteMetricsKeyJourneyCount" UTF8String];
  v24[0] = [(CLDurianCommuteStats *)self deviceJourneyCount];
  sub_1004D31B8(v4, v9, v24);
  sub_1000E9354();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [(NSMutableDictionary *)[(CLDurianCommuteStats *)self itemJourneyStats] keyEnumerator];
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v13);
        id v15 = [(NSMutableDictionary *)[(CLDurianCommuteStats *)self itemJourneyStats] objectForKey:v14];
        v16 = (const char *)[v14 UUIDString].UTF8String;
        id v19 = [v15 journeyCount];
        sub_1004D31B8((uint64_t)v24, v16, &v19);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v11);
  }
  sub_1004D3878(v4, (const char *)[@"kCLDurianCommuteMetricsKeyItemJourneyCounts" UTF8String], (uint64_t)v24);
  v17 = (void **)sub_10013F3C4(v24);
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (CLDurianCommuteStats)initWithDate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLDurianCommuteStats;
  uint64_t v4 = [(CLDurianCommuteStats *)&v6 init];
  if (v4)
  {
    -[CLDurianCommuteStats setStartDate:](v4, "setStartDate:", [a3 startDayOfWeek]);
    [(CLDurianCommuteStats *)v4 setEndDate:[(NSDate *)v4->_startDate dateByAddingTimeInterval:604800.0]];
    [(CLDurianCommuteStats *)v4 setDeviceJourneyCount:0];
    [(CLDurianCommuteStats *)v4 setCarryingItems:(id)objc_opt_new()];
    [(CLDurianCommuteStats *)v4 setItemJourneyStats:(id)objc_opt_new()];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianCommuteStats;
  [(CLDurianCommuteStats *)&v3 dealloc];
}

- (void)resetWithDate:(id)a3
{
  -[CLDurianCommuteStats setStartDate:](self, "setStartDate:", [a3 startDayOfWeek]);
  [(CLDurianCommuteStats *)self setEndDate:[(NSDate *)self->_startDate dateByAddingTimeInterval:604800.0]];
  [(CLDurianCommuteStats *)self setDeviceJourneyCount:0];
  [(NSMutableSet *)[(CLDurianCommuteStats *)self carryingItems] removeAllObjects];
  uint64_t v4 = [(CLDurianCommuteStats *)self itemJourneyStats];

  [(NSMutableDictionary *)v4 removeAllObjects];
}

- (BOOL)containsDate:(id)a3
{
  [a3 timeIntervalSinceDate:-[CLDurianCommuteStats startDate](self, "startDate")];
  return v3 < 604800.0 && v3 >= 0.0;
}

- (void)removeAllCarryingItems
{
  uint64_t v2 = [(CLDurianCommuteStats *)self carryingItems];

  [(NSMutableSet *)v2 removeAllObjects];
}

- (void)addCarryingItem:(id)a3
{
  uint64_t v4 = [(CLDurianCommuteStats *)self carryingItems];

  [(NSMutableSet *)v4 addObject:a3];
}

- (void)completeJourney
{
  [(CLDurianCommuteStats *)self setDeviceJourneyCount:(char *)[(CLDurianCommuteStats *)self deviceJourneyCount] + 1];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v3 = [(CLDurianCommuteStats *)self carryingItems];
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v7);
        int64_t v9 = (CLDurianJourneyStats *)[(NSMutableDictionary *)[(CLDurianCommuteStats *)self itemJourneyStats] objectForKey:v8];
        if (!v9)
        {
          int64_t v9 = objc_alloc_init(CLDurianJourneyStats);
          [(NSMutableDictionary *)[(CLDurianCommuteStats *)self itemJourneyStats] setObject:v9 forKey:v8];
        }
        [(CLDurianJourneyStats *)v9 setJourneyCount:(char *)[(CLDurianJourneyStats *)v9 journeyCount] + 1];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  [(NSMutableSet *)[(CLDurianCommuteStats *)self carryingItems] removeAllObjects];
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndDate:(id)a3
{
}

- (int64_t)deviceJourneyCount
{
  return self->_deviceJourneyCount;
}

- (void)setDeviceJourneyCount:(int64_t)a3
{
  self->_deviceJourneyCount = a3;
}

- (NSMutableDictionary)itemJourneyStats
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setItemJourneyStats:(id)a3
{
}

- (NSMutableSet)carryingItems
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCarryingItems:(id)a3
{
}

@end