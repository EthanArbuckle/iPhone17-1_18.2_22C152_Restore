@interface NRDeviceCollectionHistory
+ (BOOL)supportsSecureCoding;
- (BOOL)dirty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHistory:(id)a3;
- (NRDeviceCollectionHistory)init;
- (NRDeviceCollectionHistory)initWithCoder:(id)a3;
- (NRDeviceCollectionHistory)initWithProtobuf:(id)a3;
- (NRMutableDeviceCollection)deviceCollection;
- (NRPBDeviceCollectionHistory)protobuf;
- (id)_mostRecentStateBefore:(id)a3;
- (id)addObserverQueue:(id)a3 withBlock:(id)a4;
- (id)applyDiff:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceIDAtSwitchIndex:(unsigned int)a3 date:(id *)a4;
- (id)historyEntryAtIndex:(unint64_t)a3;
- (id)switchDeviceIDFromDiff:(id)a3;
- (unint64_t)_findIndexInHistoryStateCache:(id)a3 type:(unint64_t)a4;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)nextIndex;
- (unsigned)switchIndex;
- (void)_createIndex;
- (void)_sanitizeHistory;
- (void)_truncateHistory;
- (void)_updateHistoryCachesWithIndex:(id)a3;
- (void)child:(id)a3 didApplyDiff:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)notifyHistoryObserversWithEntry:(id)a3;
- (void)pruneStateCacheItems:(unint64_t)a3;
- (void)removeObserver:(id)a3;
@end

@implementation NRDeviceCollectionHistory

- (NRDeviceCollectionHistory)init
{
  v22.receiver = self;
  v22.super_class = (Class)NRDeviceCollectionHistory;
  id v2 = [(NRDeviceCollectionHistory *)&v22 init];
  if (v2)
  {
    v3 = (void *)MGGetStringAnswer();
    [v3 isEqualToString:@"Watch"];
    *((void *)v2 + 2) = 10;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v4;

    v6 = [NRDeviceCollectionHistoryEntry alloc];
    v7 = [MEMORY[0x1E4F1C9C8] date];
    v8 = [(NRDeviceCollectionHistoryEntry *)v6 initWithHistory:v2 index:0 date:v7 diff:0 switchIndex:0];

    [*((id *)v2 + 7) addObject:v8];
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    v10 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    v12 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    v14 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA70] orderedSet];
    v16 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v15;

    v17 = objc_alloc_init(NRMutableDeviceCollection);
    v18 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v17;

    [*((id *)v2 + 5) setParentDelegate:v2];
    atomic_store(0, (unsigned __int8 *)v2 + 24);
    *((_DWORD *)v2 + 7) = 0;
    *((_DWORD *)v2 + 8) = 0;
    uint64_t v19 = objc_opt_new();
    v20 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v19;

    -[NRSwitchRecordCollection addSwitchRecordWithHistoryEntry:](*((void *)v2 + 8), v8);
  }
  return (NRDeviceCollectionHistory *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)dirty
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_atomicDirty);
  return v2 & 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (self) {
    switchRecords = self->_switchRecords;
  }
  else {
    switchRecords = 0;
  }
  id v5 = a3;
  [(NRSwitchRecordCollection *)switchRecords truncateSwitchRecords];
  v6 = [(NRDeviceCollectionHistory *)self protobuf];
  v7 = [v6 data];
  [v5 encodeObject:v7 forKey:@"data"];

  atomic_store(0, (unsigned __int8 *)&self->_atomicDirty);
}

- (void)_createIndex
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = self->_history;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        -[NRDeviceCollectionHistoryEntry setHistoryManager:](*(void *)(*((void *)&v15 + 1) + 8 * v7++), self);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  v8 = [(NSMutableArray *)self->_history lastObject];
  uint64_t v9 = [v8 state];
  v10 = (NRMutableDeviceCollection *)[v9 copyWithZone:0];
  deviceCollection = self->_deviceCollection;
  self->_deviceCollection = v10;

  v12 = self->_deviceCollection;
  if (!v12)
  {
    uint64_t v13 = objc_alloc_init(NRMutableDeviceCollection);
    v14 = self->_deviceCollection;
    self->_deviceCollection = v13;

    v12 = self->_deviceCollection;
  }
  [(NRMutableStateBase *)v12 setParentDelegate:self];
}

- (NRDeviceCollectionHistory)initWithCoder:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NRDeviceCollectionHistory *)self init];
  if (!v5) {
    goto LABEL_25;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (!v6)
  {
    v5->_startIndex = [v4 decodeInt64ForKey:@"startIndex"];
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"history"];
    history = v5->_history;
    v5->_history = (NSMutableArray *)v13;

    [(NRDeviceCollectionHistory *)v5 _sanitizeHistory];
    [(NRDeviceCollectionHistory *)v5 _createIndex];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"switchRecordCollection"];
    switchRecords = v5->_switchRecords;
    v5->_switchRecords = (NRSwitchRecordCollection *)v15;

    long long v17 = v5->_switchRecords;
    long long v18 = nr_daemon_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      if (!v19)
      {
LABEL_24:
        [(NRDeviceCollectionHistory *)v5 _truncateHistory];
LABEL_25:
        uint64_t v9 = v5;
        goto LABEL_26;
      }
      p_super = nr_daemon_log();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A356E000, p_super, OS_LOG_TYPE_DEFAULT, "Loaded switch history", buf, 2u);
      }
    }
    else
    {
      if (v19)
      {
        v21 = nr_daemon_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A356E000, v21, OS_LOG_TYPE_DEFAULT, "Migrating switch history", buf, 2u);
        }
      }
      objc_super v22 = [NRSwitchRecordCollection alloc];
      v23 = v5->_history;
      if (v22)
      {
        objc_super v22 = [(NRSwitchRecordCollection *)v22 init];
        if (v22)
        {
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          v24 = v23;
          uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:buf count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v31;
            do
            {
              uint64_t v28 = 0;
              do
              {
                if (*(void *)v31 != v27) {
                  objc_enumerationMutation(v24);
                }
                -[NRSwitchRecordCollection addSwitchRecordWithHistoryEntry:]((uint64_t)v22, *(void **)(*((void *)&v30 + 1) + 8 * v28++));
              }
              while (v26 != v28);
              uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:buf count:16];
            }
            while (v26);
          }
        }
      }

      p_super = &v5->_switchRecords->super.super.super;
      v5->_switchRecords = v22;
    }

    goto LABEL_24;
  }
  uint64_t v7 = (void *)v6;
  v8 = [[NRPBDeviceCollectionHistory alloc] initWithData:v6];
  uint64_t v9 = [(NRDeviceCollectionHistory *)v5 initWithProtobuf:v8];

LABEL_26:
  return v9;
}

- (NRDeviceCollectionHistory)initWithProtobuf:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NRDeviceCollectionHistory *)self init];
  uint64_t v6 = v5;
  if (v5)
  {
    if (v4) {
      unint64_t v7 = v4[1];
    }
    else {
      unint64_t v7 = 0;
    }
    v5->_startIndex = v7;
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    history = v6->_history;
    v6->_history = (NSMutableArray *)v8;

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    if (v4) {
      v10 = (void *)v4[2];
    }
    else {
      v10 = 0;
    }
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * v15);
          long long v17 = v6->_history;
          long long v18 = [NRDeviceCollectionHistoryEntry alloc];
          BOOL v19 = -[NRDeviceCollectionHistoryEntry initWithProtobuf:](v18, "initWithProtobuf:", v16, (void)v26);
          [(NSMutableArray *)v17 addObject:v19];

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v13);
    }

    [(NRDeviceCollectionHistory *)v6 _createIndex];
    uint64_t v20 = objc_opt_new();
    switchRecords = v6->_switchRecords;
    v6->_switchRecords = (NRSwitchRecordCollection *)v20;

    uint64_t v22 = (uint64_t)v6->_switchRecords;
    if (v4) {
      v23 = (void *)v4[3];
    }
    else {
      v23 = 0;
    }
    id v24 = v23;
    -[NRPBSwitchRecordCollection mergeFrom:](v22, (uint64_t)v24);

    [(NRDeviceCollectionHistory *)v6 _truncateHistory];
  }

  return v6;
}

- (void)_sanitizeHistory
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = nr_framework_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v4);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1A356E000, v3, OS_LOG_TYPE_ERROR, "Deserialized history is not a supported type: %@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    history = self->_history;
    self->_history = v6;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__3;
  uint64_t v13 = __Block_byref_object_dispose__3;
  id v14 = 0;
  uint64_t v8 = self->_history;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__NRDeviceCollectionHistory__sanitizeHistory__block_invoke;
  v9[3] = &unk_1E5B01778;
  v9[4] = &buf;
  [(NSMutableArray *)v8 enumerateObjectsUsingBlock:v9];
  if (*(void *)(*((void *)&buf + 1) + 40)) {
    -[NSMutableArray removeObjectsAtIndexes:](self->_history, "removeObjectsAtIndexes:");
  }
  _Block_object_dispose(&buf, 8);
}

void __45__NRDeviceCollectionHistory__sanitizeHistory__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = nr_framework_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      uint64_t v8 = nr_framework_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        int v15 = 134218242;
        uint64_t v16 = a3;
        __int16 v17 = 2112;
        long long v18 = v10;
        _os_log_impl(&dword_1A356E000, v8, OS_LOG_TYPE_DEFAULT, "History entry at index %lu is not recognized type: %@", (uint8_t *)&v15, 0x16u);
      }
    }
    uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v11)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v11 addIndex:a3];
  }
}

- (NRPBDeviceCollectionHistory)protobuf
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  id v4 = (void *)v3;
  if (v3)
  {
    unint64_t startIndex = self->_startIndex;
    *(unsigned char *)(v3 + 32) |= 1u;
    *(void *)(v3 + 8) = startIndex;
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  -[NRPBDeviceCollectionHistory setHistorys:]((uint64_t)v4, v6);

  -[NRPBDeviceCollectionHistory setSwitchRecords:]((uint64_t)v4, self->_switchRecords);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v7 = self->_history;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
        if (v4) {
          uint64_t v13 = (void *)v4[2];
        }
        else {
          uint64_t v13 = 0;
        }
        id v14 = v13;
        int v15 = objc_msgSend(v12, "protobuf", (void)v18);
        [v14 addObject:v15];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v16 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v9 = v16;
    }
    while (v16);
  }

  return (NRPBDeviceCollectionHistory *)v4;
}

- (unint64_t)_findIndexInHistoryStateCache:(id)a3 type:(unint64_t)a4
{
  historyStateCacheIndex = self->_historyStateCacheIndex;
  id v6 = a3;
  unint64_t v7 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](historyStateCacheIndex, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, [(NSMutableArray *)historyStateCacheIndex count], a4, &__block_literal_global_148);

  return v7;
}

uint64_t __64__NRDeviceCollectionHistory__findIndexInHistoryStateCache_type___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 longLongValue];
  if (v6 <= [v5 longLongValue])
  {
    uint64_t v8 = [v4 longLongValue];
    if (v8 >= [v5 longLongValue]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (id)_mostRecentStateBefore:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_historyStateCacheIndex count])
  {
    id v5 = [(NSMutableDictionary *)self->_historyStateCache objectForKeyedSubscript:v4];

    if (v5)
    {
      id v6 = v4;
LABEL_6:
      uint64_t v8 = v6;
      goto LABEL_8;
    }
    unint64_t v7 = [(NRDeviceCollectionHistory *)self _findIndexInHistoryStateCache:v4 type:1024];
    if (v7)
    {
      id v6 = [(NSMutableArray *)self->_historyStateCacheIndex objectAtIndexedSubscript:v7 - 1];
      goto LABEL_6;
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (void)_updateHistoryCachesWithIndex:(id)a3
{
  id v9 = a3;
  [(NSMutableArray *)self->_historyStateCacheMRU removeObject:v9];
  [(NSMutableArray *)self->_historyStateCacheMRU insertObject:v9 atIndex:0];
  if (![(NSMutableArray *)self->_historyStateCacheIndex count])
  {
    historyStateCacheIndex = self->_historyStateCacheIndex;
    goto LABEL_6;
  }
  unint64_t v4 = [(NRDeviceCollectionHistory *)self _findIndexInHistoryStateCache:v9 type:1024];
  uint64_t v5 = [(NSMutableArray *)self->_historyStateCacheIndex count];
  historyStateCacheIndex = self->_historyStateCacheIndex;
  if (v4 == v5)
  {
LABEL_6:
    [(NSMutableArray *)historyStateCacheIndex addObject:v9];
    goto LABEL_7;
  }
  unint64_t v7 = [(NSMutableArray *)historyStateCacheIndex objectAtIndexedSubscript:v4];
  char v8 = [v9 isEqual:v7];

  if ((v8 & 1) == 0) {
    [(NSMutableArray *)self->_historyStateCacheIndex insertObject:v9 atIndex:v4];
  }
LABEL_7:
  [(NRDeviceCollectionHistory *)self pruneStateCacheItems:1];
}

- (void)pruneStateCacheItems:(unint64_t)a3
{
  for (i = self->_historyStateCacheMRU; [(NSMutableArray *)i count] > a3; i = self->_historyStateCacheMRU)
  {
    id v6 = [(NSMutableArray *)self->_historyStateCacheMRU lastObject];
    [(NSMutableArray *)self->_historyStateCacheMRU removeLastObject];
    [(NSMutableDictionary *)self->_historyStateCache removeObjectForKey:v6];
    [(NSMutableArray *)self->_historyStateCacheIndex removeObject:v6];
  }
}

- (void)_truncateHistory
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v4 = [(NSMutableArray *)self->_history firstObject];
  uint64_t v5 = [v4 date];

  [v3 timeIntervalSinceDate:v5];
  double v7 = v6;
  if ([(NRDeviceCollectionHistory *)self count] >= 5
    && ([(NRDeviceCollectionHistory *)self count] > self->_maxHistoryDepth || v7 > 86400.0))
  {
    context = (void *)MEMORY[0x1A624A5B0]();
    v47 = objc_alloc_init(NRMutableDeviceCollection);
    if ((unint64_t)[(NSMutableArray *)self->_history count] <= self->_maxHistoryDepth) {
      unint64_t v8 = 0;
    }
    else {
      unint64_t v8 = [(NSMutableArray *)self->_history count] - self->_maxHistoryDepth;
    }
    v46 = v5;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v9 = self->_history;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      unint64_t v12 = 0;
      uint64_t v13 = *(void *)v49;
      while (2)
      {
        uint64_t v14 = 0;
        unint64_t v15 = v11 + v12;
        do
        {
          if (*(void *)v49 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v16 = [*(id *)(*((void *)&v48 + 1) + 8 * v14) date];
          [v3 timeIntervalSinceDate:v16];
          double v18 = v17;

          if (v18 <= 86400.0)
          {
            unint64_t v15 = v12 + v14;
            goto LABEL_18;
          }
          ++v14;
        }
        while (v11 != v14);
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v48 objects:v54 count:16];
        unint64_t v12 = v15;
        if (v11) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v15 = 0;
    }
LABEL_18:

    if (v8 <= v15) {
      unint64_t v19 = v15;
    }
    else {
      unint64_t v19 = v8;
    }
    unint64_t v20 = [(NRDeviceCollectionHistory *)self count];
    if (v19 >= v20 - 4) {
      unint64_t v21 = v20 - 4;
    }
    else {
      unint64_t v21 = v19;
    }
    uint64_t v22 = [(NSMutableArray *)self->_history objectAtIndexedSubscript:v21];
    uint64_t v23 = [v22 state];
    id v24 = nr_daemon_log();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

    if (v25)
    {
      long long v26 = nr_daemon_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v53 = v23;
        _os_log_impl(&dword_1A356E000, v26, OS_LOG_TYPE_DEFAULT, "Device collection migrated to most recent history entry %p", buf, 0xCu);
      }
    }
    uint64_t v27 = +[NRMutableDeviceCollection diffFrom:v47 to:v23];
    long long v28 = nr_daemon_log();
    BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

    if (v29)
    {
      long long v30 = nr_daemon_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v53 = v21;
        _os_log_impl(&dword_1A356E000, v30, OS_LOG_TYPE_DEFAULT, "Deleting %lld items from history", buf, 0xCu);
      }
    }
    id obj = (id)v27;
    v44 = (void *)v23;
    if (v21)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        long long v32 = [(NSMutableArray *)self->_history objectAtIndex:i];
        long long v33 = nr_daemon_log();
        BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

        if (v34)
        {
          v35 = nr_daemon_log();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            if (v32) {
              uint64_t v36 = v32[5];
            }
            else {
              uint64_t v36 = 0;
            }
            *(_DWORD *)long long buf = 134217984;
            uint64_t v53 = v36;
            _os_log_impl(&dword_1A356E000, v35, OS_LOG_TYPE_DEFAULT, "Clearing historical device collection %p", buf, 0xCu);
          }
        }
        -[NRDeviceCollectionHistoryEntry setHistoryManager:]((uint64_t)v32, 0);
      }
    }
    -[NSMutableArray removeObjectsInRange:](self->_history, "removeObjectsInRange:", 0, v21);
    self->_startIndex += v21;
    if (v22) {
      objc_storeStrong(v22 + 4, obj);
    }
    v37 = v22;
    if ([(NSMutableArray *)self->_historyStateCacheIndex count])
    {
      v38 = [NSNumber numberWithLongLong:self->_startIndex];
      unint64_t v39 = [(NRDeviceCollectionHistory *)self _findIndexInHistoryStateCache:v38 type:1024];

      if (v39 == [(NSMutableArray *)self->_historyStateCacheIndex count])
      {
        [(NSMutableDictionary *)self->_historyStateCache removeAllObjects];
        [(NSMutableArray *)self->_historyStateCacheIndex removeAllObjects];
        [(NSMutableArray *)self->_historyStateCacheMRU removeAllObjects];
      }
      else
      {
        if (v39) {
          unint64_t v40 = v39 - 1;
        }
        else {
          unint64_t v40 = 0;
        }
        if (v39)
        {
          unint64_t v41 = 0;
          do
          {
            v42 = [(NSMutableArray *)self->_historyStateCacheIndex firstObject];
            [(NSMutableDictionary *)self->_historyStateCache removeObjectForKey:v42];
            [(NSMutableArray *)self->_historyStateCacheIndex removeObject:v42];
            [(NSMutableArray *)self->_historyStateCacheMRU removeObject:v42];

            ++v41;
          }
          while (v41 <= v40);
        }
      }
    }

    uint64_t v5 = v46;
  }
}

- (id)historyEntryAtIndex:(unint64_t)a3
{
  unint64_t startIndex = self->_startIndex;
  if (startIndex > a3 || [(NSMutableArray *)self->_history count] + startIndex <= a3)
  {
    double v6 = 0;
  }
  else
  {
    double v6 = [(NSMutableArray *)self->_history objectAtIndexedSubscript:a3 - self->_startIndex];
  }

  return v6;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_history count];
}

- (unint64_t)nextIndex
{
  unint64_t startIndex = self->_startIndex;
  return [(NSMutableArray *)self->_history count] + startIndex;
}

- (id)applyDiff:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [(NRMutableDeviceCollection *)self->_deviceCollection applyDiff:v4 upOnly:0 notifyParent:1 unconditional:0];

    if (v5)
    {
      double v6 = [(NSMutableArray *)self->_history lastObject];
      id v4 = (id)v5;
    }
    else
    {
      double v6 = 0;
      id v4 = 0;
    }
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)addObserverQueue:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = objc_alloc_init(NRDeviceCollectionHistoryObserverWrapper);
  [(NRDeviceCollectionHistoryObserverWrapper *)v8 setObserver:v6];

  [(NRDeviceCollectionHistoryObserverWrapper *)v8 setQueue:v7];
  os_unfair_lock_lock(&self->_observerLock);
  [(NSMutableOrderedSet *)self->_observers addObject:v8];
  os_unfair_lock_unlock(&self->_observerLock);

  return v8;
}

- (void)removeObserver:(id)a3
{
  p_observerLock = &self->_observerLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observerLock);
  [(NSMutableOrderedSet *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_observerLock);
}

- (void)child:(id)a3 didApplyDiff:(id)a4
{
  uint64_t v14 = (NRMutableDeviceCollection *)a3;
  id v6 = a4;
  if (v6 && self->_deviceCollection == v14)
  {
    LODWORD(v7) = [(NRDeviceCollectionHistory *)self switchIndex];
    unint64_t v8 = [(NRDeviceCollectionHistory *)self switchDeviceIDFromDiff:v6];

    if (v8) {
      uint64_t v7 = (v7 + 1);
    }
    else {
      uint64_t v7 = v7;
    }
    id v9 = [NRDeviceCollectionHistoryEntry alloc];
    unint64_t startIndex = self->_startIndex;
    unint64_t v11 = [(NSMutableArray *)self->_history count] + startIndex;
    unint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v13 = [(NRDeviceCollectionHistoryEntry *)v9 initWithHistory:self index:v11 date:v12 diff:v6 switchIndex:v7];

    [(NSMutableArray *)self->_history addObject:v13];
    -[NRSwitchRecordCollection addSwitchRecordWithHistoryEntry:]((uint64_t)self->_switchRecords, v13);
    [(NRDeviceCollectionHistory *)self _truncateHistory];
    atomic_store(1u, (unsigned __int8 *)&self->_atomicDirty);
    [(NRDeviceCollectionHistory *)self notifyHistoryObserversWithEntry:v13];
  }
}

- (unsigned)switchIndex
{
  switchRecords = self->_switchRecords;
  if (switchRecords) {
    switchRecords = (NRSwitchRecordCollection *)switchRecords->super._records;
  }
  uint64_t v3 = switchRecords;
  id v4 = [(NRSwitchRecordCollection *)v3 lastObject];
  if (v4) {
    unsigned int v5 = v4[6];
  }
  else {
    unsigned int v5 = 0;
  }

  return v5;
}

- (id)switchDeviceIDFromDiff:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v17 = *(void *)v19;
    uint64_t v16 = @"isActive";
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v17) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        unint64_t v8 = objc_msgSend(v3, "objectForKeyedSubscript:", v7, v16);
        id v9 = [v8 diff];
        uint64_t v10 = [v9 objectForKeyedSubscript:v16];
        unint64_t v11 = [v10 diff];
        unint64_t v12 = [v11 value];
        int v13 = [v12 isEqual:MEMORY[0x1E4F1CC38]];

        if (v13)
        {
          id v14 = v7;

          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (id)deviceIDAtSwitchIndex:(unsigned int)a3 date:(id *)a4
{
  switchRecords = self->_switchRecords;
  if (!switchRecords || (uint64_t v7 = switchRecords->super._records, v7, !v7))
  {
    int v13 = 0;
    goto LABEL_15;
  }
  uint64_t v8 = objc_opt_new();
  id v9 = (void *)v8;
  if (v8)
  {
    *(unsigned char *)(v8 + 28) |= 2u;
    *(_DWORD *)(v8 + 24) = a3;
  }
  uint64_t v10 = switchRecords->super._records;
  unint64_t v11 = switchRecords->super._records;
  uint64_t v12 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](v10, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, [(NSMutableArray *)v11 count], 256, &__block_literal_global_5);

  int v13 = 0;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = [(NSMutableArray *)switchRecords->super._records objectAtIndexedSubscript:v12];
    uint64_t v15 = objc_opt_new();
    -[NRPBSwitchRecord mergeFrom:](v15, v14);
    if (v15)
    {
      id v16 = *(id *)(v15 + 16);
      int v13 = [v16 toUUID];

      if (!a4)
      {
LABEL_13:

        goto LABEL_14;
      }
      if (*(unsigned char *)(v15 + 28))
      {
        uint64_t v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*(double *)(v15 + 8)];
      }
      else
      {
        uint64_t v17 = 0;
      }
    }
    else
    {
      int v13 = 0;
      uint64_t v17 = 0;
      if (!a4) {
        goto LABEL_13;
      }
    }
    *a4 = v17;
    goto LABEL_13;
  }
LABEL_14:

LABEL_15:

  return v13;
}

- (void)notifyHistoryObserversWithEntry:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_observerLock = &self->_observerLock;
  os_unfair_lock_lock(&self->_observerLock);
  id v6 = (void *)[(NSMutableOrderedSet *)self->_observers copy];
  os_unfair_lock_unlock(p_observerLock);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v13 = [v12 queue];

        if (v13)
        {
          id v14 = [v12 queue];
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __61__NRDeviceCollectionHistory_notifyHistoryObserversWithEntry___block_invoke;
          v16[3] = &unk_1E5B002A8;
          v16[4] = v12;
          id v17 = v4;
          dispatch_async(v14, v16);
        }
        else
        {
          uint64_t v15 = [v12 observer];
          ((void (**)(void, id, void *))v15)[2](v15, v4, v12);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

void __61__NRDeviceCollectionHistory_notifyHistoryObserversWithEntry___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observer];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)invalidate
{
  [(NRMutableDeviceCollection *)self->_deviceCollection invalidate];
  os_unfair_lock_lock(&self->_observerLock);
  [(NSMutableOrderedSet *)self->_observers removeAllObjects];
  os_unfair_lock_unlock(&self->_observerLock);
  [(NSMutableArray *)self->_history removeAllObjects];
  [(NSMutableDictionary *)self->_historyStateCache removeAllObjects];
  [(NSMutableArray *)self->_historyStateCacheMRU removeAllObjects];
  historyStateCacheIndex = self->_historyStateCacheIndex;

  [(NSMutableArray *)historyStateCacheIndex removeAllObjects];
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = self->_history;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    id v6 = &stru_1EF6CAD80;
    do
    {
      uint64_t v7 = 0;
      uint64_t v8 = v6;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "description", (void)v11);
        id v6 = [(__CFString *)v8 stringByAppendingString:v9];

        ++v7;
        uint64_t v8 = v6;
      }
      while (v4 != v7);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    id v6 = &stru_1EF6CAD80;
  }

  return v6;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v8 = (void *)[(NSMutableArray *)self->_history copy];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (NRDeviceCollectionHistory *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NRDeviceCollectionHistory *)self isEqualToHistory:v4];
  }

  return v5;
}

- (BOOL)isEqualToHistory:(id)a3
{
  uint64_t v4 = (NRDeviceCollectionHistory *)a3;
  BOOL v5 = v4;
  BOOL v6 = v4 == self
    || v4
    && [(NRMutableDeviceCollection *)self->_deviceCollection isEqual:v4->_deviceCollection]
    && self->_startIndex == v5->_startIndex;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 48) = self->_startIndex;
  uint64_t v6 = [(NSMutableArray *)self->_history mutableCopyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = *(id *)(v5 + 56);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        -[NRDeviceCollectionHistoryEntry setHistoryManager:](*(void *)(*((void *)&v21 + 1) + 8 * v12++), (void *)v5);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  long long v13 = objc_msgSend(*(id *)(v5 + 56), "lastObject", (void)v21);
  long long v14 = [v13 state];
  uint64_t v15 = [v14 copyWithZone:0];
  uint64_t v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  id v17 = *(void **)(v5 + 40);
  if (!v17)
  {
    long long v18 = objc_alloc_init(NRMutableDeviceCollection);
    long long v19 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v18;

    id v17 = *(void **)(v5 + 40);
  }
  [v17 setParentDelegate:v5];
  return (id)v5;
}

- (NRMutableDeviceCollection)deviceCollection
{
  return self->_deviceCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyStateCacheIndex, 0);
  objc_storeStrong((id *)&self->_historyStateCacheMRU, 0);
  objc_storeStrong((id *)&self->_historyStateCache, 0);
  objc_storeStrong((id *)&self->_switchRecords, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_deviceCollection, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end