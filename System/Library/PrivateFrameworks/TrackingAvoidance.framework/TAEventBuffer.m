@interface TAEventBuffer
+ (id)getExpiredElementKeyForClass:(Class)a3 andEventSubtype:(unint64_t)a4;
- (TAEventBuffer)initWithSettings:(id)a3;
- (id)getAllTAEventsBetween:(id)a3;
- (id)getAllTAEventsMatchingCompoundPredicate:(id)a3;
- (id)getAllTAEventsOf:(Class)a3;
- (id)getAllTAEventsOf:(Class)a3 andEventSubtype:(unint64_t)a4;
- (id)getAllTAEventsOf:(Class)a3 andEventSubtype:(unint64_t)a4 between:(id)a5;
- (id)getAllTAEventsOf:(Class)a3 between:(id)a4;
- (id)getEarliestEventDate;
- (id)getLatestElementOf:(Class)a3;
- (id)getLatestElementOf:(Class)a3 andEventSubtype:(unint64_t)a4;
- (void)_updateLatestElement:(id)a3;
- (void)_updateLatestElement:(id)a3 withKey:(id)a4;
- (void)ingestTAEvent:(id)a3;
- (void)purgeWithClock:(id)a3;
- (void)updateLatestExpiredElements:(id)a3;
@end

@implementation TAEventBuffer

- (void)purgeWithClock:(id)a3
{
  id v4 = a3;
  v5 = [(TACircularBuffer *)self->_eventBuffer firstObject];
  v6 = [v5 getDate];
  [v4 timeIntervalSinceDate:v6];
  double v8 = v7;
  [(TAEventBufferSettings *)self->_settings bufferTimeIntervalOfRetention];
  double v10 = v9;

  if (v8 >= v10)
  {
    v11 = (void *)MEMORY[0x263F08A98];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __32__TAEventBuffer_purgeWithClock___block_invoke;
    v15[3] = &unk_2646AAFC8;
    id v16 = v4;
    v17 = self;
    v12 = [v11 predicateWithBlock:v15];
    v13 = [(TACircularBuffer *)self->_eventBuffer removeUntilFirstPredicateFail:v12];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __32__TAEventBuffer_purgeWithClock___block_invoke_2;
    v14[3] = &unk_2646AB080;
    v14[4] = self;
    [v13 enumerateObjectsUsingBlock:v14];
  }
}

- (void)ingestTAEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(TACircularBuffer *)self->_eventBuffer lastObject];
  v6 = v5;
  if (!v5
    || ([v5 getDate],
        double v7 = objc_claimAutoreleasedReturnValue(),
        [v4 getDate],
        double v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v7 compare:v8],
        v8,
        v7,
        v9 != 1))
  {
    v19 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      id v21 = [v4 description];
      int v23 = 136380675;
      uint64_t v24 = [v21 UTF8String];
      _os_log_impl(&dword_22345C000, v20, OS_LOG_TYPE_DEFAULT, "#TAStore adding:%{private}s", (uint8_t *)&v23, 0xCu);
    }
    uint64_t v18 = [(TACircularBuffer *)self->_eventBuffer add:v4];
    goto LABEL_10;
  }
  double v10 = [(TACircularBuffer *)self->_eventBuffer bufferCopy];
  v11 = [(TACircularBuffer *)self->_eventBuffer bufferCopy];
  unint64_t v12 = objc_msgSend(v10, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v11, "count"), 1024, &__block_literal_global_30);

  v13 = [(TACircularBuffer *)self->_eventBuffer bufferCopy];
  unint64_t v14 = [v13 count];

  v15 = (void *)TAStatusLog;
  if (v12 < v14)
  {
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v15;
      id v17 = [v4 description];
      int v23 = 136380675;
      uint64_t v24 = [v17 UTF8String];
      _os_log_impl(&dword_22345C000, v16, OS_LOG_TYPE_DEFAULT, "#TAStore inserting OOO event:%{private}s", (uint8_t *)&v23, 0xCu);
    }
    uint64_t v18 = [(TACircularBuffer *)self->_eventBuffer insert:v4 at:v12];
LABEL_10:
    v22 = (void *)v18;
    if (v18)
    {
      [(TAEventBuffer *)self updateLatestExpiredElements:v18];
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_FAULT)) {
    -[TAEventBuffer ingestTAEvent:](v15, v4);
  }
LABEL_14:
  [(TAEventBuffer *)self _updateLatestElement:v4];
}

- (void)_updateLatestElement:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = +[TAEventBuffer getExpiredElementKeyForClass:andEventSubtype:](TAEventBuffer, "getExpiredElementKeyForClass:andEventSubtype:", objc_opt_class(), [v8 getEventSubtype]);
      if (v6)
      {
        double v7 = (void *)v6;
        [(TAEventBuffer *)self _updateLatestElement:v8 withKey:v6];
      }
    }
    [(TAEventBuffer *)self _updateLatestElement:v8 withKey:v5];
  }
}

- (void)_updateLatestElement:(id)a3 withKey:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  double v7 = [(NSMutableDictionary *)self->_latestElements objectForKeyedSubscript:v6];

  latestElements = self->_latestElements;
  if (v7)
  {
    uint64_t v9 = [(NSMutableDictionary *)latestElements objectForKeyedSubscript:v6];
    double v10 = [v9 getDate];
    v11 = [v13 getDate];
    uint64_t v12 = [v10 compare:v11];

    if (v12 == -1) {
      [(NSMutableDictionary *)self->_latestElements setObject:v13 forKeyedSubscript:v6];
    }
  }
  else
  {
    [(NSMutableDictionary *)latestElements setObject:v13 forKeyedSubscript:v6];
  }
}

uint64_t __32__TAEventBuffer_purgeWithClock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateLatestExpiredElements:a2];
}

BOOL __32__TAEventBuffer_purgeWithClock___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [a2 getDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;
  [*(id *)(*(void *)(a1 + 40) + 8) bufferTimeIntervalOfRetention];
  BOOL v8 = v6 > v7;

  return v8;
}

- (void)updateLatestExpiredElements:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    if (objc_opt_respondsToSelector())
    {
      +[TAEventBuffer getExpiredElementKeyForClass:andEventSubtype:](TAEventBuffer, "getExpiredElementKeyForClass:andEventSubtype:", objc_opt_class(), [v7 getEventSubtype]);
    }
    else
    {
      double v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
    double v6 = };
    if (v6) {
      [(NSMutableDictionary *)self->_latestExpiredElements setValue:v7 forKey:v6];
    }

    id v4 = v7;
  }
}

- (id)getAllTAEventsBetween:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F08730];
  double v5 = [MEMORY[0x263F08A98] predicateForTAEventsInDateInterval:a3];
  v10[0] = v5;
  double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  id v7 = [v4 andPredicateWithSubpredicates:v6];

  BOOL v8 = [(TAEventBuffer *)self getAllTAEventsMatchingCompoundPredicate:v7];

  return v8;
}

- (id)getAllTAEventsMatchingCompoundPredicate:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v6 = self->_latestExpiredElements;
  uint64_t v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_latestExpiredElements, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        [v5 addObject:v11];
      }
      uint64_t v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [v5 filterUsingPredicate:v4];
  [v5 sortUsingComparator:&__block_literal_global_4];
  uint64_t v12 = [(TACircularBuffer *)self->_eventBuffer objectsMatchingPredicate:v4];
  id v13 = [v5 arrayByAddingObjectsFromArray:v12];

  return v13;
}

- (TAEventBuffer)initWithSettings:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TAEventBuffer;
  double v6 = [(TAEventBuffer *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    uint64_t v8 = [[TACircularBuffer alloc] initWithCapacity:[(TAEventBufferSettings *)v7->_settings bufferCapacity]];
    eventBuffer = v7->_eventBuffer;
    v7->_eventBuffer = v8;

    double v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    latestExpiredElements = v7->_latestExpiredElements;
    v7->_latestExpiredElements = v10;

    uint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    latestElements = v7->_latestElements;
    v7->_latestElements = v12;
  }
  return v7;
}

+ (id)getExpiredElementKeyForClass:(Class)a3 andEventSubtype:(unint64_t)a4
{
  id v5 = NSString;
  double v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 stringWithFormat:@"%@:%lu", v7, a4];

  return v8;
}

- (id)getAllTAEventsOf:(Class)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F08730];
  id v5 = [MEMORY[0x263F08A98] predicateForTAEventsClass:a3];
  v10[0] = v5;
  double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  uint64_t v7 = [v4 andPredicateWithSubpredicates:v6];

  uint64_t v8 = [(TAEventBuffer *)self getAllTAEventsMatchingCompoundPredicate:v7];

  return v8;
}

- (id)getAllTAEventsOf:(Class)a3 andEventSubtype:(unint64_t)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F08730];
  double v6 = [MEMORY[0x263F08A98] predicateForTAEventsClass:a3 andEventSubtype:a4];
  v11[0] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  uint64_t v8 = [v5 andPredicateWithSubpredicates:v7];

  uint64_t v9 = [(TAEventBuffer *)self getAllTAEventsMatchingCompoundPredicate:v8];

  return v9;
}

- (id)getAllTAEventsOf:(Class)a3 between:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  double v6 = (void *)MEMORY[0x263F08730];
  uint64_t v7 = [MEMORY[0x263F08A98] predicateForTAEventsInDateInterval:a4];
  v13[0] = v7;
  uint64_t v8 = [MEMORY[0x263F08A98] predicateForTAEventsClass:a3];
  v13[1] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  double v10 = [v6 andPredicateWithSubpredicates:v9];

  v11 = [(TAEventBuffer *)self getAllTAEventsMatchingCompoundPredicate:v10];

  return v11;
}

- (id)getAllTAEventsOf:(Class)a3 andEventSubtype:(unint64_t)a4 between:(id)a5
{
  v15[2] = *MEMORY[0x263EF8340];
  uint64_t v8 = (void *)MEMORY[0x263F08730];
  uint64_t v9 = [MEMORY[0x263F08A98] predicateForTAEventsInDateInterval:a5];
  v15[0] = v9;
  double v10 = [MEMORY[0x263F08A98] predicateForTAEventsClass:a3 andEventSubtype:a4];
  v15[1] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
  uint64_t v12 = [v8 andPredicateWithSubpredicates:v11];

  id v13 = [(TAEventBuffer *)self getAllTAEventsMatchingCompoundPredicate:v12];

  return v13;
}

uint64_t __57__TAEventBuffer_getAllTAEventsMatchingCompoundPredicate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 getDate];
  double v6 = [v4 getDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __31__TAEventBuffer_ingestTAEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 getDate];
  double v6 = [v4 getDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)getEarliestEventDate
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(NSMutableDictionary *)self->_latestExpiredElements count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v3 = self->_latestExpiredElements;
    uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = 0;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_latestExpiredElements, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
          double v10 = [v9 getDate];
          v11 = v10;
          if (v6)
          {
            uint64_t v12 = [v6 earlierDate:v10];

            id v6 = (id)v12;
          }
          else
          {
            id v6 = v10;
          }
        }
        uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v5);
    }
    else
    {
      id v6 = 0;
    }
  }
  else if ([(TACircularBuffer *)self->_eventBuffer count])
  {
    id v13 = [(TACircularBuffer *)self->_eventBuffer firstObject];
    id v6 = [v13 getDate];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)getLatestElementOf:(Class)a3
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(NSMutableDictionary *)self->_latestElements objectForKeyedSubscript:v5];

  return v6;
}

- (id)getLatestElementOf:(Class)a3 andEventSubtype:(unint64_t)a4
{
  uint64_t v5 = +[TAEventBuffer getExpiredElementKeyForClass:a3 andEventSubtype:a4];
  id v6 = [(NSMutableDictionary *)self->_latestElements objectForKeyedSubscript:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestElements, 0);
  objc_storeStrong((id *)&self->_latestExpiredElements, 0);
  objc_storeStrong((id *)&self->_eventBuffer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)ingestTAEvent:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  id v4 = [a2 description];
  int v5 = 136380675;
  uint64_t v6 = [v4 UTF8String];
  _os_log_fault_impl(&dword_22345C000, v3, OS_LOG_TYPE_FAULT, "#TAStore unreacheable state; in-order TAEvent should be added already: %{private}s",
    (uint8_t *)&v5,
    0xCu);
}

@end