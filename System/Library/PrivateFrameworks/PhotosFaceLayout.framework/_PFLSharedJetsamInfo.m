@interface _PFLSharedJetsamInfo
+ (id)sharedJetsamInfo;
- (BOOL)getInfoFor:(id)a3 into:(jetsam_info *)a4;
- (BOOL)resetIntervalFor:(id)a3;
- (_PFLSharedJetsamInfo)init;
- (void)unregister:(id)a3;
@end

@implementation _PFLSharedJetsamInfo

- (_PFLSharedJetsamInfo)init
{
  v8.receiver = self;
  v8.super_class = (Class)_PFLSharedJetsamInfo;
  v2 = [(_PFLSharedJetsamInfo *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    fetchersLock = v2->_fetchersLock;
    v2->_fetchersLock = (NSLock *)v3;

    uint64_t v5 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    fetchers = v2->_fetchers;
    v2->_fetchers = (NSMapTable *)v5;

    v2->_pid = getpid();
  }
  return v2;
}

+ (id)sharedJetsamInfo
{
  if (sharedJetsamInfo_onceToken != -1) {
    dispatch_once(&sharedJetsamInfo_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedJetsamInfo_sharedJetsamInfo;
  return v2;
}

- (BOOL)getInfoFor:(id)a3 into:(jetsam_info *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v29 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  memset(v14, 0, sizeof(v14));
  int v7 = proc_pid_rusage(self->_pid, 4, (rusage_info_t *)v14);
  if (!v7)
  {
    unint64_t v8 = (unint64_t)v26 >> 10;
    a4->int64_t currentKB = *((void *)&v15 + 1) >> 10;
    a4->int64_t maxLifetimeKB = v8;
    [(NSLock *)self->_fetchersLock lock];
    v9 = [(NSMapTable *)self->_fetchers objectForKey:v6];
    [(NSLock *)self->_fetchersLock unlock];
    if (v9)
    {
      if (*((void *)&v28 + 1) >> 10 <= a4->currentKB) {
        int64_t currentKB = a4->currentKB;
      }
      else {
        int64_t currentKB = *((void *)&v28 + 1) >> 10;
      }
      uint64_t v11 = [v9 longLongValue];
      if (currentKB <= v11) {
        int64_t maxLifetimeKB = v11;
      }
      else {
        int64_t maxLifetimeKB = currentKB;
      }
    }
    else
    {
      int64_t maxLifetimeKB = a4->maxLifetimeKB;
    }
    a4->maxIntervalKB = maxLifetimeKB;
  }
  return v7 == 0;
}

- (BOOL)resetIntervalFor:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v55 = 0;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v38 = 0u;
  if (proc_pid_rusage(self->_pid, 4, buffer))
  {
    BOOL v5 = 0;
  }
  else
  {
    id v25 = v4;
    unint64_t v6 = *((void *)&v54 + 1);
    if (proc_reset_footprint_interval())
    {
      BOOL v5 = 0;
      id v4 = v25;
    }
    else
    {
      uint64_t v7 = v6 >> 10;
      long long v26 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMapTable count](self->_fetchers, "count"));
      [(NSLock *)self->_fetchersLock lock];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      unint64_t v8 = [(NSMapTable *)self->_fetchers keyEnumerator];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v32 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(id *)(*((void *)&v31 + 1) + 8 * i);
            if (v13 != v25)
            {
              v14 = [(NSMapTable *)self->_fetchers objectForKey:*(void *)(*((void *)&v31 + 1) + 8 * i)];
              uint64_t v15 = [v14 longLongValue];

              if (v15 < v7) {
                [v26 addObject:v13];
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v10);
      }

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v16 = v26;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v28 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * j);
            fetchers = self->_fetchers;
            long long v23 = objc_msgSend(NSNumber, "numberWithLongLong:", v7, v25);
            [(NSMapTable *)fetchers setObject:v23 forKey:v21];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v18);
      }

      id v4 = v25;
      [(NSMapTable *)self->_fetchers setObject:&unk_27072F710 forKey:v25];
      [(NSLock *)self->_fetchersLock unlock];

      BOOL v5 = 1;
    }
  }

  return v5;
}

- (void)unregister:(id)a3
{
  fetchersLock = self->_fetchersLock;
  id v5 = a3;
  [(NSLock *)fetchersLock lock];
  [(NSMapTable *)self->_fetchers removeObjectForKey:v5];

  unint64_t v6 = self->_fetchersLock;
  [(NSLock *)v6 unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchersLock, 0);
  objc_storeStrong((id *)&self->_fetchers, 0);
}

@end