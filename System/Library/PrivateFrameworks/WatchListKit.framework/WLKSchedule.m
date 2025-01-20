@interface WLKSchedule
- (BOOL)_isDate:(id)a3 containedByDate:(id)a4 andDate:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)events;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)serviceID;
- (WLKSchedule)initWithDictionary:(id)a3;
- (id)adjacentEventsForDate:(id)a3 fuzziness:(double)a4;
- (id)eventAfterDate:(id)a3;
- (id)eventForDate:(id)a3;
- (id)eventForDate:(id)a3 fuzziness:(double)a4;
- (unint64_t)hash;
- (void)prune;
@end

@implementation WLKSchedule

- (WLKSchedule)initWithDictionary:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v26.receiver = self;
    v26.super_class = (Class)WLKSchedule;
    v5 = [(WLKSchedule *)&v26 init];
    if (v5)
    {
      v6 = [MEMORY[0x1E4F1CA48] array];
      v7 = objc_msgSend(v4, "wlk_arrayForKey:", @"schedule");
      if (v7)
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __34__WLKSchedule_initWithDictionary___block_invoke;
        v24[3] = &unk_1E620AD40;
        v25 = v6;
        [v7 enumerateObjectsUsingBlock:v24];
        v8 = v25;
      }
      else
      {
        v8 = [[WLKEvent alloc] initWithDictionary:v4];
        if (v8) {
          [(NSMutableArray *)v6 addObject:v8];
        }
      }

      mutableEvents = v5->_mutableEvents;
      v5->_mutableEvents = v6;
      v11 = v6;

      v12 = objc_msgSend(v4, "wlk_stringForKey:", @"serviceId");
      uint64_t v13 = [v12 copy];
      serviceID = v5->_serviceID;
      v5->_serviceID = (NSString *)v13;

      v15 = objc_msgSend(v4, "wlk_dateFromMillisecondsSince1970ForKey:", @"scheduleStartTime");
      uint64_t v16 = [v15 copy];
      startDate = v5->_startDate;
      v5->_startDate = (NSDate *)v16;

      v18 = objc_msgSend(v4, "wlk_dateFromMillisecondsSince1970ForKey:", @"scheduleEndTime");
      uint64_t v19 = [v18 copy];
      endDate = v5->_endDate;
      v5->_endDate = (NSDate *)v19;

      uint64_t v21 = [v4 copy];
      dictionary = v5->_dictionary;
      v5->_dictionary = (NSDictionary *)v21;
    }
    self = v5;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __34__WLKSchedule_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5 = [[WLKEvent alloc] initWithDictionary:v3];

  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v4 = v5;
  }
}

- (NSArray)events
{
  v2 = (void *)[(NSMutableArray *)self->_mutableEvents copy];

  return (NSArray *)v2;
}

- (id)eventForDate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = self->_mutableEvents;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "startDate", (void)v16);
        v12 = [v10 endDate];
        BOOL v13 = [(WLKSchedule *)self _isDate:v4 containedByDate:v11 andDate:v12];

        if (v13)
        {
          id v14 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (id)eventForDate:(id)a3 fuzziness:(double)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = self->_mutableEvents;
  id v8 = (id)[(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = objc_alloc(MEMORY[0x1E4F28C18]);
        BOOL v13 = objc_msgSend(v12, "initWithStartDate:duration:", v6, a4, (void)v17);
        id v14 = [v11 startDate];
        int v15 = [v13 containsDate:v14];

        if (v15)
        {
          id v8 = v11;

          goto LABEL_11;
        }
      }
      id v8 = (id)[(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)adjacentEventsForDate:(id)a3 fuzziness:(double)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v19 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = self->_mutableEvents;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        BOOL v13 = [v12 startDate];
        id v14 = [v13 dateByAddingTimeInterval:-a4];

        int v15 = [v12 endDate];
        long long v16 = [v15 dateByAddingTimeInterval:a4];

        if ([(WLKSchedule *)self _isDate:v6 containedByDate:v14 andDate:v16]) {
          [v19 addObject:v12];
        }
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  long long v17 = (void *)[v19 copy];

  return v17;
}

- (id)eventAfterDate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_mutableEvents;
  id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "startDate", (void)v13);
        uint64_t v11 = [v10 compare:v4];

        if (v11 == 1)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)prune
{
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  if ([(NSMutableArray *)self->_mutableEvents count])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = [(NSMutableArray *)self->_mutableEvents objectAtIndex:v4];
      id v6 = [v5 endDate];
      uint64_t v7 = [v3 compare:v6];

      if (v7 == 1) {
        [v8 addIndex:v4];
      }

      ++v4;
    }
    while (v4 < [(NSMutableArray *)self->_mutableEvents count]);
  }
  [(NSMutableArray *)self->_mutableEvents removeObjectsAtIndexes:v8];
}

- (BOOL)_isDate:(id)a3 containedByDate:(id)a4 andDate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  BOOL v9 = (unint64_t)[v7 compare:a4] <= 1
    && (unint64_t)([v7 compare:v8] + 1) < 2;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (WLKSchedule *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NSDictionary *)self->_dictionary isEqualToDictionary:v4->_dictionary];
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_dictionary hash];
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);

  objc_storeStrong((id *)&self->_mutableEvents, 0);
}

@end