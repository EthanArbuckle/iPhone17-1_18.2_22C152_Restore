@interface TUIStatsCollector
- (NSArray)currentEntriesUID;
- (NSMutableArray)passes;
- (NSMutableDictionary)entries;
- (TUIStatsCollector)initWithMode:(unint64_t)mode;
- (double)elapsedTimeForPhase:(unint64_t)a3;
- (unint64_t)countForEvent:(unint64_t)a3;
- (unint64_t)mode;
- (void)updateWithPass:(id)a3 currentEntriesUID:(id)a4;
@end

@implementation TUIStatsCollector

- (TUIStatsCollector)initWithMode:(unint64_t)mode
{
  v11.receiver = self;
  v11.super_class = (Class)TUIStatsCollector;
  v4 = [(TUIStatsCollector *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_mode = mode;
    if (mode)
    {
      uint64_t v6 = objc_opt_new();
      entries = v5->_entries;
      v5->_entries = (NSMutableDictionary *)v6;

      mode = v5->_mode;
    }
    if ((mode & 2) != 0)
    {
      uint64_t v8 = objc_opt_new();
      passes = v5->_passes;
      v5->_passes = (NSMutableArray *)v8;
    }
    v5->_eventCount[28] = 0;
    *(_OWORD *)&v5->_eventCount[24] = 0u;
    *(_OWORD *)&v5->_eventCount[26] = 0u;
    *(_OWORD *)&v5->_eventCount[20] = 0u;
    *(_OWORD *)&v5->_eventCount[22] = 0u;
    *(_OWORD *)&v5->_eventCount[16] = 0u;
    *(_OWORD *)&v5->_eventCount[18] = 0u;
    *(_OWORD *)&v5->_eventCount[12] = 0u;
    *(_OWORD *)&v5->_eventCount[14] = 0u;
    *(_OWORD *)&v5->_eventCount[8] = 0u;
    *(_OWORD *)&v5->_eventCount[10] = 0u;
    *(_OWORD *)&v5->_eventCount[4] = 0u;
    *(_OWORD *)&v5->_eventCount[6] = 0u;
    *(_OWORD *)v5->_eventCount = 0u;
    *(_OWORD *)&v5->_eventCount[2] = 0u;
  }
  return v5;
}

- (void)updateWithPass:(id)a3 currentEntriesUID:(id)a4
{
  id v6 = a3;
  v7 = (NSArray *)[a4 copy];
  currentEntriesUID = self->_currentEntriesUID;
  self->_currentEntriesUID = v7;

  unint64_t mode = self->_mode;
  if ((mode & 4) != 0)
  {
    for (uint64_t i = 0; i != 5; ++i)
    {
      [v6 elapsedTimeForPhase:i];
      self->_elapsedTime[i] = v11 + self->_elapsedTime[i];
    }
    unint64_t mode = self->_mode;
    if ((mode & 8) == 0)
    {
LABEL_3:
      if ((mode & 2) == 0) {
        goto LABEL_4;
      }
LABEL_12:
      [(NSMutableArray *)self->_passes addObject:v6];
      if ((self->_mode & 1) == 0) {
        goto LABEL_23;
      }
      goto LABEL_13;
    }
  }
  else if ((mode & 8) == 0)
  {
    goto LABEL_3;
  }
  for (uint64_t j = 0; j != 29; ++j)
    self->_eventCount[j] += (unint64_t)[v6 countForEvent:j];
  unint64_t mode = self->_mode;
  if ((mode & 2) != 0) {
    goto LABEL_12;
  }
LABEL_4:
  if ((mode & 1) == 0) {
    goto LABEL_23;
  }
LABEL_13:
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v27 = v6;
  v13 = [v6 entryPasses];
  id v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      for (k = 0; k != v15; k = (char *)k + 1)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v28 + 1) + 8 * (void)k);
        entries = self->_entries;
        v20 = [v18 uid];
        v21 = [(NSMutableDictionary *)entries objectForKeyedSubscript:v20];

        if (!v21)
        {
          v22 = [TUIStatsFeedEntryCollector alloc];
          unint64_t v23 = self->_mode;
          v24 = [v18 uid];
          v21 = [(TUIStatsFeedEntryCollector *)v22 initWithMode:v23 uid:v24];

          v25 = self->_entries;
          v26 = [v18 uid];
          [(NSMutableDictionary *)v25 setObject:v21 forKeyedSubscript:v26];
        }
        [(TUIStatsFeedEntryCollector *)v21 updateWithPass:v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v15);
  }

  id v6 = v27;
LABEL_23:
}

- (unint64_t)countForEvent:(unint64_t)a3
{
  return self->_eventCount[a3];
}

- (double)elapsedTimeForPhase:(unint64_t)a3
{
  return self->_elapsedTime[a3];
}

- (NSMutableArray)passes
{
  return self->_passes;
}

- (NSMutableDictionary)entries
{
  return self->_entries;
}

- (NSArray)currentEntriesUID
{
  return self->_currentEntriesUID;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEntriesUID, 0);
  objc_storeStrong((id *)&self->_entries, 0);

  objc_storeStrong((id *)&self->_passes, 0);
}

@end