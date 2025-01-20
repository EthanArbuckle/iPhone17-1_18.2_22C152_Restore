@interface TUCallHistoryController
+ (TUCallHistoryController)callHistoryControllerWithCoalescingStrategy:(unint64_t)a3 options:(unint64_t)a4;
+ (TUCallHistoryController)callHistoryControllerWithCoalescingStrategy:(unint64_t)a3 options:(unint64_t)a4 shouldUpdateMetadataCache:(BOOL)a5;
+ (TUCallHistoryController)sharedController;
+ (id)sharedControllerWithCoalescingStrategy:(unint64_t)a3 options:(unint64_t)a4;
- (BOOL)canLoadOlderRecentCalls;
- (BOOL)shouldUpdateMetadataCache;
- (CHManager)callHistoryManager;
- (NSArray)recentCalls;
- (NSArray)thirdPartyCallProviders;
- (NSMutableSet)metadataPreCachedOptions;
- (NSOperationQueue)searchQueue;
- (NSPredicate)preFetchingPredicate;
- (TUCallHistoryController)init;
- (TUCallHistoryController)initWithCoalescingStrategy:(unint64_t)a3 options:(unint64_t)a4 dataSource:(id)a5 shouldUpdateMetadataCache:(BOOL)a6;
- (TUCallHistoryControllerDataSource)dataSource;
- (TUCallProviderManager)callProviderManager;
- (TUDispatcher)dispatcher;
- (TUDispatcher)simpleIvarDispatcher;
- (TUFeatureFlags)featureFlags;
- (id)_callHistoryCoalescingStrategyForCoalescingStrategy:(unint64_t)a3;
- (id)callHistoryManagerInitializationDispatchBlock;
- (id)callHistoryManagerLoadOlderRecentCallsDispatchBlock;
- (id)callHistoryManagerRecentCallsDispatchBlock;
- (id)recentCallsWithPredicate:(id)a3;
- (int64_t)callHistoryControllerCallHistoryFetchLimit;
- (unint64_t)coalescingStrategy;
- (unint64_t)options;
- (unint64_t)unreadCallCount;
- (void)_updateCallHistoryManagerUsingCurrentOptions;
- (void)boostQualityOfService;
- (void)callHistoryDatabaseChanged:(id)a3;
- (void)cancelSearchFetchOperations;
- (void)dealloc;
- (void)deleteAllRecentCalls;
- (void)deleteRecentCall:(id)a3;
- (void)deleteRecentCalls:(id)a3;
- (void)dispatcherDidFinishBoost:(id)a3;
- (void)loadDispatchQueue;
- (void)loadOlderRecentCalls;
- (void)markRecentAudioCallsAsRead;
- (void)markRecentCallsAsRead;
- (void)markRecentCallsAsReadWithPredicate:(id)a3;
- (void)markRecentVideoCallsAsRead;
- (void)providersChangedForProviderManager:(id)a3;
- (void)setCallHistoryManager:(id)a3;
- (void)setCallProviderManager:(id)a3;
- (void)setCoalescingStrategy:(unint64_t)a3;
- (void)setDispatcher:(id)a3;
- (void)setMetadataPreCachedOptions:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPreFetchingPredicate:(id)a3;
- (void)setRecentCalls:(id)a3;
- (void)setSearchQueue:(id)a3;
- (void)setSimpleIvarDispatcher:(id)a3;
- (void)setThirdPartyCallProviders:(id)a3;
- (void)setUnreadCallCount:(unint64_t)a3;
@end

@implementation TUCallHistoryController

void __38__TUCallHistoryController_recentCalls__block_invoke(uint64_t a1)
{
}

- (void)loadOlderRecentCalls
{
  id v4 = [(TUCallHistoryController *)self dispatcher];
  v3 = [(TUCallHistoryController *)self callHistoryManagerLoadOlderRecentCallsDispatchBlock];
  [v4 dispatchAsynchronousBlock:v3];
}

- (id)callHistoryManagerLoadOlderRecentCallsDispatchBlock
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__TUCallHistoryController_callHistoryManagerLoadOlderRecentCallsDispatchBlock__block_invoke;
  aBlock[3] = &unk_1E58E5BE0;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  v3 = _Block_copy(v2);

  return v3;
}

+ (id)sharedControllerWithCoalescingStrategy:(unint64_t)a3 options:(unint64_t)a4
{
  v5 = (void *)gSharedCallHistoryInstance;
  if (!gSharedCallHistoryInstance)
  {
    uint64_t v6 = [a1 callHistoryControllerWithCoalescingStrategy:a3 options:a4];
    v7 = (void *)gSharedCallHistoryInstance;
    gSharedCallHistoryInstance = v6;

    v5 = (void *)gSharedCallHistoryInstance;
  }

  return v5;
}

+ (TUCallHistoryController)callHistoryControllerWithCoalescingStrategy:(unint64_t)a3 options:(unint64_t)a4 shouldUpdateMetadataCache:(BOOL)a5
{
  BOOL v5 = a5;
  v9 = objc_alloc_init(TUCallHistoryControllerXPCClient);
  v10 = (void *)[objc_alloc((Class)a1) initWithCoalescingStrategy:a3 options:a4 dataSource:v9 shouldUpdateMetadataCache:v5];

  return (TUCallHistoryController *)v10;
}

+ (TUCallHistoryController)callHistoryControllerWithCoalescingStrategy:(unint64_t)a3 options:(unint64_t)a4
{
  return +[TUCallHistoryController callHistoryControllerWithCoalescingStrategy:a3 options:a4 shouldUpdateMetadataCache:1];
}

- (void)markRecentCallsAsRead
{
  id v3 = [getCHRecentCallClass() predicateForCallsWithStatusRead:0];
  [(TUCallHistoryController *)self markRecentCallsAsReadWithPredicate:v3];
}

- (void)markRecentCallsAsReadWithPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __62__TUCallHistoryController_markRecentCallsAsReadWithPredicate___block_invoke;
  v11 = &unk_1E58E5C08;
  v12 = self;
  id v13 = v4;
  id v5 = v4;
  uint64_t v6 = _Block_copy(&v8);
  v7 = [(TUCallHistoryController *)self dispatcher];
  [v7 dispatchAsynchronousBlock:v6];
}

void __62__TUCallHistoryController_markRecentCallsAsReadWithPredicate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callHistoryManager];
  [v2 setRead:1 forCallsWithPredicate:*(void *)(a1 + 40) completion:0];
}

void __62__TUCallHistoryController_providersChangedForProviderManager___block_invoke(uint64_t a1)
{
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 24) & 8) != 0)
  {
    id v5 = [*(id *)(a1 + 40) providersPassingTest:&__block_literal_global_82];
    id v2 = [*(id *)(a1 + 32) thirdPartyCallProviders];
    char v3 = [v2 isEqualToArray:v5];

    if ((v3 & 1) == 0)
    {
      [*(id *)(a1 + 32) setThirdPartyCallProviders:v5];
      [*(id *)(a1 + 32) _updateCallHistoryManagerUsingCurrentOptions];
      id v4 = [*(id *)(a1 + 32) callHistoryManagerRecentCallsDispatchBlock];
      v4[2]();
    }
  }
}

void __44__TUCallHistoryController_loadDispatchQueue__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) callProviderManager];
  id v2 = [v3 providersPassingTest:&__block_literal_global_9];
  [*(id *)(a1 + 32) setThirdPartyCallProviders:v2];
}

- (void)setThirdPartyCallProviders:(id)a3
{
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (void)_updateCallHistoryManagerUsingCurrentOptions
{
  v58[3] = *MEMORY[0x1E4F143B8];
  if (!_updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey)
  {
    id v3 = (void **)CUTWeakLinkSymbol();
    if (v3) {
      id v4 = *v3;
    }
    else {
      id v4 = 0;
    }
    objc_storeStrong((id *)&_updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey, v4);
  }
  if (!_updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey)
  {
    id v5 = (void **)CUTWeakLinkSymbol();
    if (v5) {
      uint64_t v6 = *v5;
    }
    else {
      uint64_t v6 = 0;
    }
    objc_storeStrong((id *)&_updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey, v6);
  }
  if (!_updateCallHistoryManagerUsingCurrentOptions__kCHLimitTTYTypeKey)
  {
    v7 = (void **)CUTWeakLinkSymbol();
    if (v7) {
      uint64_t v8 = *v7;
    }
    else {
      uint64_t v8 = 0;
    }
    objc_storeStrong((id *)&_updateCallHistoryManagerUsingCurrentOptions__kCHLimitTTYTypeKey, v8);
  }
  if (!_updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderTelephony)
  {
    uint64_t v9 = (void **)CUTWeakLinkSymbol();
    if (v9) {
      v10 = *v9;
    }
    else {
      v10 = 0;
    }
    objc_storeStrong((id *)&_updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderTelephony, v10);
  }
  if (!_updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderFaceTime)
  {
    v11 = (void **)CUTWeakLinkSymbol();
    if (v11) {
      v12 = *v11;
    }
    else {
      v12 = 0;
    }
    objc_storeStrong((id *)&_updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderFaceTime, v12);
  }
  if (_updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey
    && _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey)
  {
    id v13 = [MEMORY[0x1E4F1CA48] array];
    if ((self->_options & 4) != 0 && _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderTelephony)
    {
      if (_updateCallHistoryManagerUsingCurrentOptions__kCHLimitTTYTypeKey)
      {
        v57[0] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey;
        v57[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitTTYTypeKey;
        v58[0] = &unk_1EED240A8;
        v58[1] = &unk_1EED240C0;
        v57[2] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey;
        v58[2] = _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderTelephony;
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:3];
        [v13 addObject:v14];

        v55[0] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey;
        v55[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitTTYTypeKey;
        v56[0] = &unk_1EED240A8;
        v56[1] = &unk_1EED240A8;
        v55[2] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey;
        v56[2] = _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderTelephony;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:3];
        [v13 addObject:v15];

        v53[0] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey;
        v53[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitTTYTypeKey;
        v54[0] = &unk_1EED240A8;
        v54[1] = &unk_1EED240D8;
        v53[2] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey;
        v54[2] = _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderTelephony;
        v16 = (void *)MEMORY[0x1E4F1C9E8];
        v17 = v54;
        v18 = v53;
        uint64_t v19 = 3;
      }
      else
      {
        v51[0] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey;
        v51[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey;
        v52[0] = &unk_1EED240A8;
        v52[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderTelephony;
        v16 = (void *)MEMORY[0x1E4F1C9E8];
        v17 = v52;
        v18 = v51;
        uint64_t v19 = 2;
      }
      v20 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:v19];
      [v13 addObject:v20];
    }
    unint64_t options = self->_options;
    uint64_t v22 = _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderFaceTime;
    if ((options & 1) != 0 && _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderFaceTime)
    {
      v49[0] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey;
      v49[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey;
      v50[0] = &unk_1EED240A8;
      v50[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderFaceTime;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
      [v13 addObject:v23];

      unint64_t options = self->_options;
      uint64_t v22 = _updateCallHistoryManagerUsingCurrentOptions__kCHServiceProviderFaceTime;
    }
    if ((options & 2) != 0 && v22)
    {
      v47[0] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey;
      v47[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey;
      v48[0] = &unk_1EED240D8;
      v48[1] = v22;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];
      [v13 addObject:v24];

      unint64_t options = self->_options;
    }
    if ((options & 8) != 0)
    {
      v25 = [(TUCallHistoryController *)self thirdPartyCallProviders];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v39 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            int v31 = [v30 supportsAudioOnly];
            int v32 = [v30 supportsAudioAndVideo];
            uint64_t v33 = [v30 identifier];
            v34 = (void *)v33;
            if (v31)
            {
              v44[0] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey;
              v44[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey;
              v45[0] = v33;
              v45[1] = &unk_1EED240A8;
              v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
              [v13 addObject:v35];
            }
            if (v32)
            {
              v42[0] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitServiceProviderKey;
              v42[1] = _updateCallHistoryManagerUsingCurrentOptions__kCHLimitMediaTypeKey;
              v43[0] = v34;
              v43[1] = &unk_1EED240D8;
              v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
              [v13 addObject:v36];
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }
        while (v27);
      }
    }
    v37 = [(TUCallHistoryController *)self callHistoryManager];
    [v37 setLimitingCallKinds:v13];
  }
}

- (NSArray)thirdPartyCallProviders
{
  return self->_thirdPartyCallProviders;
}

void __78__TUCallHistoryController_callHistoryManagerLoadOlderRecentCallsDispatchBlock__block_invoke(uint64_t a1)
{
  BOOL v2 = +[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls];
  id v3 = TUDefaultLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Call History supports displaying FaceTime Audio calls", buf, 2u);
    }

    id v5 = [*(id *)(a1 + 32) callHistoryManager];
    uint64_t v6 = [v5 loadOlderRecentCalls];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Call History does not support displaying FaceTime Audio calls", buf, 2u);
    }

    uint64_t v7 = gSharedCallHistoryInstance_block_invoke_3__kCHServiceProviderFaceTime;
    if (!gSharedCallHistoryInstance_block_invoke_3__kCHServiceProviderFaceTime)
    {
      uint64_t v8 = (void **)CUTWeakLinkSymbol();
      if (v8) {
        uint64_t v9 = *v8;
      }
      else {
        uint64_t v9 = 0;
      }
      objc_storeStrong((id *)&gSharedCallHistoryInstance_block_invoke_3__kCHServiceProviderFaceTime, v9);
      uint64_t v7 = gSharedCallHistoryInstance_block_invoke_3__kCHServiceProviderFaceTime;
    }
    id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"!(mediaType == %@ && serviceProvider == %@)", &unk_1EED240A8, v7];
    v10 = [*(id *)(a1 + 32) callHistoryManager];
    uint64_t v6 = [v10 loadOlderRecentCallsWithPredicate:v5];
  }
  unint64_t v11 = [*(id *)(a1 + 32) callHistoryControllerCallHistoryFetchLimit];
  unint64_t v12 = [v6 count];
  if (v11 >= v12) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = v11;
  }
  v14 = objc_msgSend(v6, "subarrayWithRange:", 0, v13);
  [*(id *)(a1 + 32) setRecentCalls:v14];
  v15 = [*(id *)(a1 + 32) metadataPreCachedOptions];
  v16 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 24)];
  char v17 = [v15 containsObject:v16];

  if ((v17 & 1) == 0)
  {
    v18 = [*(id *)(a1 + 32) metadataPreCachedOptions];
    uint64_t v19 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 24)];
    [v18 addObject:v19];

    if ([*(id *)(a1 + 32) shouldUpdateMetadataCache])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__TUCallHistoryController_callHistoryManagerLoadOlderRecentCallsDispatchBlock__block_invoke_69;
      block[3] = &unk_1E58E5BE0;
      id v23 = v14;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  v20 = [getCHRecentCallClass() predicateForCallsWithStatusRead:0];
  v21 = [*(id *)(a1 + 32) callHistoryManager];
  objc_msgSend(*(id *)(a1 + 32), "setUnreadCallCount:", objc_msgSend(v21, "callCountWithPredicate:", v20));
}

void __69__TUCallHistoryController_callHistoryManagerRecentCallsDispatchBlock__block_invoke(uint64_t a1)
{
  BOOL v2 = +[TUCallCapabilities supportsDisplayingFaceTimeAudioCalls];
  id v3 = TUDefaultLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Call History supports displaying FaceTime Audio calls", buf, 2u);
    }

    id v5 = [*(id *)(a1 + 32) callHistoryManager];
    uint64_t v6 = [v5 recentCalls];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "Call History does not support displaying FaceTime Audio calls", buf, 2u);
    }

    uint64_t v7 = gSharedCallHistoryInstance_block_invoke_2__kCHServiceProviderFaceTime;
    if (!gSharedCallHistoryInstance_block_invoke_2__kCHServiceProviderFaceTime)
    {
      uint64_t v8 = (void **)CUTWeakLinkSymbol();
      if (v8) {
        uint64_t v9 = *v8;
      }
      else {
        uint64_t v9 = 0;
      }
      objc_storeStrong((id *)&gSharedCallHistoryInstance_block_invoke_2__kCHServiceProviderFaceTime, v9);
      uint64_t v7 = gSharedCallHistoryInstance_block_invoke_2__kCHServiceProviderFaceTime;
    }
    id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"!(mediaType == %@ && serviceProvider == %@)", &unk_1EED240A8, v7];
    v10 = [*(id *)(a1 + 32) callHistoryManager];
    uint64_t v6 = [v10 recentCallsWithPredicate:v5];
  }
  unint64_t v11 = [*(id *)(a1 + 32) callHistoryControllerCallHistoryFetchLimit];
  unint64_t v12 = [v6 count];
  if (v11 >= v12) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = v11;
  }
  v14 = objc_msgSend(v6, "subarrayWithRange:", 0, v13);
  [*(id *)(a1 + 32) setRecentCalls:v14];
  v15 = [*(id *)(a1 + 32) metadataPreCachedOptions];
  v16 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 24)];
  char v17 = [v15 containsObject:v16];

  if ((v17 & 1) == 0)
  {
    v18 = [*(id *)(a1 + 32) metadataPreCachedOptions];
    uint64_t v19 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 24)];
    [v18 addObject:v19];

    if ([*(id *)(a1 + 32) shouldUpdateMetadataCache])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__TUCallHistoryController_callHistoryManagerRecentCallsDispatchBlock__block_invoke_67;
      block[3] = &unk_1E58E5BE0;
      id v23 = v14;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  v20 = [getCHRecentCallClass() predicateForCallsWithStatusRead:0];
  v21 = [*(id *)(a1 + 32) callHistoryManager];
  objc_msgSend(*(id *)(a1 + 32), "setUnreadCallCount:", objc_msgSend(v21, "callCountWithPredicate:", v20));
}

- (CHManager)callHistoryManager
{
  return self->_callHistoryManager;
}

- (NSMutableSet)metadataPreCachedOptions
{
  return self->_metadataPreCachedOptions;
}

- (void)setRecentCalls:(id)a3
{
  id v5 = (NSArray *)a3;
  if (self->_recentCalls != v5)
  {
    objc_storeStrong((id *)&self->_recentCalls, a3);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__TUCallHistoryController_setRecentCalls___block_invoke;
    block[3] = &unk_1E58E5BE0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (BOOL)shouldUpdateMetadataCache
{
  return self->_shouldUpdateMetadataCache;
}

- (BOOL)canLoadOlderRecentCalls
{
  id v3 = [(TUCallHistoryController *)self featureFlags];
  if ([v3 increaseCallHistoryEnabled])
  {
    BOOL v4 = [(TUCallHistoryController *)self callHistoryManager];
    char v5 = [v4 canLoadOlderRecentCalls];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (int64_t)callHistoryControllerCallHistoryFetchLimit
{
  BOOL v2 = [(TUCallHistoryController *)self featureFlags];
  if ([v2 increaseCallHistoryEnabled]) {
    int64_t v3 = 2000;
  }
  else {
    int64_t v3 = 100;
  }

  return v3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

uint64_t __44__TUCallHistoryController_loadDispatchQueue__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isSystemProvider] ^ 1;
}

uint64_t __62__TUCallHistoryController_providersChangedForProviderManager___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isSystemProvider] ^ 1;
}

- (void)providersChangedForProviderManager:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  uint64_t v6 = [(TUCallHistoryController *)self dispatcher];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__TUCallHistoryController_providersChangedForProviderManager___block_invoke;
  v8[3] = &unk_1E58E5C08;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 dispatchAsynchronousBlock:v8];
}

- (unint64_t)unreadCallCount
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  int64_t v3 = [(TUCallHistoryController *)self simpleIvarDispatcher];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__TUCallHistoryController_unreadCallCount__block_invoke;
  v6[3] = &unk_1E58E6568;
  v6[4] = self;
  v6[5] = &v7;
  [v3 dispatchSynchronousBlock:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setUnreadCallCount:(unint64_t)a3
{
  char v5 = [(TUCallHistoryController *)self simpleIvarDispatcher];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__TUCallHistoryController_setUnreadCallCount___block_invoke;
  v6[3] = &unk_1E58E6590;
  v6[4] = self;
  v6[5] = a3;
  [v5 dispatchAsynchronousBlock:v6];
}

- (TUDispatcher)simpleIvarDispatcher
{
  return self->_simpleIvarDispatcher;
}

- (void)loadDispatchQueue
{
  int64_t v3 = [(TUCallHistoryController *)self dispatcher];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__TUCallHistoryController_loadDispatchQueue__block_invoke;
  v8[3] = &unk_1E58E5BE0;
  v8[4] = self;
  [v3 dispatchAsynchronousBlock:v8];

  unint64_t v4 = [(TUCallHistoryController *)self dispatcher];
  char v5 = [(TUCallHistoryController *)self callHistoryManagerInitializationDispatchBlock];
  [v4 dispatchAsynchronousBlock:v5];

  uint64_t v6 = [(TUCallHistoryController *)self dispatcher];
  uint64_t v7 = [(TUCallHistoryController *)self callHistoryManagerRecentCallsDispatchBlock];
  [v6 dispatchAsynchronousBlock:v7];
}

- (NSArray)recentCalls
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__1;
  uint64_t v12 = __Block_byref_object_dispose__1;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__TUCallHistoryController_recentCalls__block_invoke;
  v7[3] = &unk_1E58E6568;
  v7[4] = self;
  v7[5] = &v8;
  int64_t v3 = _Block_copy(v7);
  unint64_t v4 = [(TUCallHistoryController *)self dispatcher];
  [v4 dispatchSynchronousBlock:v3];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (TUDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (id)callHistoryManagerRecentCallsDispatchBlock
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__TUCallHistoryController_callHistoryManagerRecentCallsDispatchBlock__block_invoke;
  aBlock[3] = &unk_1E58E5BE0;
  aBlock[4] = self;
  BOOL v2 = _Block_copy(aBlock);
  int64_t v3 = _Block_copy(v2);

  return v3;
}

- (id)callHistoryManagerInitializationDispatchBlock
{
  unint64_t coalescingStrategy = self->_coalescingStrategy;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__TUCallHistoryController_callHistoryManagerInitializationDispatchBlock__block_invoke;
  v6[3] = &unk_1E58E6590;
  v6[4] = self;
  v6[5] = coalescingStrategy;
  int64_t v3 = _Block_copy(v6);
  unint64_t v4 = _Block_copy(v3);

  return v4;
}

uint64_t __72__TUCallHistoryController_callHistoryManagerInitializationDispatchBlock__block_invoke(uint64_t a1)
{
  uint64_t result = CUTWeakLinkClass();
  if (result)
  {
    int64_t v3 = (objc_class *)result;
    if (!gSharedCallHistoryInstance_block_invoke__kCHCoalescingStrategyRecents)
    {
      unint64_t v4 = (void **)CUTWeakLinkSymbol();
      if (v4) {
        id v5 = *v4;
      }
      else {
        id v5 = 0;
      }
      objc_storeStrong((id *)&gSharedCallHistoryInstance_block_invoke__kCHCoalescingStrategyRecents, v5);
    }
    id v6 = objc_alloc_init(v3);
    [*(id *)(a1 + 32) setCallHistoryManager:v6];

    uint64_t v7 = [*(id *)(a1 + 32) _callHistoryCoalescingStrategyForCoalescingStrategy:*(void *)(a1 + 40)];
    uint64_t v8 = (void *)v7;
    if (v7) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = gSharedCallHistoryInstance_block_invoke__kCHCoalescingStrategyRecents;
    }
    uint64_t v10 = [*(id *)(a1 + 32) callHistoryManager];
    [v10 setCoalescingStrategy:v9];

    id v11 = *(void **)(a1 + 32);
    return [v11 _updateCallHistoryManagerUsingCurrentOptions];
  }
  return result;
}

- (void)setCallHistoryManager:(id)a3
{
  id v5 = (CHManager *)a3;
  if (self->_callHistoryManager != v5)
  {
    id v11 = v5;
    objc_storeStrong((id *)&self->_callHistoryManager, a3);
    if (!setCallHistoryManager___kCallHistoryDatabaseChangedNotification)
    {
      id v6 = (void **)CUTWeakLinkSymbol();
      if (v6) {
        uint64_t v7 = *v6;
      }
      else {
        uint64_t v7 = 0;
      }
      objc_storeStrong((id *)&setCallHistoryManager___kCallHistoryDatabaseChangedNotification, v7);
    }
    callHistoryManager = self->_callHistoryManager;
    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = v9;
    if (callHistoryManager) {
      [v9 addObserver:self selector:sel_callHistoryDatabaseChanged_ name:setCallHistoryManager___kCallHistoryDatabaseChangedNotification object:0];
    }
    else {
      [v9 removeObserver:self name:setCallHistoryManager___kCallHistoryDatabaseChangedNotification object:0];
    }

    id v5 = v11;
  }
}

- (id)_callHistoryCoalescingStrategyForCoalescingStrategy:(unint64_t)a3
{
  if (!_callHistoryCoalescingStrategyForCoalescingStrategy___kCHCoalescingStrategyRecents)
  {
    unint64_t v4 = (void **)CUTWeakLinkSymbol();
    if (v4) {
      id v5 = *v4;
    }
    else {
      id v5 = 0;
    }
    objc_storeStrong((id *)&_callHistoryCoalescingStrategyForCoalescingStrategy___kCHCoalescingStrategyRecents, v5);
  }
  if (!_callHistoryCoalescingStrategyForCoalescingStrategy___kCHCoalescingStrategyCollapseIfEqual)
  {
    id v6 = (void **)CUTWeakLinkSymbol();
    if (v6) {
      uint64_t v7 = *v6;
    }
    else {
      uint64_t v7 = 0;
    }
    objc_storeStrong((id *)&_callHistoryCoalescingStrategyForCoalescingStrategy___kCHCoalescingStrategyCollapseIfEqual, v7);
  }
  if (a3 == 1)
  {
    uint64_t v8 = &_callHistoryCoalescingStrategyForCoalescingStrategy___kCHCoalescingStrategyRecents;
    goto LABEL_15;
  }
  if (a3 == 2)
  {
    uint64_t v8 = &_callHistoryCoalescingStrategyForCoalescingStrategy___kCHCoalescingStrategyCollapseIfEqual;
LABEL_15:
    id v9 = (id)*v8;
    goto LABEL_17;
  }
  id v9 = 0;
LABEL_17:

  return v9;
}

- (TUCallHistoryController)initWithCoalescingStrategy:(unint64_t)a3 options:(unint64_t)a4 dataSource:(id)a5 shouldUpdateMetadataCache:(BOOL)a6
{
  id v11 = a5;
  v34.receiver = self;
  v34.super_class = (Class)TUCallHistoryController;
  uint64_t v12 = [(TUCallHistoryController *)&v34 init];
  if (v12)
  {
    id v13 = NSString;
    v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v15 = [v14 bundleIdentifier];
    v16 = (objc_class *)objc_opt_class();
    char v17 = NSStringFromClass(v16);
    v18 = [v13 stringWithFormat:@"%@.%@", v15, v17];

    uint64_t v19 = objc_alloc_init(TUFeatureFlags);
    featureFlags = v12->_featureFlags;
    v12->_featureFlags = v19;

    v12->_unint64_t coalescingStrategy = a3;
    uint64_t v21 = +[TUDispatcher dispatcherWithIdentifier:v18];
    dispatcher = v12->_dispatcher;
    v12->_dispatcher = (TUDispatcher *)v21;

    id v23 = [v18 stringByAppendingString:@"_simpleIvarAccess"];
    uint64_t v24 = +[TUDispatcher dispatcherWithIdentifier:v23];
    simpleIvarDispatcher = v12->_simpleIvarDispatcher;
    v12->_simpleIvarDispatcher = (TUDispatcher *)v24;

    v12->_unint64_t options = a4;
    uint64_t v26 = objc_opt_new();
    metadataPreCachedOptions = v12->_metadataPreCachedOptions;
    v12->_metadataPreCachedOptions = (NSMutableSet *)v26;

    v12->_shouldUpdateMetadataCache = a6;
    uint64_t v28 = objc_alloc_init(TUCallProviderManager);
    callProviderManager = v12->_callProviderManager;
    v12->_callProviderManager = v28;

    v30 = v12->_callProviderManager;
    int v31 = [(TUDispatcher *)v12->_dispatcher dispatchQueue];
    [(TUCallProviderManager *)v30 addDelegate:v12 queue:v31];

    objc_storeStrong((id *)&v12->_dataSource, a5);
    int v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v32 addObserver:v12 selector:sel_dispatcherDidFinishBoost_ name:@"TUDispatcherDidFinishBoostQualityOfServiceNotification" object:v12->_dispatcher];
    [(TUCallHistoryController *)v12 loadDispatchQueue];
  }
  return v12;
}

void __42__TUCallHistoryController_setRecentCalls___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"TUCallHistoryControllerRecentCallsDidChangeNotification" object:*(void *)(a1 + 32) userInfo:0];
}

void __69__TUCallHistoryController_callHistoryManagerRecentCallsDispatchBlock__block_invoke_67(uint64_t a1)
{
  id v2 = +[TUMetadataClientController sharedInstance];
  [v2 updateMetadataForRecentCalls:*(void *)(a1 + 32)];
}

uint64_t __42__TUCallHistoryController_unreadCallCount__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 48);
  return result;
}

void __46__TUCallHistoryController_setUnreadCallCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(v1 + 48) != v2)
  {
    *(void *)(v1 + 48) = v2;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__TUCallHistoryController_setUnreadCallCount___block_invoke_2;
    block[3] = &unk_1E58E5BE0;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

+ (TUCallHistoryController)sharedController
{
  int64_t v3 = (void *)gSharedCallHistoryInstance;
  if (!gSharedCallHistoryInstance)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"TUCallHistoryController.m" lineNumber:109 description:@"The controller should have been initialized with sharedControllerWithCoalescingStrategy: before attempting to access the instance with the sharedController convenience method"];

    int64_t v3 = (void *)gSharedCallHistoryInstance;
  }

  return (TUCallHistoryController *)v3;
}

- (TUCallHistoryController)init
{
  unint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s is not available for use. To create an object instance use the designated initializer.", "-[TUCallHistoryController init]");
  NSLog(&cfstr_TuassertionFai.isa, v4);

  if (_TUAssertShouldCrashApplication())
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUCallHistoryController.m", 139, @"%s is not available for use. To create an object instance use the designated initializer.", "-[TUCallHistoryController init]");
  }
  return 0;
}

- (void)dealloc
{
  int64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TUCallHistoryController;
  [(TUCallHistoryController *)&v4 dealloc];
}

- (unint64_t)coalescingStrategy
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__TUCallHistoryController_coalescingStrategy__block_invoke;
  v7[3] = &unk_1E58E6568;
  v7[4] = self;
  v7[5] = &v8;
  int64_t v3 = _Block_copy(v7);
  objc_super v4 = [(TUCallHistoryController *)self dispatcher];
  [v4 dispatchSynchronousBlock:v3];

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __45__TUCallHistoryController_coalescingStrategy__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

- (void)setCoalescingStrategy:(unint64_t)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__TUCallHistoryController_setCoalescingStrategy___block_invoke;
  v6[3] = &unk_1E58E6590;
  v6[4] = self;
  v6[5] = a3;
  objc_super v4 = _Block_copy(v6);
  unint64_t v5 = [(TUCallHistoryController *)self dispatcher];
  [v5 dispatchAsynchronousBlock:v4];
}

void __49__TUCallHistoryController_setCoalescingStrategy___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(v1 + 16) != v2)
  {
    *(void *)(v1 + 16) = v2;
    objc_super v4 = [*(id *)(a1 + 32) _callHistoryCoalescingStrategyForCoalescingStrategy:*(void *)(a1 + 40)];
    unint64_t v5 = [*(id *)(a1 + 32) callHistoryManager];
    [v5 setCoalescingStrategy:v4];

    id v6 = [*(id *)(a1 + 32) callHistoryManagerRecentCallsDispatchBlock];
    v6[2]();
  }
}

- (unint64_t)options
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__TUCallHistoryController_options__block_invoke;
  v7[3] = &unk_1E58E6568;
  v7[4] = self;
  v7[5] = &v8;
  int64_t v3 = _Block_copy(v7);
  objc_super v4 = [(TUCallHistoryController *)self dispatcher];
  [v4 dispatchSynchronousBlock:v3];

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __34__TUCallHistoryController_options__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 24);
  return result;
}

- (void)setOptions:(unint64_t)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__TUCallHistoryController_setOptions___block_invoke;
  v6[3] = &unk_1E58E6590;
  v6[4] = self;
  v6[5] = a3;
  objc_super v4 = _Block_copy(v6);
  unint64_t v5 = [(TUCallHistoryController *)self dispatcher];
  [v5 dispatchAsynchronousBlock:v4];
}

void __38__TUCallHistoryController_setOptions___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(v1 + 24) != v2)
  {
    *(void *)(v1 + 24) = v2;
    [*(id *)(a1 + 32) _updateCallHistoryManagerUsingCurrentOptions];
    objc_super v4 = [*(id *)(a1 + 32) callHistoryManagerRecentCallsDispatchBlock];
    v4[2]();
  }
}

- (NSOperationQueue)searchQueue
{
  searchQueue = self->_searchQueue;
  if (!searchQueue)
  {
    objc_super v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    unint64_t v5 = self->_searchQueue;
    self->_searchQueue = v4;

    [(NSOperationQueue *)self->_searchQueue setMaxConcurrentOperationCount:1];
    searchQueue = self->_searchQueue;
  }

  return searchQueue;
}

- (void)cancelSearchFetchOperations
{
  id v2 = [(TUCallHistoryController *)self searchQueue];
  [v2 cancelAllOperations];
}

- (void)setPreFetchingPredicate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B48]);
  objc_initWeak(&location, v5);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __51__TUCallHistoryController_setPreFetchingPredicate___block_invoke;
  uint64_t v11 = &unk_1E58E65B8;
  objc_copyWeak(&v14, &location);
  uint64_t v12 = self;
  id v6 = v4;
  id v13 = v6;
  [v5 addExecutionBlock:&v8];
  uint64_t v7 = [(TUCallHistoryController *)self searchQueue];
  [v7 addOperation:v5];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __51__TUCallHistoryController_setPreFetchingPredicate___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained
    || (id v4 = WeakRetained,
        id v5 = objc_loadWeakRetained(v2),
        int v6 = [v5 isCancelled],
        v5,
        v4,
        v6))
  {
    uint64_t v7 = TUDefaultLog();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v8 = "Ignoring fetching of recent calls as this operation is cancelled";
      uint64_t v9 = buf;
LABEL_5:
      _os_log_impl(&dword_19C496000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  if (*(void *)(v10 + 32) != v11)
  {
    *(void *)(v10 + 32) = v11;
    uint64_t v12 = [*(id *)(a1 + 32) callHistoryManager];
    [v12 setPreFetchingPredicate:*(void *)(a1 + 40)];

    id v13 = objc_loadWeakRetained(v2);
    if (v13)
    {
      id v14 = v13;
      id v15 = objc_loadWeakRetained(v2);
      int v16 = [v15 isCancelled];

      if (!v16)
      {
        char v17 = TUDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_19C496000, v17, OS_LOG_TYPE_DEFAULT, "Setting the recent calls as operation is running", v18, 2u);
        }

        uint64_t v7 = [*(id *)(a1 + 32) callHistoryManagerRecentCallsDispatchBlock];
        (*(void (**)(void))(v7 + 16))();
        goto LABEL_6;
      }
    }
    uint64_t v7 = TUDefaultLog();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v19 = 0;
      uint64_t v8 = "No need to set the recent calls as this operation is already cancelled because of new fetchPredicate";
      uint64_t v9 = (uint8_t *)&v19;
      goto LABEL_5;
    }
LABEL_6:
  }
}

void __46__TUCallHistoryController_setUnreadCallCount___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"TUCallHistoryControllerUnreadCallCountDidChangeNotification" object:*(void *)(a1 + 32) userInfo:0];
}

- (void)boostQualityOfService
{
  id v2 = [(TUCallHistoryController *)self dispatcher];
  [v2 boostQualityOfService];
}

- (void)deleteAllRecentCalls
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__TUCallHistoryController_deleteAllRecentCalls__block_invoke;
  aBlock[3] = &unk_1E58E5BE0;
  aBlock[4] = self;
  int64_t v3 = _Block_copy(aBlock);
  id v4 = [(TUCallHistoryController *)self dispatcher];
  [v4 dispatchAsynchronousBlock:v3];
}

void __47__TUCallHistoryController_deleteAllRecentCalls__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callHistoryManager];
  [v2 clearDatabase];

  id v3 = [*(id *)(a1 + 32) dataSource];
  [v3 allCallHistoryDeleted];
}

- (void)deleteRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __44__TUCallHistoryController_deleteRecentCall___block_invoke;
    uint64_t v11 = &unk_1E58E5C08;
    uint64_t v12 = self;
    id v13 = v4;
    int v6 = _Block_copy(&v8);
    uint64_t v7 = [(TUCallHistoryController *)self dispatcher];
    [v7 dispatchAsynchronousBlock:v6];
  }
}

void __44__TUCallHistoryController_deleteRecentCall___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callHistoryManager];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) callHistoryManager];
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObject:*(void *)(a1 + 40)];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__TUCallHistoryController_deleteRecentCall___block_invoke_2;
    v7[3] = &unk_1E58E5C08;
    int v6 = *(void **)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v6;
    [v4 deleteCalls:v5 withCompletion:v7];
  }
}

void __44__TUCallHistoryController_deleteRecentCall___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) dataSource];
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObject:*(void *)(a1 + 40)];
  [v3 recentCallsDeleted:v2];
}

- (void)deleteRecentCalls:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    uint64_t v9 = __45__TUCallHistoryController_deleteRecentCalls___block_invoke;
    uint64_t v10 = &unk_1E58E5C08;
    uint64_t v11 = self;
    id v12 = v4;
    id v5 = _Block_copy(&v7);
    int v6 = [(TUCallHistoryController *)self dispatcher];
    [v6 dispatchAsynchronousBlock:v5];
  }
}

void __45__TUCallHistoryController_deleteRecentCalls___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callHistoryManager];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) callHistoryManager];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__TUCallHistoryController_deleteRecentCalls___block_invoke_2;
    v6[3] = &unk_1E58E5C08;
    id v5 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = v5;
    [v4 deleteCalls:v7 withCompletion:v6];
  }
}

void __45__TUCallHistoryController_deleteRecentCalls___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataSource];
  [v2 recentCallsDeleted:*(void *)(a1 + 40)];
}

- (void)markRecentVideoCallsAsRead
{
  v7[2] = *MEMORY[0x1E4F143B8];
  char v3 = [getCHRecentCallClass() predicateForCallsWithStatusRead:0];
  v7[0] = v3;
  id v4 = [getCHRecentCallClass() predicateForCallsWithMediaType:2];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  int v6 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v5];
  [(TUCallHistoryController *)self markRecentCallsAsReadWithPredicate:v6];
}

- (void)markRecentAudioCallsAsRead
{
  v7[2] = *MEMORY[0x1E4F143B8];
  char v3 = [getCHRecentCallClass() predicateForCallsWithStatusRead:0];
  v7[0] = v3;
  id v4 = [getCHRecentCallClass() predicateForCallsWithMediaType:1];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  int v6 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v5];
  [(TUCallHistoryController *)self markRecentCallsAsReadWithPredicate:v6];
}

- (id)recentCallsWithPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  int v16 = __Block_byref_object_copy__1;
  char v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__TUCallHistoryController_recentCallsWithPredicate___block_invoke;
  aBlock[3] = &unk_1E58E65E0;
  id v12 = &v13;
  aBlock[4] = self;
  id v5 = v4;
  id v11 = v5;
  int v6 = _Block_copy(aBlock);
  id v7 = [(TUCallHistoryController *)self dispatcher];
  [v7 dispatchSynchronousBlock:v6];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __52__TUCallHistoryController_recentCallsWithPredicate___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) callHistoryManager];
  uint64_t v2 = [v5 recentCallsWithPredicate:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __78__TUCallHistoryController_callHistoryManagerLoadOlderRecentCallsDispatchBlock__block_invoke_69(uint64_t a1)
{
  id v2 = +[TUMetadataClientController sharedInstance];
  [v2 updateMetadataForRecentCalls:*(void *)(a1 + 32)];
}

- (void)callHistoryDatabaseChanged:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }

  int v6 = [(TUCallHistoryController *)self dispatcher];
  id v7 = [(TUCallHistoryController *)self callHistoryManagerRecentCallsDispatchBlock];
  [v6 dispatchAsynchronousBlock:v7];
}

- (void)dispatcherDidFinishBoost:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__TUCallHistoryController_dispatcherDidFinishBoost___block_invoke;
  block[3] = &unk_1E58E5BE0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __52__TUCallHistoryController_dispatcherDidFinishBoost___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"TUCallHistoryControllerDidFinishBoostNotification" object:*(void *)(a1 + 32)];
}

- (NSPredicate)preFetchingPredicate
{
  return self->_preFetchingPredicate;
}

- (void)setSearchQueue:(id)a3
{
}

- (void)setCallProviderManager:(id)a3
{
}

- (void)setDispatcher:(id)a3
{
}

- (void)setSimpleIvarDispatcher:(id)a3
{
}

- (void)setMetadataPreCachedOptions:(id)a3
{
}

- (TUCallHistoryControllerDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_metadataPreCachedOptions, 0);
  objc_storeStrong((id *)&self->_thirdPartyCallProviders, 0);
  objc_storeStrong((id *)&self->_simpleIvarDispatcher, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_callHistoryManager, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_searchQueue, 0);

  objc_storeStrong((id *)&self->_recentCalls, 0);
}

@end