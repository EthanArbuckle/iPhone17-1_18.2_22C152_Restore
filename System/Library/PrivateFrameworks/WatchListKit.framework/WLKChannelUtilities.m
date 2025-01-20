@interface WLKChannelUtilities
+ (BOOL)isItunesBundleID:(id)a3;
+ (id)_validiTunesBundles;
+ (id)sharedInstance;
+ (id)sharedInstanceFiltered;
- (BOOL)isItunesOrFirstPartyBundleID:(id)a3;
- (BOOL)loaded;
- (NSArray)orderedChannels;
- (NSDictionary)channelsByBundleID;
- (NSDictionary)channelsByID;
- (NSError)error;
- (WLKChannelUtilities)init;
- (id)_configuration;
- (id)channelForBundleID:(id)a3;
- (id)channelForID:(id)a3;
- (id)channelIDForBundleID:(id)a3;
- (id)initFiltered:(BOOL)a3;
- (void)_loadConfigIfNeededWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidateCache;
- (void)loadIfNeededWithCompletion:(id)a3;
- (void)updateConsentStatusForCachedEntry:(id)a3 consented:(BOOL)a4;
@end

@implementation WLKChannelUtilities

+ (BOOL)isItunesBundleID:(id)a3
{
  id v4 = a3;
  v5 = [a1 _validiTunesBundles];
  char v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)_validiTunesBundles
{
  if (_validiTunesBundles_onceToken != -1) {
    dispatch_once(&_validiTunesBundles_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)_validiTunesBundles___validItunesIDs;

  return v2;
}

+ (id)sharedInstanceFiltered
{
  if (sharedInstanceFiltered_onceToken != -1) {
    dispatch_once(&sharedInstanceFiltered_onceToken, &__block_literal_global_41);
  }
  v2 = (void *)sharedInstanceFiltered_sharedInstanceFiltered;

  return v2;
}

uint64_t __45__WLKChannelUtilities_sharedInstanceFiltered__block_invoke()
{
  sharedInstanceFiltered_sharedInstanceFiltered = [[WLKChannelUtilities alloc] initFiltered:1];

  return MEMORY[0x1F41817F8]();
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_4_0);
  }
  v2 = (void *)sharedInstance_sharedInstance_2;

  return v2;
}

uint64_t __37__WLKChannelUtilities_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_2 = [[WLKChannelUtilities alloc] initFiltered:0];

  return MEMORY[0x1F41817F8]();
}

- (id)initFiltered:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WLKChannelUtilities;
  id v4 = [(WLKChannelUtilities *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_filtered = a3;
    *(_WORD *)&v4->_shouldRefresh = 0;
    inFlightcompletionList = v4->_inFlightcompletionList;
    v4->_inFlightcompletionList = 0;

    v5->_lock._os_unfair_lock_opaque = 0;
    error = v5->_error;
    v5->_error = 0;

    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __36__WLKChannelUtilities_initFiltered___block_invoke;
    handler[3] = &unk_1E620AE50;
    v10 = v5;
    notify_register_dispatch("com.apple.WatchListKit._WLKChannelUtilitesDataShouldRefreshInternal", &v5->_shouldRefreshNotificationToken, MEMORY[0x1E4F14428], handler);
  }
  return v5;
}

void __36__WLKChannelUtilities_initFiltered___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  pid_t v2 = getpid();
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 32), &state64);
  if (state64 != v2)
  {
    v3 = WLKSystemLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v6 = v2;
      __int16 v7 = 2048;
      uint64_t v8 = state64;
      _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKChannelUtilities - Set refresh=YES for next request in process=%llu., Triggered from process=%llu", buf, 0x16u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
    *(unsigned char *)(*(void *)(a1 + 32) + 36) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  }
}

- (WLKChannelUtilities)init
{
  return 0;
}

- (void)loadIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[WLKChannelUtilities loadIfNeededWithCompletion:]();
  }
  id v5 = v4;
  [(WLKChannelUtilities *)self _loadConfigIfNeededWithCompletion:v4];
}

- (void)dealloc
{
  int shouldRefreshNotificationToken = self->_shouldRefreshNotificationToken;
  if (shouldRefreshNotificationToken) {
    notify_cancel(shouldRefreshNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)WLKChannelUtilities;
  [(WLKChannelUtilities *)&v4 dealloc];
}

- (BOOL)loaded
{
  pid_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(WLKChannelsResponse *)v2->_cachedResponse isValidForFiltered:v2->_filtered];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSDictionary)channelsByID
{
  pid_t v2 = [(WLKChannelUtilities *)self _configuration];
  v3 = [v2 channels];

  return (NSDictionary *)v3;
}

- (id)channelForID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(WLKChannelUtilities *)self _configuration];
    uint64_t v6 = [v5 channels];
    __int16 v7 = [v6 objectForKeyedSubscript:v4];
  }
  else
  {
    __int16 v7 = 0;
  }

  return v7;
}

- (id)channelForBundleID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(id)objc_opt_class() _validiTunesBundles];
    int v6 = [v5 containsObject:v4];

    if (v6)
    {
      id v7 = [(WLKChannelUtilities *)self channelForID:@"tvs.sbd.9001"];
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v8 = [(WLKChannelUtilities *)self _configuration];
      uint64_t v9 = [v8 orderedChannels];

      id v7 = (id)[v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        uint64_t v10 = *(void *)v17;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v9);
            }
            v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            v13 = [v12 appBundleIDs];
            int v14 = [v13 containsObject:v4];

            if (v14)
            {
              id v7 = v12;
              goto LABEL_15;
            }
          }
          id v7 = (id)[v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)channelIDForBundleID:(id)a3
{
  v3 = [(WLKChannelUtilities *)self channelForBundleID:a3];
  id v4 = [v3 channelID];

  return v4;
}

- (NSArray)orderedChannels
{
  pid_t v2 = [(WLKChannelUtilities *)self _configuration];
  v3 = [v2 orderedChannels];

  return (NSArray *)v3;
}

void __42__WLKChannelUtilities__validiTunesBundles__block_invoke()
{
  v0 = (void *)_validiTunesBundles___validItunesIDs;
  _validiTunesBundles___validItunesIDs = (uint64_t)&unk_1F13D9B28;
}

- (BOOL)isItunesOrFirstPartyBundleID:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() isItunesBundleID:v4])
  {
    char v5 = 1;
  }
  else
  {
    int v6 = [(WLKChannelUtilities *)self channelForBundleID:v4];
    char v5 = [v6 isFirstParty];
  }
  return v5;
}

- (id)_configuration
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__WLKChannelUtilities__configuration__block_invoke;
  v9[3] = &unk_1E620BAA8;
  dispatch_semaphore_t v10 = v3;
  id v4 = v3;
  [(WLKChannelUtilities *)self _loadConfigIfNeededWithCompletion:v9];
  dispatch_time_t v5 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v4, v5);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = self->_cachedResponse;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

intptr_t __37__WLKChannelUtilities__configuration__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_loadConfigIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[WLKChannelUtilities _loadConfigIfNeededWithCompletion:]();
  }
  dispatch_time_t v5 = (void (**)(void, void, void))v4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_shouldRefresh
    || ![(WLKChannelsResponse *)self->_cachedResponse isValidForFiltered:self->_filtered])
  {
    BOOL isChannelsInProgress = self->_isChannelsInProgress;
    uint64_t v8 = WLKSystemLogObject();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (isChannelsInProgress)
    {
      if (v9)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKChannelUtilities - WLKChannelsRequestOperation in progress. Adding completion to pending list.", (uint8_t *)buf, 2u);
      }

      inFlightcompletionList = self->_inFlightcompletionList;
      objc_super v11 = (void *)MEMORY[0x1BA9E94D0](v5);
      [(NSMutableArray *)inFlightcompletionList addObject:v11];

      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      if (v9)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1BA2E8000, v8, OS_LOG_TYPE_DEFAULT, "WLKChannelUtilities - WLKChannelsRequestOperation starting.", (uint8_t *)buf, 2u);
      }

      *(_WORD *)&self->_shouldRefresh = 256;
      v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v13 = self->_inFlightcompletionList;
      self->_inFlightcompletionList = v12;

      int v14 = self->_inFlightcompletionList;
      v15 = (void *)MEMORY[0x1BA9E94D0](v5);
      [(NSMutableArray *)v14 addObject:v15];

      long long v16 = [[WLKChannelsRequestOperation alloc] initWithCaller:0 isFilteredByUserChannels:self->_filtered];
      os_unfair_lock_unlock(&self->_lock);
      id v17 = objc_alloc_init(MEMORY[0x1E4F28F08]);
      objc_initWeak(buf, self);
      objc_initWeak(&location, v16);
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __57__WLKChannelUtilities__loadConfigIfNeededWithCompletion___block_invoke;
      uint64_t v21 = &unk_1E620BAD0;
      objc_copyWeak(&v23, buf);
      objc_copyWeak(&v24, &location);
      v22 = self;
      [(WLKChannelsRequestOperation *)v16 setCompletionBlock:&v18];
      objc_msgSend(v17, "addOperation:", v16, v18, v19, v20, v21);
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
      objc_destroyWeak(buf);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v5[2](v5, 1, 0);
  }
}

void __57__WLKChannelUtilities__loadConfigIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = v3;
  if (WeakRetained && v3)
  {
    dispatch_time_t v5 = WLKSystemLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2E8000, v5, OS_LOG_TYPE_DEFAULT, "WLKChannelUtilities - WLKChannelsRequestOperation completed. Processing response.", buf, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
    uint64_t v6 = [v4 channelsResponse];
    id v7 = (void *)*((void *)WeakRetained + 3);
    *((void *)WeakRetained + 3) = v6;

    uint64_t v8 = [v4 error];
    BOOL v9 = (void *)*((void *)WeakRetained + 7);
    *((void *)WeakRetained + 7) = v8;

    *((unsigned char *)WeakRetained + 37) = 0;
    dispatch_semaphore_t v10 = (void *)[*((id *)WeakRetained + 6) copy];
    objc_super v11 = (void *)*((void *)WeakRetained + 6);
    *((void *)WeakRetained + 6) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
    v12 = WLKSystemLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_1BA2E8000, v12, OS_LOG_TYPE_DEFAULT, "WLKChannelUtilities - Calling pending completion list with result.", v17, 2u);
    }

    if ([v10 count])
    {
      unint64_t v13 = 0;
      do
      {
        int v14 = [v10 objectAtIndexedSubscript:v13];
        v15 = [v4 channelsResponse];
        long long v16 = [v4 error];
        ((void (**)(void, BOOL, void *))v14)[2](v14, v15 != 0, v16);

        ++v13;
      }
      while (v13 < [v10 count]);
    }
  }
}

- (void)updateConsentStatusForCachedEntry:(id)a3 consented:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  cachedResponse = self->_cachedResponse;
  if (cachedResponse) {
    [(WLKChannelsResponse *)cachedResponse modifyConsentStatusForChannelEntry:v7 consented:v4];
  }
  [(WLKChannelUtilities *)self invalidateCache];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)invalidateCache
{
  id v3 = WLKSystemLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKChannelUtilities - Posting channel data should refresh for cross processes note", v6, 2u);
  }

  int shouldRefreshNotificationToken = self->_shouldRefreshNotificationToken;
  pid_t v5 = getpid();
  notify_set_state(shouldRefreshNotificationToken, v5);
  notify_post("com.apple.WatchListKit._WLKChannelUtilitesDataShouldRefreshInternal");
}

- (NSError)error
{
  return self->_error;
}

- (NSDictionary)channelsByBundleID
{
  return self->_channelsByBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelsByBundleID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_inFlightcompletionList, 0);
  objc_storeStrong((id *)&self->_cachedResponse, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (void)loadIfNeededWithCompletion:.cold.1()
{
  __assert_rtn("-[WLKChannelUtilities loadIfNeededWithCompletion:]", "WLKChannelUtilities.m", 96, "completion != nil");
}

- (void)_loadConfigIfNeededWithCompletion:.cold.1()
{
  __assert_rtn("-[WLKChannelUtilities _loadConfigIfNeededWithCompletion:]", "WLKChannelUtilities.m", 224, "completion != nil");
}

@end