@interface _LTDLanguageAssetCache
+ (id)_normalizeAndSortUpdatesFromObservations:(id)a3 toObservations:(id)a4;
+ (id)_normalizeUpdateFromObservation:(id)a3 toObservation:(id)a4;
+ (id)shared;
- (BOOL)_isReadyForObservers;
- (BOOL)applyProgressUpdateForAsset:(id)a3;
- (BOOL)isReadyForAllFilters;
- (BOOL)isReadyForFilter:(unint64_t)a3;
- (NSMutableDictionary)cache;
- (NSSet)requiredAssetIdentifiers;
- (_LTDLanguageAssetCache)init;
- (id)_availableIdentifiers;
- (id)_readAllAssets;
- (id)assetForIdentifier:(id)a3;
- (id)assetsFilteredUsing:(unint64_t)a3;
- (id)preheatWithLanguages:(id)a3;
- (unint64_t)readyFilterSet;
- (void)_multicastObservers;
- (void)addObserver:(id)a3;
- (void)applyAssetUpdates:(id)a3;
- (void)markReadyForFilter:(unint64_t)a3;
- (void)removeObserverForID:(id)a3;
- (void)reset;
- (void)setReadyFilterSet:(unint64_t)a3;
- (void)setRequiredAssets:(id)a3;
@end

@implementation _LTDLanguageAssetCache

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)shared__cache;
  return v2;
}

- (_LTDLanguageAssetCache)init
{
  v11.receiver = self;
  v11.super_class = (Class)_LTDLanguageAssetCache;
  v2 = [(_LTDLanguageAssetCache *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    requiredAssetIdentifiers = v2->_requiredAssetIdentifiers;
    v2->_requiredAssetIdentifiers = (NSSet *)v5;

    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_readyFilterSet = 0;
    uint64_t v7 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (NSMutableDictionary *)v7;

    v9 = v2;
  }

  return v2;
}

- (id)_readAllAssets
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSMutableDictionary *)self->_cache allValues];
  uint64_t v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)_availableIdentifiers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSMutableDictionary *)self->_cache allKeys];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)markReadyForFilter:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  switch(__ROR8__(a3, 4))
  {
    case 0:
      break;
    case 1:
      unint64_t v6 = self->_readyFilterSet | 0x10;
      goto LABEL_7;
    case 2:
      unint64_t v6 = self->_readyFilterSet | 0x20;
      goto LABEL_7;
    case 4:
      unint64_t v6 = self->_readyFilterSet | 0x40;
LABEL_7:
      self->_readyFilterSet = v6;
      break;
    default:
      uint64_t v7 = _LTOSLogAssets();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[_LTDLanguageAssetCache markReadyForFilter:](a3, v7);
      }
      break;
  }
  os_unfair_lock_unlock(p_lock);
  [(_LTDLanguageAssetCache *)self _multicastObservers];
}

- (BOOL)isReadyForFilter:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t readyFilterSet = self->_readyFilterSet;
  os_unfair_lock_unlock(p_lock);
  return (a3 & ~readyFilterSet) == 0;
}

- (id)preheatWithLanguages:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v35 = +[_LTDLanguageAssetService _selectedIdentifiers];
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  unint64_t v6 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(obj);
        }
        objc_super v11 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v12 = [v11 locale];
        [v5 addObject:v12];

        v13 = [v11 ltIdentifier];
        [v6 addObject:v13];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v8);
  }

  +[_LTDLanguageAssetService setSelectedLocales:v5];
  v14 = _LTOSLogAssets();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[_LTDLanguageAssetCache preheatWithLanguages:]((uint64_t)v6, v14);
  }
  v15 = (void *)MEMORY[0x263EFF9C0];
  v16 = [(_LTDLanguageAssetCache *)self _availableIdentifiers];
  v17 = [v15 setWithArray:v16];

  [v17 unionSet:v35];
  [v17 unionSet:v6];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    id v36 = v18;
    uint64_t v21 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v43 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        v24 = [(_LTDLanguageAssetCache *)self assetForIdentifier:v23];
        if ([v6 containsObject:v23])
        {
          if ([v5 count] == 1)
          {
            if ([v23 isEqualToString:@"hi_IN"]) {
              goto LABEL_38;
            }
            v25 = [v24 progress];
            [v25 setComponentFilter:@"ASR"];
          }
          else
          {
            if ([v23 isEqualToString:@"uk_UA"])
            {
              v27 = _LTOSLogAssets();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
                [(_LTDLanguageAssetCache *)&buf preheatWithLanguages:v27];
              }
              v25 = [v24 progress];
              if ([v25 isFinished]) {
                v28 = @"ASR";
              }
              else {
                v28 = @"ASR|MT";
              }
            }
            else
            {
              if (![v23 isEqualToString:@"hi_IN"])
              {
                v25 = [v24 progress];
                if ([v25 isFinished]) {
                  v31 = @"ASR|PB";
                }
                else {
                  v31 = @"ASR|PB|MT";
                }
                v32 = [v24 progress];
                v33 = v31;
                id v18 = v36;
                [v32 setComponentFilter:v33];

                goto LABEL_37;
              }
              v29 = _LTOSLogAssets();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
                [(_LTDLanguageAssetCache *)&v38 preheatWithLanguages:v29];
              }
              v25 = [v24 progress];
              if ([v25 isFinished]) {
                v28 = @"PB";
              }
              else {
                v28 = @"PB|MT";
              }
            }
            v30 = [v24 progress];
            [v30 setComponentFilter:v28];

            id v18 = v36;
          }
        }
        else
        {
          v26 = [v24 progress];
          [v26 removeAllComponents];

          v25 = [v24 progress];
          [v25 setOfflineState:0];
        }
LABEL_37:

LABEL_38:
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v20);
  }

  return v5;
}

- (void)applyAssetUpdates:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v20 = +[_LTDLanguageAssetService _selectedIdentifiers];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v4;
  uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(obj);
        }
        unint64_t v6 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v7 = (void *)MEMORY[0x263EFF9C0];
        uint64_t v8 = [v6 localeIdentifiers];
        uint64_t v9 = [v7 setWithArray:v8];

        [v9 intersectSet:v20];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = [(_LTDLanguageAssetCache *)self assetForIdentifier:*(void *)(*((void *)&v22 + 1) + 8 * j)];
              v16 = [v15 progress];
              v17 = [v6 progress];
              [v16 addComponent:v17];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v12);
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }

  [(_LTDLanguageAssetCache *)self _multicastObservers];
}

- (void)setRequiredAssets:(id)a3
{
  id v4 = a3;
  id v7 = [v4 _ltCompactMap:&__block_literal_global_29];
  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [MEMORY[0x263EFFA08] setWithArray:v7];
  requiredAssetIdentifiers = self->_requiredAssetIdentifiers;
  self->_requiredAssetIdentifiers = v5;

  os_unfair_lock_unlock(&self->_lock);
  [(_LTDLanguageAssetCache *)self applyAssetUpdates:v4];
}

- (BOOL)applyProgressUpdateForAsset:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  requiredAssetIdentifiers = self->_requiredAssetIdentifiers;
  unint64_t v6 = [v4 identifier];
  LOBYTE(requiredAssetIdentifiers) = [(NSSet *)requiredAssetIdentifiers containsObject:v6];

  os_unfair_lock_unlock(&self->_lock);
  if ((requiredAssetIdentifiers & 1) != 0 || ![v4 shouldPurgeWithLocale])
  {
    BOOL v15 = 1;
  }
  else
  {
    id v7 = [v4 progress];
    [v7 cancel];

    if ([v4 isMultiLocaleAsset])
    {
      uint64_t v8 = [(_LTDLanguageAssetCache *)self _readAllAssets];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) progress];
            v14 = [v4 progress];
            [v13 removeComponent:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
        }
        while (v10);
      }
    }
    BOOL v15 = 0;
  }
  id v22 = v4;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  [(_LTDLanguageAssetCache *)self applyAssetUpdates:v16];

  return v15;
}

- (id)assetForIdentifier:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v6 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v4];
  if (!v6)
  {
    id v7 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v4];
    unint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F1C0C8]) initWithLocale:v7 state:3];
    cache = self->_cache;
    uint64_t v9 = [v6 ltIdentifier];
    [(NSMutableDictionary *)cache setObject:v6 forKeyedSubscript:v9];
  }
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)assetsFilteredUsing:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (!-[_LTDLanguageAssetCache isReadyForFilter:](self, "isReadyForFilter:"))
  {
    uint64_t v8 = 0;
    goto LABEL_22;
  }
  uint64_t v5 = [(_LTDLanguageAssetCache *)self _readAllAssets];
  unint64_t v6 = +[_LTDLanguageAssetService _selectedIdentifiers];
  id v7 = v6;
  uint64_t v8 = 0;
  switch(__ROR8__(a3, 4))
  {
    case 0:
      id v9 = v5;
      goto LABEL_17;
    case 1:
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = v5;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (!v11) {
        goto LABEL_16;
      }
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      break;
    case 2:
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __46___LTDLanguageAssetCache_assetsFilteredUsing___block_invoke_2;
      v24[3] = &unk_265546878;
      id v25 = v6;
      uint64_t v8 = objc_msgSend(v5, "lt_filterUsingBlock:", v24);
      long long v18 = v25;
      goto LABEL_20;
    case 4:
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __46___LTDLanguageAssetCache_assetsFilteredUsing___block_invoke;
      v26[3] = &unk_265546878;
      id v27 = v6;
      uint64_t v8 = objc_msgSend(v5, "lt_filterUsingBlock:", v26);
      long long v18 = v27;
LABEL_20:

      goto LABEL_21;
    default:
      goto LABEL_21;
  }
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v10);
      }
      BOOL v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      v16 = objc_msgSend(v15, "ltIdentifier", (void)v20);
      if (([v7 containsObject:v16] & 1) == 0)
      {
        uint64_t v17 = [v15 state];

        if (!v17) {
          continue;
        }
        v16 = [v15 progress];
        [v16 setOfflineState:0];
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
  }
  while (v12);
LABEL_16:

  id v9 = v10;
LABEL_17:
  uint64_t v8 = v9;
LABEL_21:

LABEL_22:
  return v8;
}

- (BOOL)isReadyForAllFilters
{
  return [(_LTDLanguageAssetCache *)self isReadyForFilter:112];
}

- (void)reset
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t readyFilterSet = 0;
  [(NSMutableDictionary *)self->_cache removeAllObjects];
  os_unfair_lock_unlock(p_lock);
}

- (void)addObserver:(id)a3
{
  id v11 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  observers = self->_observers;
  unint64_t v6 = [v11 observerId];
  [(NSMutableDictionary *)observers setObject:v11 forKeyedSubscript:v6];

  int v7 = [v11 isIndeterminate];
  uint64_t v8 = 16;
  if (v7) {
    uint64_t v8 = 24;
  }
  id v9 = (void *)[*(id *)((char *)&self->super.isa + v8) copy];
  os_unfair_lock_unlock(p_lock);
  if ([v9 count])
  {
    id v10 = [v11 observations];
    ((void (**)(void, void *))v10)[2](v10, v9);
  }
}

- (void)removeObserverForID:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v8 = [(NSMutableDictionary *)self->_observers objectForKeyedSubscript:v5];
  [(NSMutableDictionary *)self->_observers setObject:0 forKeyedSubscript:v5];

  os_unfair_lock_unlock(p_lock);
  unint64_t v6 = v8;
  if (v8)
  {
    int v7 = [v8 completion];
    v7[2](v7, 0);

    unint64_t v6 = v8;
  }
}

+ (id)_normalizeUpdateFromObservation:(id)a3 toObservation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = v6;
  id v8 = 0;
  if (v5 && v6)
  {
    id v9 = [v5 locale];
    id v10 = [v9 _ltLocaleIdentifier];
    id v11 = [v7 locale];
    uint64_t v12 = [v11 _ltLocaleIdentifier];
    int v13 = [v10 isEqualToString:v12];

    if (v13)
    {
      if ([v7 status] == 1)
      {
        uint64_t v14 = [v5 status];
        BOOL v15 = v5;
        switch(v14)
        {
          case 1:
            [v5 progress];
            double v18 = v17;
            [v7 progress];
            if (v18 <= v19) {
              BOOL v15 = v7;
            }
            else {
              BOOL v15 = v5;
            }
            break;
          case 2:
            break;
          default:
            goto LABEL_6;
        }
      }
      else
      {
LABEL_6:
        BOOL v15 = v7;
      }
      id v8 = v15;
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

+ (id)_normalizeAndSortUpdatesFromObservations:(id)a3 toObservations:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  id v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        BOOL v15 = [v14 locale];
        v16 = [v15 _ltLocaleIdentifier];
        [v9 setObject:v14 forKeyedSubscript:v16];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v11);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = v6;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        long long v23 = [v22 locale];
        uint64_t v24 = [v23 _ltLocaleIdentifier];

        id v25 = [v9 objectForKeyedSubscript:v24];
        long long v26 = [a1 _normalizeUpdateFromObservation:v22 toObservation:v25];
        if (v26)
        {
          [v8 addObject:v26];
          [v9 setObject:0 forKeyedSubscript:v24];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v19);
  }

  id v27 = [v9 allValues];
  [v8 addObjectsFromArray:v27];

  long long v28 = [v8 sortedArrayUsingSelector:sel_compare_];

  return v28;
}

- (BOOL)_isReadyForObservers
{
  return [(_LTDLanguageAssetCache *)self isReadyForFilter:48];
}

- (void)_multicastObservers
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "Skipping observer multicast due to empty cache", v1, 2u);
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (NSSet)requiredAssetIdentifiers
{
  return self->_requiredAssetIdentifiers;
}

- (unint64_t)readyFilterSet
{
  return self->_readyFilterSet;
}

- (void)setReadyFilterSet:(unint64_t)a3
{
  self->_unint64_t readyFilterSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lastIndeterminateObservationsSorted, 0);
  objc_storeStrong((id *)&self->_lastObservationsSorted, 0);
}

- (void)markReadyForFilter:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2600DC000, a2, OS_LOG_TYPE_ERROR, "Invalid mark ready filter: %lu", (uint8_t *)&v2, 0xCu);
}

- (void)preheatWithLanguages:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_2600DC000, log, OS_LOG_TYPE_DEBUG, "Cache preheat PB exception encountered", buf, 2u);
}

- (void)preheatWithLanguages:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_2600DC000, log, OS_LOG_TYPE_DEBUG, "Cache preheat ASR exception encountered", buf, 2u);
}

- (void)preheatWithLanguages:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2600DC000, a2, OS_LOG_TYPE_DEBUG, "Cache update new identifiers: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end