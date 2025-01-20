@interface WLKRestrictionsObserver
+ (id)sharedObserver;
- (NSNumber)TVRanking;
- (NSNumber)movieRanking;
- (WLKDebouncingQueue)debounceQueue;
- (WLKRestrictionsObserver)init;
- (void)_evaluateRestrictionsChange;
- (void)dealloc;
- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setDebounceQueue:(id)a3;
- (void)setMovieRanking:(id)a3;
- (void)setTVRanking:(id)a3;
@end

@implementation WLKRestrictionsObserver

+ (id)sharedObserver
{
  if (sharedObserver_onceToken != -1) {
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)sharedObserver__observer;

  return v2;
}

uint64_t __41__WLKRestrictionsObserver_sharedObserver__block_invoke()
{
  sharedObserver__observer = objc_alloc_init(WLKRestrictionsObserver);

  return MEMORY[0x1F41817F8]();
}

- (WLKRestrictionsObserver)init
{
  v11.receiver = self;
  v11.super_class = (Class)WLKRestrictionsObserver;
  v2 = [(WLKRestrictionsObserver *)&v11 init];
  if (v2)
  {
    uint64_t v3 = WLKRestrictionsMaximumEffectiveTVShowRanking();
    TVRanking = v2->_TVRanking;
    v2->_TVRanking = (NSNumber *)v3;

    uint64_t v5 = WLKRestrictionsMaximumEffectiveMovieRanking();
    movieRanking = v2->_movieRanking;
    v2->_movieRanking = (NSNumber *)v5;

    v7 = objc_alloc_init(WLKDebouncingQueue);
    debounceQueue = v2->_debounceQueue;
    v2->_debounceQueue = v7;

    [(WLKDebouncingQueue *)v2->_debounceQueue setDelay:500000];
    v9 = [MEMORY[0x1E4F74230] sharedConnection];
    [v9 registerObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WLKRestrictionsObserver;
  [(WLKRestrictionsObserver *)&v4 dealloc];
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  debounceQueue = self->_debounceQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __94__WLKRestrictionsObserver_profileConnectionDidReceiveRestrictionChangedNotification_userInfo___block_invoke;
  v9[3] = &unk_1E620A550;
  objc_copyWeak(&v10, &location);
  [(WLKDebouncingQueue *)debounceQueue addOperationWithBlock:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __94__WLKRestrictionsObserver_profileConnectionDidReceiveRestrictionChangedNotification_userInfo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _evaluateRestrictionsChange];
}

- (void)_evaluateRestrictionsChange
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = WLKRestrictionsMaximumEffectiveTVShowRanking();
  objc_super v4 = WLKRestrictionsMaximumEffectiveMovieRanking();
  uint64_t v5 = WLKSystemLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    TVRanking = self->_TVRanking;
    movieRanking = self->_movieRanking;
    int v20 = 138412546;
    v21 = TVRanking;
    __int16 v22 = 2112;
    v23 = movieRanking;
    _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKRestrictionsObserver - current: %@-%@", (uint8_t *)&v20, 0x16u);
  }

  v8 = self->_TVRanking;
  v9 = v3;
  id v10 = v8;
  if (v9 == v10)
  {
  }
  else
  {
    objc_super v11 = v10;
    if (!v9 || !v10)
    {
      v14 = v9;
LABEL_15:

LABEL_16:
      objc_storeStrong((id *)&self->_TVRanking, v3);
      objc_storeStrong((id *)&self->_movieRanking, v4);
      v17 = WLKSystemLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->_TVRanking;
        v19 = self->_movieRanking;
        int v20 = 138412546;
        v21 = v18;
        __int16 v22 = 2112;
        v23 = v19;
        _os_log_impl(&dword_1BA2E8000, v17, OS_LOG_TYPE_DEFAULT, "WLKRestrictionsObserver - new: %@-%@; posting notification",
          (uint8_t *)&v20,
          0x16u);
      }

      v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [(NSNumber *)v14 postNotificationName:@"WLKRestrictionsDidChangeNotification" object:self userInfo:0];
      goto LABEL_20;
    }
    int v12 = [(NSNumber *)v9 isEqual:v10];

    if (!v12) {
      goto LABEL_16;
    }
  }
  v13 = self->_movieRanking;
  v14 = v4;
  v15 = v13;
  if (v14 != v15)
  {
    objc_super v11 = v15;
    if (v14 && v15)
    {
      char v16 = [(NSNumber *)v14 isEqual:v15];

      if (v16) {
        goto LABEL_21;
      }
      goto LABEL_16;
    }
    goto LABEL_15;
  }

LABEL_20:
LABEL_21:
}

- (NSNumber)TVRanking
{
  return self->_TVRanking;
}

- (void)setTVRanking:(id)a3
{
}

- (NSNumber)movieRanking
{
  return self->_movieRanking;
}

- (void)setMovieRanking:(id)a3
{
}

- (WLKDebouncingQueue)debounceQueue
{
  return self->_debounceQueue;
}

- (void)setDebounceQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debounceQueue, 0);
  objc_storeStrong((id *)&self->_movieRanking, 0);

  objc_storeStrong((id *)&self->_TVRanking, 0);
}

@end