@interface TIAnalyticsServiceProviderMock
- (NSMutableDictionary)allEvents;
- (TIAnalyticsServiceProviderMock)init;
- (double)sumFloatField:(id)a3 forEvent:(id)a4;
- (double)sumFloatField:(id)a3 forEvent:(id)a4 filteredWithPredicate:(id)a5;
- (double)sumFloatField:(id)a3 forEvents:(id)a4;
- (id)eventsWithName:(id)a3;
- (int64_t)countEvent:(id)a3;
- (int64_t)countEvent:(id)a3 filteredWithPredicate:(id)a4;
- (int64_t)sumIntegerField:(id)a3 forEvent:(id)a4;
- (int64_t)sumIntegerField:(id)a3 forEvent:(id)a4 filteredWithPredicate:(id)a5;
- (int64_t)sumIntegerField:(id)a3 forEvents:(id)a4;
- (void)clear;
- (void)dispatchEventWithName:(id)a3 payload:(id)a4;
@end

@implementation TIAnalyticsServiceProviderMock

- (void).cxx_destruct
{
}

- (NSMutableDictionary)allEvents
{
  return self->_allEvents;
}

- (void)clear
{
  id v2 = [(TIAnalyticsServiceProviderMock *)self allEvents];
  [v2 removeAllObjects];
}

- (double)sumFloatField:(id)a3 forEvents:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) objectForKey:v5];
        [v12 floatValue];
        double v10 = v10 + v13;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (double)sumFloatField:(id)a3 forEvent:(id)a4 filteredWithPredicate:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  double v10 = [(TIAnalyticsServiceProviderMock *)self eventsWithName:a4];
  v11 = [v10 filteredArrayUsingPredicate:v8];

  [(TIAnalyticsServiceProviderMock *)self sumFloatField:v9 forEvents:v11];
  double v13 = v12;

  return v13;
}

- (double)sumFloatField:(id)a3 forEvent:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(TIAnalyticsServiceProviderMock *)self eventsWithName:a4];
  [(TIAnalyticsServiceProviderMock *)self sumFloatField:v6 forEvents:v7];
  double v9 = v8;

  return v9;
}

- (int64_t)sumIntegerField:(id)a3 forEvents:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        double v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) objectForKey:v5];
        v9 += [v12 integerValue];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (int64_t)sumIntegerField:(id)a3 forEvent:(id)a4 filteredWithPredicate:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(TIAnalyticsServiceProviderMock *)self eventsWithName:a4];
  v11 = [v10 filteredArrayUsingPredicate:v8];

  int64_t v12 = [(TIAnalyticsServiceProviderMock *)self sumIntegerField:v9 forEvents:v11];
  return v12;
}

- (int64_t)sumIntegerField:(id)a3 forEvent:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [(TIAnalyticsServiceProviderMock *)self eventsWithName:a4];
  int64_t v8 = [(TIAnalyticsServiceProviderMock *)self sumIntegerField:v6 forEvents:v7];

  return v8;
}

- (int64_t)countEvent:(id)a3 filteredWithPredicate:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(TIAnalyticsServiceProviderMock *)self eventsWithName:a3];
  int64_t v8 = [v7 filteredArrayUsingPredicate:v6];

  int64_t v9 = [v8 count];
  return v9;
}

- (int64_t)countEvent:(id)a3
{
  v3 = [(TIAnalyticsServiceProviderMock *)self eventsWithName:a3];
  int64_t v4 = [v3 count];

  return v4;
}

- (id)eventsWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(TIAnalyticsServiceProviderMock *)self allEvents];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v6 = objc_opt_new();
    uint64_t v7 = [(TIAnalyticsServiceProviderMock *)self allEvents];
    [v7 setObject:v6 forKey:v4];
  }
  return v6;
}

- (void)dispatchEventWithName:(id)a3 payload:(id)a4
{
  id v6 = a4;
  id v7 = [(TIAnalyticsServiceProviderMock *)self eventsWithName:a3];
  [v7 addObject:v6];
}

- (TIAnalyticsServiceProviderMock)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIAnalyticsServiceProviderMock;
  id v2 = [(TIAnalyticsServiceProviderMock *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    allEvents = v2->_allEvents;
    v2->_allEvents = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end