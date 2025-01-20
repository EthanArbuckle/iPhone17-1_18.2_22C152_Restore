@interface NWStatsEntityMapCache
- (NWStatsEntityMapCache)init;
- (double)hitRetainTime;
- (double)missRetainTime;
- (id)description;
- (id)entryForUUID:(id)a3;
- (id)stateDictionary;
- (unsigned)capacityLimit;
- (unsigned)pruneSize;
- (void)pruneCache;
- (void)setCapacityLimit:(unsigned int)a3;
- (void)setEntry:(id)a3 forUUID:(id)a4;
- (void)setHitRetainTime:(double)a3;
- (void)setMissRetainTime:(double)a3;
- (void)setPruneSize:(unsigned int)a3;
@end

@implementation NWStatsEntityMapCache

- (id)entryForUUID:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_uuidMap objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 entityName];
    if (!v7) {
      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:self->_hitRetainTime];
      [v6 setExpiryTime:v8];

      goto LABEL_13;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [v6 expiryTime];
      [v9 timeIntervalSinceNow];
      double v11 = v10;

      if (v11 >= 0.0) {
        goto LABEL_13;
      }
      [(NSMutableDictionary *)self->_uuidMap removeObjectForKey:v4];

      [(NWStatsEntityMapCache *)self pruneCache];
    }
    else
    {
      v12 = NStatGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_21C4BC000, v12, OS_LOG_TYPE_ERROR, "Unexpected class in UUID map", v14, 2u);
      }
    }
  }
  v7 = 0;
LABEL_13:

  return v7;
}

- (NWStatsEntityMapCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)NWStatsEntityMapCache;
  v2 = [(NWStatsEntityMapCache *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    *(_OWORD *)(v2 + 24) = xmmword_21C4F59F0;
    *((void *)v2 + 2) = 0xA00000064;
  }
  return (NWStatsEntityMapCache *)v2;
}

- (void)pruneCache
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v4 = self->_uuidMap;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        double v10 = [(NSMutableDictionary *)self->_uuidMap objectForKeyedSubscript:v9];
        double v11 = [v10 expiryTime];
        [v11 timeIntervalSinceNow];
        double v13 = v12;

        if (v13 < 0.0) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v6);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v3;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        [(NSMutableDictionary *)self->_uuidMap removeObjectForKey:*(void *)(*((void *)&v29 + 1) + 8 * j)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v16);
  }

  if ([(NSMutableDictionary *)self->_uuidMap count] > (unint64_t)self->_capacityLimit)
  {
    v19 = [(NSMutableDictionary *)self->_uuidMap keysSortedByValueUsingComparator:&__block_literal_global_1];
    v20 = objc_msgSend(v19, "subarrayWithRange:", 0, self->_pruneSize);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v26;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(v20);
          }
          [(NSMutableDictionary *)self->_uuidMap removeObjectForKey:*(void *)(*((void *)&v25 + 1) + 8 * k)];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v22);
    }
  }
}

uint64_t __35__NWStatsEntityMapCache_pruneCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 expiryTime];
  uint64_t v6 = [v4 expiryTime];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)setEntry:(id)a3 forUUID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v8 = [(NSMutableDictionary *)self->_uuidMap objectForKeyedSubscript:v7];

    if (v8)
    {
      uint64_t v9 = NStatGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        double v10 = [(NSMutableDictionary *)self->_uuidMap objectForKeyedSubscript:v7];
        int v15 = 138543874;
        id v16 = v7;
        __int16 v17 = 2114;
        v18 = v10;
        __int16 v19 = 2114;
        id v20 = v6;
        _os_log_impl(&dword_21C4BC000, v9, OS_LOG_TYPE_ERROR, "Attempted overwrite of entry for UUID %{public}@, was %{public}@ new %{public}@", (uint8_t *)&v15, 0x20u);
      }
    }
    double v11 = objc_alloc_init(NWStatsEntityMapCacheEntry);
    [(NWStatsEntityMapCacheEntry *)v11 setEntityName:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = 24;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v12 = 32;
      if (isKindOfClass) {
        uint64_t v12 = 24;
      }
    }
    id v14 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:*(double *)((char *)&self->super.isa + v12)];
    [(NWStatsEntityMapCacheEntry *)v11 setExpiryTime:v14];

    if ([(NSMutableDictionary *)self->_uuidMap count] > (unint64_t)self->_capacityLimit) {
      [(NWStatsEntityMapCache *)self pruneCache];
    }
    [(NSMutableDictionary *)self->_uuidMap setObject:v11 forKeyedSubscript:v7];
  }
  else
  {
    NStatGetLog();
    double v11 = (NWStatsEntityMapCacheEntry *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_21C4BC000, &v11->super, OS_LOG_TYPE_ERROR, "Attempted to setEntry other than to a string or NSNull", (uint8_t *)&v15, 2u);
    }
  }
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"NWStatsEntityMapCache %@", self->_uuidMap];
  return v2;
}

- (id)stateDictionary
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_uuidMap;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        double v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_uuidMap, "objectForKeyedSubscript:", v10, (void)v15);
        uint64_t v12 = [v11 description];
        [v4 setObject:v12 forKeyedSubscript:v10];
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [v3 setObject:v4 forKeyedSubscript:@"Cache"];
  double v13 = [MEMORY[0x263EFF910] date];
  [v3 setObject:v13 forKeyedSubscript:@"TimeNow"];

  return v3;
}

- (double)hitRetainTime
{
  return self->_hitRetainTime;
}

- (void)setHitRetainTime:(double)a3
{
  self->_hitRetainTime = a3;
}

- (double)missRetainTime
{
  return self->_missRetainTime;
}

- (void)setMissRetainTime:(double)a3
{
  self->_missRetainTime = a3;
}

- (unsigned)capacityLimit
{
  return self->_capacityLimit;
}

- (void)setCapacityLimit:(unsigned int)a3
{
  self->_capacityLimit = a3;
}

- (unsigned)pruneSize
{
  return self->_pruneSize;
}

- (void)setPruneSize:(unsigned int)a3
{
  self->_pruneSize = a3;
}

- (void).cxx_destruct
{
}

@end