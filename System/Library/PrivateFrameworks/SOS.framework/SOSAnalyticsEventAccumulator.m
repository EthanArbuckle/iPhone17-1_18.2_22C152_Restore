@interface SOSAnalyticsEventAccumulator
- (NSString)name;
- (SOSAnalyticsEventAccumulator)initWithName:(id)a3;
- (id)analyticsDataDictForAccumulatedKeys:(id)a3 outputKeyPrefix:(id)a4 summaryKeysDict:(id)a5;
- (unint64_t)_countForEventName:(id)a3;
- (void)_addSummaryKeys:(id)a3 toAnalyticsDict:(id)a4;
- (void)noteEvent:(id)a3;
@end

@implementation SOSAnalyticsEventAccumulator

- (SOSAnalyticsEventAccumulator)initWithName:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SOSAnalyticsEventAccumulator;
  v6 = [(SOSAnalyticsEventAccumulator *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    accumulatedEventsDict = v6->_accumulatedEventsDict;
    v6->_accumulatedEventsDict = (NSMutableDictionary *)v7;

    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v6;
}

- (unint64_t)_countForEventName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_accumulatedEventsDict objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 unsignedLongValue];

  return v4;
}

- (void)noteEvent:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = sos_aea_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(SOSAnalyticsEventAccumulator *)self name];
    uint64_t v7 = (void *)v6;
    v8 = @"-";
    if (v6) {
      v8 = (__CFString *)v6;
    }
    int v10 = 138543618;
    v11 = v8;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_INFO, "noteEvent [%{public}@]: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[SOSAnalyticsEventAccumulator _countForEventName:](self, "_countForEventName:", v4) + 1);
  [(NSMutableDictionary *)self->_accumulatedEventsDict setObject:v9 forKeyedSubscript:v4];
}

- (void)_addSummaryKeys:(id)a3 toAnalyticsDict:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_accumulatedEventsDict allValues];
  v8 = [v7 valueForKeyPath:@"@sum.unsignedIntegerValue"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  int v10 = [v6 allValues];
  v11 = [v10 valueForKeyPath:@"@sum.unsignedIntegerValue"];
  uint64_t v12 = [v11 unsignedIntegerValue];

  id v13 = [v19 objectForKeyedSubscript:@"AllEventsKey"];
  if ([v13 length])
  {
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:v9];
    [v6 setObject:v14 forKeyedSubscript:v13];
  }
  v15 = [v19 objectForKeyedSubscript:@"KnownEventsKey"];
  if ([v15 length])
  {
    v16 = [NSNumber numberWithUnsignedInteger:v12];
    [v6 setObject:v16 forKeyedSubscript:v15];
  }
  v17 = [v19 objectForKeyedSubscript:@"UnknownEventsKey"];
  if ([v17 length])
  {
    v18 = [NSNumber numberWithUnsignedInteger:v9 - v12];
    [v6 setObject:v18 forKeyedSubscript:v17];
  }
}

- (id)analyticsDataDictForAccumulatedKeys:(id)a3 outputKeyPrefix:(id)a4 summaryKeysDict:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v20 = a5;
  int v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count") + objc_msgSend(v8, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v9 length])
        {
          id v16 = [v9 stringByAppendingString:v15];
        }
        else
        {
          id v16 = v15;
        }
        v17 = v16;
        v18 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[SOSAnalyticsEventAccumulator _countForEventName:](self, "_countForEventName:", v15));
        [v10 setObject:v18 forKeyedSubscript:v17];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }

  [(SOSAnalyticsEventAccumulator *)self _addSummaryKeys:v20 toAnalyticsDict:v10];

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_accumulatedEventsDict, 0);
}

@end