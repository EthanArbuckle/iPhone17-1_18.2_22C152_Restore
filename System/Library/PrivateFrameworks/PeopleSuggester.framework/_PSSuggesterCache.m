@interface _PSSuggesterCache
+ (id)defaultService;
+ (id)defaultServiceWithMaxSuggestionCount:(id)a3;
- (_PSSuggesterCache)initWithMaxSuggestionCount:(id)a3;
- (id)description;
- (id)getCachedContext;
- (id)getCachedSuggestions;
- (id)getCachedSuggestionsAndSessionID:(id *)a3;
- (void)_refetch;
- (void)backgroundRefetch;
- (void)performInitialFetchIfNeeded;
- (void)refetch;
@end

@implementation _PSSuggesterCache

- (_PSSuggesterCache)initWithMaxSuggestionCount:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_PSSuggesterCache;
  id v5 = [(_PSSuggesterCache *)&v29 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple._PSSuggesterCache.queue", v6);
    v8 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v7;

    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 1uLL, *((dispatch_queue_t *)v5 + 1));
    v10 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v9;

    *((_DWORD *)v5 + 14) = 0;
    *((void *)v5 + 8) = 0;
    *((void *)v5 + 9) = 0;
    v11 = +[_PSSuggesterConfiguration defaultConfiguration];
    objc_msgSend(v11, "setMaximumNumberOfSuggestions:", objc_msgSend(v4, "integerValue"));
    v12 = [[_PSSuggester alloc] initWithDaemonUsingConfiguration:v11];
    v13 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v12;

    v14 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v14 addObserver:v5 selector:sel_backgroundRefetch name:@"_CDInteractionStoreRecordedShareSheetInteractionNotification" object:0];

    v15 = +[_PSConfig defaultConfig];
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v18 = [v15 objectForKeyedSubscript:v17];
    v19 = [v18 objectForKeyedSubscript:@"cacheUpdateInterval"];
    [v19 doubleValue];
    double v21 = v20 * 1000000000.0;

    v22 = *((void *)v5 + 2);
    dispatch_time_t v23 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v22, v23, (unint64_t)v21, 0xDF8475800uLL);
    objc_initWeak(&location, v5);
    v24 = *((void *)v5 + 2);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __48___PSSuggesterCache_initWithMaxSuggestionCount___block_invoke;
    v26[3] = &unk_1E5ADFE98;
    objc_copyWeak(&v27, &location);
    dispatch_source_set_event_handler(v24, v26);
    dispatch_resume(*((dispatch_object_t *)v5 + 2));
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  return (_PSSuggesterCache *)v5;
}

+ (id)defaultService
{
  return +[_PSSuggesterCache defaultServiceWithMaxSuggestionCount:&unk_1EF675480];
}

+ (id)defaultServiceWithMaxSuggestionCount:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58___PSSuggesterCache_defaultServiceWithMaxSuggestionCount___block_invoke;
  block[3] = &unk_1E5ADE940;
  id v9 = v3;
  uint64_t v4 = defaultServiceWithMaxSuggestionCount___pasOnceToken8;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&defaultServiceWithMaxSuggestionCount___pasOnceToken8, block);
  }
  id v6 = (id)defaultServiceWithMaxSuggestionCount___pasExprOnceResult;

  return v6;
}

- (void)backgroundRefetch
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38___PSSuggesterCache_backgroundRefetch__block_invoke;
  block[3] = &unk_1E5ADE940;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)performInitialFetchIfNeeded
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_cachedPeopleSuggestions) {
    [(_PSSuggesterCache *)self _refetch];
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)refetch
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(_PSSuggesterCache *)self _refetch];

  os_unfair_lock_unlock(p_lock);
}

- (void)_refetch
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  int v3 = [MEMORY[0x1E4F93B10] isClassCLocked];
  uint64_t v4 = +[_PSLogging generalChannel];
  BOOL v5 = os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A314B000, &v4->super, OS_LOG_TYPE_DEFAULT, "_PSSuggesterCache: Not refetching suggestions due to Class C lock.", (uint8_t *)&v17, 2u);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A314B000, &v4->super, OS_LOG_TYPE_DEFAULT, "_PSSuggesterCache: Refetching suggestions", (uint8_t *)&v17, 2u);
    }

    uint64_t v4 = objc_alloc_init(_PSPredictionContext);
    [(_PSPredictionContext *)v4 setIsFallbackFetch:1];
    id v6 = [MEMORY[0x1E4F29128] UUID];
    dispatch_queue_t v7 = [v6 UUIDString];
    [(_PSPredictionContext *)v4 setSessionID:v7];

    v8 = [(_PSSuggester *)self->_suggester suggestInteractionsFromContext:v4];
    objc_storeStrong((id *)&self->_cachedContext, v4);
    id v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(_PSPredictionContext *)v4 sessionID];
      int v17 = 138412547;
      v18 = v10;
      __int16 v19 = 2113;
      double v20 = v8;
      _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_DEFAULT, "_PSSuggesterCache: fetched suggestions with sessionID %@: %{private}@", (uint8_t *)&v17, 0x16u);
    }
    objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_21);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    cachedPeopleSuggestions = self->_cachedPeopleSuggestions;
    self->_cachedPeopleSuggestions = v11;

    v13 = [(_PSPredictionContext *)v4 sessionID];
    cachedSessionID = self->_cachedSessionID;
    self->_cachedSessionID = v13;

    ++self->_fetches;
    v15 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_cachedPeopleSuggestions;
      int v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_1A314B000, v15, OS_LOG_TYPE_DEFAULT, "_PSSuggesterCache: updated _cachedPeopleSuggestions: %@", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (id)getCachedSuggestions
{
  return [(_PSSuggesterCache *)self getCachedSuggestionsAndSessionID:0];
}

- (id)getCachedSuggestionsAndSessionID:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = self->_cachedPeopleSuggestions;
  if (a3) {
    objc_storeStrong(a3, self->_cachedSessionID);
  }
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)getCachedContext
{
  return self->_cachedContext;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"cachedSuggestions: %@, cachedSessionID: %@, cachedContext: %@", self->_cachedPeopleSuggestions, self->_cachedSessionID, self->_cachedContext];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPeopleSuggestions, 0);
  objc_storeStrong((id *)&self->_cachedContext, 0);
  objc_storeStrong((id *)&self->_cachedSessionID, 0);
  objc_storeStrong((id *)&self->_suggester, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end