@interface _PSBlockedHandlesCache
+ (id)sharedBlockedHandlesCache;
- (BOOL)isHandleBlocked:(id)a3;
- (_PSBlockedHandlesCache)init;
- (uint64_t)beginSyncingWithTU;
- (void)beginSyncingWithTU;
- (void)handlePrivacyManagerChangeNotification:(id)a3;
- (void)rebuildCacheFromPrivacyManager;
- (void)rebuildCacheWithBlockedHandles:(id)a3;
@end

@implementation _PSBlockedHandlesCache

+ (id)sharedBlockedHandlesCache
{
  if (sharedBlockedHandlesCache__pasOnceToken1 != -1) {
    dispatch_once(&sharedBlockedHandlesCache__pasOnceToken1, &__block_literal_global_2);
  }
  v2 = (void *)sharedBlockedHandlesCache_cache;

  return v2;
}

- (_PSBlockedHandlesCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)_PSBlockedHandlesCache;
  v2 = [(_PSBlockedHandlesCache *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_PSBlockedHandlesCache *)v2 rebuildCacheWithBlockedHandles:MEMORY[0x1E4F1CBF0]];
  }
  return v3;
}

- (BOOL)isHandleBlocked:(id)a3
{
  id v4 = a3;
  char v5 = (*((uint64_t (**)(void))self->_isHandleBlocked + 2))();
  v6 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(_PSBlockedHandlesCache *)(uint64_t)v4 isHandleBlocked:v6];
  }

  char v7 = (*((uint64_t (**)(void))self->_isHandleBlocked + 2))();
  return v7;
}

- (void)beginSyncingWithTU
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  id v4 = (void *)getTUPrivacyRulesChangedNotificationSymbolLoc_ptr;
  uint64_t v13 = getTUPrivacyRulesChangedNotificationSymbolLoc_ptr;
  if (!getTUPrivacyRulesChangedNotificationSymbolLoc_ptr)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getTUPrivacyRulesChangedNotificationSymbolLoc_block_invoke;
    v8[3] = &unk_1E5ADE858;
    v9 = &v10;
    char v5 = (void *)TelephonyUtilitiesLibrary();
    v11[3] = (uint64_t)dlsym(v5, "TUPrivacyRulesChangedNotification");
    getTUPrivacyRulesChangedNotificationSymbolLoc_ptr = *(void *)(v9[1] + 24);
    id v4 = (void *)v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v4)
  {
    char v7 = (_Unwind_Exception *)-[_PSBlockedHandlesCache beginSyncingWithTU]();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v7);
  }
  [v3 addObserver:self selector:sel_handlePrivacyManagerChangeNotification_ name:*v4 object:0];

  v6 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8[0]) = 0;
    _os_log_impl(&dword_1A314B000, v6, OS_LOG_TYPE_DEFAULT, "_PSBlockedHandlesCache will perform initial fetch from TU", (uint8_t *)v8, 2u);
  }

  [(_PSBlockedHandlesCache *)self rebuildCacheFromPrivacyManager];
}

- (void)handlePrivacyManagerChangeNotification:(id)a3
{
  id v4 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v4, OS_LOG_TYPE_DEFAULT, "_PSBlockedHandlesCache handling change notification", buf, 2u);
  }

  if (handlePrivacyManagerChangeNotification___pasOnceToken6 != -1) {
    dispatch_once(&handlePrivacyManagerChangeNotification___pasOnceToken6, &__block_literal_global_6_0);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65___PSBlockedHandlesCache_handlePrivacyManagerChangeNotification___block_invoke_2;
  block[3] = &unk_1E5ADE940;
  block[4] = self;
  char v5 = (id)handlePrivacyManagerChangeNotification___pasExprOnceResult;
  dispatch_async(v5, block);
}

- (void)rebuildCacheFromPrivacyManager
{
  v3 = (void *)os_transaction_create();
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  id v4 = (void *)getTUPrivacyManagerClass_softClass;
  uint64_t v13 = getTUPrivacyManagerClass_softClass;
  if (!getTUPrivacyManagerClass_softClass)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getTUPrivacyManagerClass_block_invoke;
    v9[3] = &unk_1E5ADE858;
    v9[4] = &v10;
    __getTUPrivacyManagerClass_block_invoke((uint64_t)v9);
    id v4 = (void *)v11[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v10, 8);
  v6 = [v5 sharedPrivacyManager];
  char v7 = [v6 privacyRules];
  v8 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_12_0);

  [(_PSBlockedHandlesCache *)self rebuildCacheWithBlockedHandles:v8];
}

- (void)rebuildCacheWithBlockedHandles:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    if ((unint64_t)[v4 count] > 0x3E7)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F93AB8];
      uint64_t v14 = [v4 count];
      LODWORD(v15) = 897988541;
      v16 = [v13 bloomFilterInMemoryWithNumberOfValuesN:v14 errorRateP:v15];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v17 = v4;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        v20 = 0;
        uint64_t v21 = *(void *)v35;
        do
        {
          uint64_t v22 = 0;
          v23 = v20;
          do
          {
            if (*(void *)v35 != v21) {
              objc_enumerationMutation(v17);
            }
            uint64_t v24 = *(void *)(*((void *)&v34 + 1) + 8 * v22);
            v25 = (void *)MEMORY[0x1A6243860]();
            v20 = [v16 computeHashesForString:v24 reuse:v23];

            [v16 setWithHashes:v20];
            ++v22;
            v23 = v20;
          }
          while (v19 != v22);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v44 count:16];
        }
        while (v19);
      }
      v26 = self;
      objc_sync_enter(v26);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __57___PSBlockedHandlesCache_rebuildCacheWithBlockedHandles___block_invoke_3;
      v32[3] = &unk_1E5ADE9A8;
      id v33 = v16;
      id v27 = v16;
      uint64_t v28 = MEMORY[0x1A6243AD0](v32);
      id isHandleBlocked = v26->_isHandleBlocked;
      v26->_id isHandleBlocked = (id)v28;

      objc_sync_exit(v26);
      uint64_t v10 = @"bloom filter";
    }
    else
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];
      v6 = self;
      objc_sync_enter(v6);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __57___PSBlockedHandlesCache_rebuildCacheWithBlockedHandles___block_invoke_2;
      v38[3] = &unk_1E5ADE9A8;
      id v39 = v5;
      id v7 = v5;
      uint64_t v8 = MEMORY[0x1A6243AD0](v38);
      id v9 = v6->_isHandleBlocked;
      v6->_id isHandleBlocked = (id)v8;

      objc_sync_exit(v6);
      uint64_t v10 = @"set";
    }
  }
  else
  {
    v11 = self;
    objc_sync_enter(v11);
    id v12 = v11->_isHandleBlocked;
    v11->_id isHandleBlocked = &__block_literal_global_16;

    objc_sync_exit(v11);
    uint64_t v10 = @"empty";
  }
  v30 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = [v4 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v41 = v31;
    __int16 v42 = 2112;
    v43 = v10;
    _os_log_impl(&dword_1A314B000, v30, OS_LOG_TYPE_DEFAULT, "_PSBlockedHandlesCache rebuilt cache with %tu blocked handles using %@ path", buf, 0x16u);
  }
}

- (void).cxx_destruct
{
}

- (void)isHandleBlocked:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138478083;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl(&dword_1A314B000, log, OS_LOG_TYPE_DEBUG, "_PSBlockedHandlesCache _isHandleBlocked:%{private}@ result:%d", (uint8_t *)&v3, 0x12u);
}

- (uint64_t)beginSyncingWithTU
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getTUPrivacyManagerClass_block_invoke_cold_1(v0);
}

@end