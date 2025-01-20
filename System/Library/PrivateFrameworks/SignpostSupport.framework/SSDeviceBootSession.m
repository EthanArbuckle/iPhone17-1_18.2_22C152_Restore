@interface SSDeviceBootSession
- (BOOL)includeTimelines;
- (NSDate)earliestDate;
- (NSDate)latestDate;
- (NSDictionary)processNameToClientSessions;
- (NSMutableArray)mutableChronologicalClientSessions;
- (NSMutableDictionary)mutableProcessIDToClientSession;
- (NSString)debugDescription;
- (SSCAMetalLayerClientSessionAccumulator)parentAccumulator;
- (SSDeviceBootSession)initWithIncludeTimelines:(BOOL)a3;
- (id)_clientSessionForPID:(int)a3 timebaseRatio:(double)a4;
- (id)coreAnalyticsEvents;
- (id)dictionaryRepresentation;
- (id)jsonDescription:(unint64_t)a3;
- (void)_updateDates:(id)a3;
- (void)setEarliestDate:(id)a3;
- (void)setLatestDate:(id)a3;
@end

@implementation SSDeviceBootSession

- (SSDeviceBootSession)initWithIncludeTimelines:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SSDeviceBootSession;
  v4 = [(SSDeviceBootSession *)&v10 init];
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mutableProcessIDToClientSession = v4->_mutableProcessIDToClientSession;
    v4->_mutableProcessIDToClientSession = v5;

    v4->_includeTimelines = a3;
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableChronologicalClientSessions = v4->_mutableChronologicalClientSessions;
    v4->_mutableChronologicalClientSessions = v7;
  }
  return v4;
}

- (id)_clientSessionForPID:(int)a3 timebaseRatio:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = [(SSDeviceBootSession *)self processIDToClientSession];
  v8 = [NSNumber numberWithInt:v5];
  v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    v9 = [[SSCAMetalLayerClientSession alloc] initWithPID:v5 includeTimelines:[(SSDeviceBootSession *)self includeTimelines] timebaseRatio:a4];
    objc_super v10 = [(SSDeviceBootSession *)self mutableProcessIDToClientSession];
    v11 = [NSNumber numberWithInt:v5];
    [v10 setObject:v9 forKeyedSubscript:v11];

    v12 = [(SSDeviceBootSession *)self mutableChronologicalClientSessions];
    [v12 addObject:v9];
  }

  return v9;
}

- (void)_updateDates:(id)a3
{
  id v12 = a3;
  v4 = [(SSDeviceBootSession *)self earliestDate];

  if (!v4)
  {
    uint64_t v5 = [v12 beginDate];
    [(SSDeviceBootSession *)self setEarliestDate:v5];
  }
  uint64_t v6 = [(SSDeviceBootSession *)self latestDate];
  if (!v6) {
    goto LABEL_5;
  }
  v7 = (void *)v6;
  v8 = [(SSDeviceBootSession *)self latestDate];
  v9 = [v12 endDate];
  uint64_t v10 = [v8 compare:v9];

  if (v10 == -1)
  {
LABEL_5:
    v11 = [v12 endDate];
    [(SSDeviceBootSession *)self setLatestDate:v11];
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(SSDeviceBootSession *)self earliestDate];
  uint64_t v5 = _stringForDate(v4);
  [v3 setObject:v5 forKeyedSubscript:kSSDeviceBootSessionKey_EarliestDate];

  uint64_t v6 = [(SSDeviceBootSession *)self latestDate];
  v7 = _stringForDate(v6);
  [v3 setObject:v7 forKeyedSubscript:kSSDeviceBootSessionKey_LatestDate];

  v8 = [(SSDeviceBootSession *)self processIDToClientSession];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v11 = [(SSDeviceBootSession *)self processIDToClientSession];
    id v12 = [v11 allValues];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v19 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v14);
    }

    [v3 setObject:v10 forKeyedSubscript:kSSDeviceBootSessionKey_ClientSessions];
  }

  return v3;
}

- (id)jsonDescription:(unint64_t)a3
{
  return SignpostJSONRepresentation(self, a3);
}

- (NSString)debugDescription
{
  return (NSString *)[(SSDeviceBootSession *)self jsonDescription:3];
}

- (id)coreAnalyticsEvents
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(SSDeviceBootSession *)self processIDToClientSession];
  uint64_t v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) coreAnalyticsEvent];
        if (v10) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if ([v3 count]) {
    id v11 = v3;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (NSDictionary)processNameToClientSessions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = [(SSDeviceBootSession *)self mutableChronologicalClientSessions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v9 processName];
        id v11 = (void *)v10;
        id v12 = (void *)kSSCAMLUnknownProcessName;
        if (v10) {
          id v12 = (void *)v10;
        }
        id v13 = v12;

        id v14 = [v3 objectForKeyedSubscript:v13];
        if (!v14)
        {
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v3 setObject:v14 forKeyedSubscript:v13];
        }
        [v14 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (NSDate)earliestDate
{
  return self->_earliestDate;
}

- (void)setEarliestDate:(id)a3
{
}

- (NSDate)latestDate
{
  return self->_latestDate;
}

- (void)setLatestDate:(id)a3
{
}

- (BOOL)includeTimelines
{
  return self->_includeTimelines;
}

- (NSMutableArray)mutableChronologicalClientSessions
{
  return self->_mutableChronologicalClientSessions;
}

- (SSCAMetalLayerClientSessionAccumulator)parentAccumulator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentAccumulator);

  return (SSCAMetalLayerClientSessionAccumulator *)WeakRetained;
}

- (NSMutableDictionary)mutableProcessIDToClientSession
{
  return self->_mutableProcessIDToClientSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableProcessIDToClientSession, 0);
  objc_destroyWeak((id *)&self->_parentAccumulator);
  objc_storeStrong((id *)&self->_mutableChronologicalClientSessions, 0);
  objc_storeStrong((id *)&self->_latestDate, 0);

  objc_storeStrong((id *)&self->_earliestDate, 0);
}

@end