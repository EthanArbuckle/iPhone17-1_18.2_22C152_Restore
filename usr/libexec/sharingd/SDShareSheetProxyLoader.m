@interface SDShareSheetProxyLoader
- (BOOL)isCancelled;
- (BOOL)isLoading;
- (NSArray)allProxies;
- (NSMutableArray)remainingProxies;
- (SDShareSheetProxyLoader)initWithProxySection:(id)a3;
- (SDShareSheetProxyLoaderDelegate)delegate;
- (SDShareSheetProxySection)proxySection;
- (double)loadTimeLimit;
- (id)description;
- (unint64_t)remainingProxiesCount;
- (void)_loadProxies:(id)a3 withTimeLimit:(BOOL)a4;
- (void)cancel;
- (void)loadBatchWithSize:(unint64_t)a3;
- (void)loadRemainingProxies;
- (void)setDelegate:(id)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setLoadTimeLimit:(double)a3;
@end

@implementation SDShareSheetProxyLoader

- (SDShareSheetProxyLoader)initWithProxySection:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SDShareSheetProxyLoader;
  v6 = [(SDShareSheetProxyLoader *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_proxySection, a3);
    v8 = [v5 proxies];
    v9 = (NSArray *)[v8 copy];
    allProxies = v7->_allProxies;
    v7->_allProxies = v9;

    v11 = (NSMutableArray *)[(NSArray *)v7->_allProxies mutableCopy];
    remainingProxies = v7->_remainingProxies;
    v7->_remainingProxies = v11;

    v7->_loadTimeLimit = 0.25;
    atomic_store(0, (unsigned __int8 *)&v7->_isCancelled);
  }

  return v7;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SDShareSheetProxyLoader;
  v3 = [(SDShareSheetProxyLoader *)&v7 description];
  v4 = [(SDShareSheetProxyLoader *)self proxySection];
  id v5 = +[NSString stringWithFormat:@"%@ proxySection:%@", v3, v4];

  return v5;
}

- (unint64_t)remainingProxiesCount
{
  v2 = [(SDShareSheetProxyLoader *)self remainingProxies];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (BOOL)isCancelled
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isCancelled);
  return v2 & 1;
}

- (void)cancel
{
}

- (void)loadRemainingProxies
{
  if (![(SDShareSheetProxyLoader *)self isLoading])
  {
    id v3 = share_sheet_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      objc_super v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "load remaining proxies for loader:%@", (uint8_t *)&v6, 0xCu);
    }

    v4 = [(SDShareSheetProxyLoader *)self remainingProxies];
    id v5 = [v4 copy];
    [(SDShareSheetProxyLoader *)self _loadProxies:v5 withTimeLimit:1];
  }
}

- (void)loadBatchWithSize:(unint64_t)a3
{
  unsigned __int8 v6 = [(SDShareSheetProxyLoader *)self isLoading];
  if (a3 && (v6 & 1) == 0)
  {
    unint64_t v7 = [(SDShareSheetProxyLoader *)self remainingProxiesCount];
    if (v7 < a3) {
      a3 = v7;
    }
    if (!a3)
    {
      v12 = +[NSAssertionHandler currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"SDShareSheetProxyLoader.m" lineNumber:103 description:@"There are no remaining proxies to load."];
    }
    v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218242;
      unint64_t v14 = a3;
      __int16 v15 = 2112;
      v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "load proxy batch of size:%lu loader:%@", (uint8_t *)&v13, 0x16u);
    }

    v9 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, a3);
    v10 = [(SDShareSheetProxyLoader *)self remainingProxies];
    v11 = [v10 objectsAtIndexes:v9];

    [(SDShareSheetProxyLoader *)self _loadProxies:v11 withTimeLimit:0];
  }
}

- (void)_loadProxies:(id)a3 withTimeLimit:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(SDShareSheetProxyLoader *)self setIsLoading:1];
  v44 = +[NSMutableArray array];
  v43 = +[NSMutableIndexSet indexSet];
  v42 = +[NSMutableIndexSet indexSet];
  +[NSDate timeIntervalSinceReferenceDate];
  double v8 = v7;
  v9 = share_sheet_log();
  v10 = share_sheet_log();
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "LoadingProxies", "", buf, 2u);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v6;
  id v12 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v46;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v46 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(SDShareSheetProxyLoader **)(*((void *)&v45 + 1) + 8 * i);
        unsigned int v17 = [(SDShareSheetProxyLoader *)self isCancelled];
        if (v17)
        {
          v29 = share_sheet_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v50 = self;
            v30 = "loading was cancelled for loader:%@";
            goto LABEL_24;
          }
LABEL_25:
          unsigned __int8 v28 = v17 ^ 1;

          goto LABEL_26;
        }
        unsigned int v18 = [(SDShareSheetProxyLoader *)v16 load];
        [v44 addObject:v16];
        v19 = [(SDShareSheetProxyLoader *)self allProxies];
        id v20 = [v19 indexOfObject:v16];

        v21 = share_sheet_log();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
        if (v18)
        {
          v23 = v43;
          if (v22)
          {
            *(_DWORD *)buf = 138412290;
            v50 = v16;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "load proxy succeeded:%@", buf, 0xCu);
            v23 = v43;
          }
        }
        else
        {
          v23 = v42;
          if (v22)
          {
            *(_DWORD *)buf = 138412290;
            v50 = v16;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "load proxy failed:%@", buf, 0xCu);
            v23 = v42;
          }
        }

        [v23 addIndex:v20];
        if (v4)
        {
          [(SDShareSheetProxyLoader *)self loadTimeLimit];
          if (v24 > 0.0)
          {
            +[NSDate timeIntervalSinceReferenceDate];
            double v26 = v25 - v8;
            [(SDShareSheetProxyLoader *)self loadTimeLimit];
            if (v26 > v27 || v26 < 0.0)
            {
              v29 = share_sheet_log();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v50 = self;
                v30 = "loading time interval reached. Stop loading:%@";
LABEL_24:
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
              }
              goto LABEL_25;
            }
          }
        }
      }
      id v13 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  unsigned int v17 = 0;
  unsigned __int8 v28 = 0;
LABEL_26:

  +[CATransaction flush];
  v31 = share_sheet_log();
  v32 = share_sheet_log();
  os_signpost_id_t v33 = os_signpost_id_make_with_pointer(v32, self);

  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, v33, "LoadingProxies", "", buf, 2u);
  }

  v34 = [(SDShareSheetProxyLoader *)self remainingProxies];
  [v34 removeObjectsInArray:v44];

  [(SDShareSheetProxyLoader *)self setIsLoading:0];
  id v35 = [obj count];
  if (v35 == [v44 count])
  {
    uint64_t v36 = 0;
  }
  else
  {
    if (v17) {
      uint64_t v36 = 1;
    }
    else {
      uint64_t v36 = 2;
    }
    if (((v17 | v28) & 1) == 0)
    {
      v39 = +[NSAssertionHandler currentHandler];
      [v39 handleFailureInMethod:a2 object:self file:@"SDShareSheetProxyLoader.m" lineNumber:164 description:@"Unexpected timed out state."];

      uint64_t v36 = 2;
    }
  }
  v37 = objc_alloc_init(SDShareSheetProxyLoaderResult);
  [(SDShareSheetProxyLoaderResult *)v37 setState:v36];
  [(SDShareSheetProxyLoaderResult *)v37 setLoadedIndexes:v43];
  [(SDShareSheetProxyLoaderResult *)v37 setFailedIndexes:v42];
  v38 = [(SDShareSheetProxyLoader *)self delegate];
  [v38 proxyLoader:self didLoadProxiesWithResult:v37];
}

- (SDShareSheetProxySection)proxySection
{
  return self->_proxySection;
}

- (SDShareSheetProxyLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDShareSheetProxyLoaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)loadTimeLimit
{
  return self->_loadTimeLimit;
}

- (void)setLoadTimeLimit:(double)a3
{
  self->_loadTimeLimit = a3;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (NSArray)allProxies
{
  return self->_allProxies;
}

- (NSMutableArray)remainingProxies
{
  return self->_remainingProxies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingProxies, 0);
  objc_storeStrong((id *)&self->_allProxies, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_proxySection, 0);
}

@end