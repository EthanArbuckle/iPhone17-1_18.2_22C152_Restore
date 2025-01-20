@interface PLBatteryUIResponseTypeUsageTimes
- (NSArray)aggregateEntries;
- (NSDate)end;
- (NSDate)start;
- (NSDictionary)resultDictionary;
- (PLBatteryUIResponderService)responderService;
- (double)bucketSize;
- (id)dependencies;
- (id)entriesInRange:(_PLTimeIntervalRange)a3 fromEntries:(id)a4;
- (id)result;
- (void)configure:(id)a3;
- (void)run;
- (void)setAggregateEntries:(id)a3;
- (void)setBucketSize:(double)a3;
- (void)setEnd:(id)a3;
- (void)setResponderService:(id)a3;
- (void)setResultDictionary:(id)a3;
- (void)setStart:(id)a3;
@end

@implementation PLBatteryUIResponseTypeUsageTimes

- (id)dependencies
{
  return 0;
}

- (void)configure:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"start"];
  [v5 doubleValue];
  double v7 = v6;

  v8 = [v4 objectForKeyedSubscript:@"end"];
  [v8 doubleValue];
  double v10 = v9;

  v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v7];
  [(PLBatteryUIResponseTypeUsageTimes *)self setStart:v11];

  v12 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v10];
  [(PLBatteryUIResponseTypeUsageTimes *)self setEnd:v12];

  v13 = [(PLBatteryUIResponseTypeUsageTimes *)self start];
  v14 = [(PLBatteryUIResponseTypeUsageTimes *)self end];
  [v13 timeIntervalSince1970];
  double v16 = v15;
  [v14 timeIntervalSince1970];
  double v18 = v17 - v16;

  v19 = [v4 objectForKeyedSubscript:@"bucket"];

  [v19 doubleValue];
  -[PLBatteryUIResponseTypeUsageTimes setBucketSize:](self, "setBucketSize:");

  id v23 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"ScreenOn"];
  v20 = [(PLBatteryUIResponseTypeUsageTimes *)self responderService];
  v21 = [v20 storage];
  v22 = objc_msgSend(v21, "entriesForKey:inTimeRange:withFilters:", v23, 0, v16 + -1800.0, v18 + 1800.0);
  [(PLBatteryUIResponseTypeUsageTimes *)self setAggregateEntries:v22];
}

- (void)run
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "Number of buckets requested: %d", (uint8_t *)v2, 8u);
}

- (id)result
{
  [(PLBatteryUIResponseTypeUsageTimes *)self setAggregateEntries:0];
  return [(PLBatteryUIResponseTypeUsageTimes *)self resultDictionary];
}

- (id)entriesInRange:(_PLTimeIntervalRange)a3 fromEntries:(id)a4
{
  double length = a3.length;
  double location = a3.location;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    double v12 = location + length;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "entryDate", (void)v21);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          double v16 = v15;
          [v15 timeIntervalSince1970];
          double v18 = v17;

          if (location <= v18 && v18 < v12) {
            [v7 addObject:v14];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v7;
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponderService:(id)a3
{
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStart:(id)a3
{
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEnd:(id)a3
{
}

- (double)bucketSize
{
  return self->_bucketSize;
}

- (void)setBucketSize:(double)a3
{
  self->_bucketSize = a3;
}

- (NSArray)aggregateEntries
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAggregateEntries:(id)a3
{
}

- (NSDictionary)resultDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setResultDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultDictionary, 0);
  objc_storeStrong((id *)&self->_aggregateEntries, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

@end