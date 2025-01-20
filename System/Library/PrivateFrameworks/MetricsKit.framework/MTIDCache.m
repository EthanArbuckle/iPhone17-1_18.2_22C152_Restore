@interface MTIDCache
+ (BOOL)idInfo:(id)a3 isValidForDate:(id)a4;
- (MTIDCache)init;
- (NSMutableDictionary)cache;
- (NSMutableDictionary)promiseCache;
- (id)IDInfoForScheme:(id)a3 options:(id)a4;
- (id)optionsDescription:(id)a3;
- (id)promiseKeyForScheme:(id)a3 options:(id)a4;
- (void)addIDInfo:(id)a3 reset:(BOOL)a4;
- (void)addIdInfoPromise:(id)a3 forScheme:(id)a4 options:(id)a5;
- (void)removeAllNamespaces;
- (void)removeNamespace:(id)a3;
- (void)removeNamespaces:(id)a3;
- (void)removeUnsyncedNamespaces;
- (void)setCache:(id)a3;
- (void)setPromiseCache:(id)a3;
@end

@implementation MTIDCache

void __32__MTIDCache_optionsDescription___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 description];
    v6 = (void *)v5;
    v7 = &stru_26C95D008;
    if (v5) {
      v7 = (__CFString *)v5;
    }
    v8 = v7;

    v9 = *(void **)(a1 + 40);
    v10 = [NSString stringWithFormat:@"%@=%@", v11, v8];

    [v9 addObject:v10];
  }
}

- (void)addIdInfoPromise:(id)a3 forScheme:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MTIDCache *)self promiseKeyForScheme:v9 options:v10];
  v12 = [v10 objectForKeyedSubscript:@"reset"];
  char v13 = [v12 BOOLValue];

  v14 = self;
  objc_sync_enter(v14);
  v15 = [(MTIDCache *)v14 promiseCache];
  [v15 setObject:v8 forKeyedSubscript:v11];

  objc_sync_exit(v14);
  objc_initWeak(&location, v14);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __48__MTIDCache_addIdInfoPromise_forScheme_options___block_invoke;
  v17[3] = &unk_264310118;
  objc_copyWeak(&v19, &location);
  id v16 = v11;
  id v18 = v16;
  char v20 = v13;
  [v8 addFinishBlock:v17];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

+ (BOOL)idInfo:(id)a3 isValidForDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 effectiveDate];
  id v8 = v7;
  if (v7 && [v7 compare:v6] == 1)
  {
    BOOL v9 = 0;
  }
  else
  {
    id v10 = [v5 expirationDate];
    id v11 = v10;
    BOOL v9 = !v10 || [v10 compare:v6] != -1;
  }
  return v9;
}

- (id)IDInfoForScheme:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  BOOL v9 = [v7 objectForKeyedSubscript:@"date"];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x263EFF910] now];
  }
  v12 = v11;

  uint64_t v13 = [v7 objectForKeyedSubscript:@"dsId"];
  v14 = (void *)v13;
  v15 = &unk_26C96FD78;
  if (v13) {
    v15 = (void *)v13;
  }
  id v16 = v15;

  v17 = [(MTIDCache *)v8 cache];
  id v18 = [v6 idNamespace];
  id v19 = [v17 objectForKeyedSubscript:v18];

  if (!v19) {
    goto LABEL_13;
  }
  char v20 = [v19 scheme];
  if (![v20 isEqual:v6]
    || !+[MTIDCache idInfo:v19 isValidForDate:v12])
  {

    goto LABEL_13;
  }
  id v21 = [v19 dsId];
  if (v21 != v16)
  {
    v22 = [v19 dsId];
    int v23 = [v16 isEqual:v22];

    if (v23) {
      goto LABEL_18;
    }
LABEL_13:
    v24 = [(MTIDCache *)v8 promiseKeyForScheme:v6 options:v7];
    v25 = [(MTIDCache *)v8 promiseCache];
    v26 = [v25 objectForKeyedSubscript:v24];

    goto LABEL_14;
  }

LABEL_18:
  v26 = +[MTPromise promiseWithResult:v19];
LABEL_14:

  objc_sync_exit(v8);

  return v26;
}

- (NSMutableDictionary)promiseCache
{
  return self->_promiseCache;
}

- (id)promiseKeyForScheme:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[v6 mutableCopy];
  BOOL v9 = [v6 objectForKeyedSubscript:@"date"];

  if (v9) {
    goto LABEL_4;
  }
  uint64_t v10 = [MEMORY[0x263EFF910] now];
  if (v10)
  {
    BOOL v9 = (void *)v10;
LABEL_4:
    id v11 = v9;
    goto LABEL_5;
  }
  id v11 = [MEMORY[0x263EFF910] now];
  BOOL v9 = v11;
LABEL_5:
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  v14 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceReferenceDate:round(v13 / 10.0) * 10.0];
  [v8 setObject:v14 forKeyedSubscript:@"date"];

  v15 = NSString;
  id v16 = [v7 idNamespace];

  if (v16) {
    v17 = v16;
  }
  else {
    v17 = &stru_26C95D008;
  }
  id v18 = [(MTIDCache *)self optionsDescription:v8];
  id v19 = [v15 stringWithFormat:@"%@:%@", v17, v18];

  return v19;
}

- (id)optionsDescription:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = +[MTIDCommon idOptions];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  double v12 = __32__MTIDCache_optionsDescription___block_invoke;
  double v13 = &unk_2643100F0;
  id v14 = v3;
  id v15 = v4;
  id v6 = v4;
  id v7 = v3;
  [v5 enumerateObjectsUsingBlock:&v10];

  id v8 = objc_msgSend(v6, "componentsJoinedByString:", @",", v10, v11, v12, v13);

  return v8;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

void __48__MTIDCache_addIdInfoPromise_forScheme_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    objc_sync_enter(v8);
    BOOL v9 = [v8 promiseCache];
    [v9 removeObjectForKey:*(void *)(a1 + 32)];

    if (v10) {
      [v8 addIDInfo:v10 reset:*(unsigned __int8 *)(a1 + 48)];
    }
    objc_sync_exit(v8);
  }
}

- (void)addIDInfo:(id)a3 reset:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = [(MTIDCache *)v6 cache];
  id v8 = [v17 scheme];
  BOOL v9 = [v8 idNamespace];
  id v10 = [v7 objectForKeyedSubscript:v9];

  if (v10 == v17 || ([v10 isEqual:v17] & 1) != 0)
  {

    objc_sync_exit(v6);
LABEL_4:

    goto LABEL_5;
  }
  uint64_t v11 = [v17 scheme];
  double v12 = [v11 idNamespace];
  [(MTIDCache *)v6 removeNamespace:v12];

  double v13 = [(MTIDCache *)v6 cache];
  id v14 = [v17 scheme];
  id v15 = [v14 idNamespace];
  [v13 setObject:v17 forKeyedSubscript:v15];

  objc_sync_exit(v6);
  if (v4)
  {
    id v6 = [v17 scheme];
    id v16 = [(MTIDCache *)v6 idNamespace];
    +[MTInterprocessChangeNotifier notify:v16];

    goto LABEL_4;
  }
LABEL_5:
}

- (MTIDCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTIDCache;
  v2 = [(MTIDCache *)&v6 init];
  if (v2)
  {
    id v3 = [MEMORY[0x263EFF9A0] dictionary];
    [(MTIDCache *)v2 setCache:v3];

    BOOL v4 = [MEMORY[0x263EFF9A0] dictionary];
    [(MTIDCache *)v2 setPromiseCache:v4];
  }
  return v2;
}

- (void)removeNamespace:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v7 = a3;
  BOOL v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  objc_super v6 = [v4 arrayWithObjects:&v7 count:1];

  -[MTIDCache removeNamespaces:](self, "removeNamespaces:", v6, v7, v8);
}

- (void)removeNamespaces:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  objc_super v6 = [MEMORY[0x263EFF9C0] setWithArray:v4];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  id v7 = &v18;
  char v18 = 0;
  do
  {
    char *v7 = 1;
    uint64_t v8 = [(MTIDCache *)v5 cache];
    BOOL v9 = (void *)[v8 copy];

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __30__MTIDCache_removeNamespaces___block_invoke;
    v11[3] = &unk_264310140;
    id v10 = v6;
    id v12 = v10;
    double v13 = v5;
    id v14 = &v15;
    [v9 enumerateKeysAndObjectsUsingBlock:v11];

    id v7 = (char *)(v16 + 3);
  }
  while (!*((unsigned char *)v16 + 24));
  _Block_object_dispose(&v15, 8);

  objc_sync_exit(v5);
}

void __30__MTIDCache_removeNamespaces___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v6 scheme];
  BOOL v9 = [v8 idNamespace];
  LODWORD(v7) = [v7 containsObject:v9];

  if (v7)
  {
    id v10 = [*(id *)(a1 + 40) cache];
    [v10 setObject:0 forKeyedSubscript:v5];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = objc_msgSend(v6, "scheme", 0);
  id v12 = [v11 correlations];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        if ([*(id *)(a1 + 32) containsObject:*(void *)(*((void *)&v23 + 1) + 8 * i)])
        {
          uint64_t v17 = *(void **)(a1 + 32);
          char v18 = [v6 scheme];
          id v19 = [v18 idNamespace];
          LOBYTE(v17) = [v17 containsObject:v19];

          if ((v17 & 1) == 0)
          {
            char v20 = *(void **)(a1 + 32);
            id v21 = [v6 scheme];
            v22 = [v21 idNamespace];
            [v20 addObject:v22];

            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
            goto LABEL_14;
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void)removeAllNamespaces
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(MTIDCache *)obj cache];
  [v2 removeAllObjects];

  objc_sync_exit(obj);
}

- (void)removeUnsyncedNamespaces
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MTIDCache *)v2 cache];
  id v4 = [v3 allKeys];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        id v10 = [(MTIDCache *)v2 cache];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];

        if (([v11 isSynchronized] & 1) == 0)
        {
          id v12 = [(MTIDCache *)v2 cache];
          [v12 setObject:0 forKeyedSubscript:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v2);
}

- (void)setCache:(id)a3
{
}

- (void)setPromiseCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promiseCache, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

@end