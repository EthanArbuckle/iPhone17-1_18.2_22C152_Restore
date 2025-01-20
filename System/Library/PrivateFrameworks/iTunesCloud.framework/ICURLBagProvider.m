@interface ICURLBagProvider
+ (ICURLBagProvider)sharedBagProvider;
- (BOOL)useAMSBag;
- (BOOL)useRawPayload;
- (ICURLBagProvider)init;
- (id)_amsProcessInfoFromRequestContext:(id)a3;
- (id)_cacheDirectoryPath;
- (id)_dictionaryFromBagPayloadDictionaryAddingKnownMissingKeys:(id)a3 forProfileName:(id)a4;
- (id)_getCacheKeyForRequestContext:(id)a3;
- (id)_knownMissingBagValuesDictionary;
- (id)_legacyCacheFilePath;
- (id)_loadPlistAtPath:(id)a3;
- (void)_cleanBagCacheExcludingPaths:(id)a3;
- (void)_fetchBagForRequestContext:(id)a3 withCompletionHandler:(id)a4;
- (void)_handleAMSBagChangedNotification:(id)a3;
- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3;
- (void)_loadCache;
- (void)_loadMonoCache;
- (void)_persistBagToDisk:(id)a3 withKey:(id)a4;
- (void)dealloc;
- (void)getBagAndURLMetricsForRequestContext:(id)a3 forceRefetch:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)getBagForRequestContext:(id)a3 forceRefetch:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)getBagForRequestContext:(id)a3 withCompletionHandler:(id)a4;
- (void)invalidateCache;
- (void)setUseAMSBag:(BOOL)a3;
- (void)setUseRawPayload:(BOOL)a3;
@end

@implementation ICURLBagProvider

- (id)_getCacheKeyForRequestContext:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 identity];
  v6 = [v4 identityStore];
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = self;
    id v54 = 0;
    v8 = [v6 getPropertiesForUserIdentity:v5 error:&v54];
    id v10 = v54;
    if (v10)
    {
      id v11 = v4;
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v56 = v9;
        __int16 v57 = 2114;
        id v58 = v10;
        _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch identity properties. err=%{public}@", buf, 0x16u);
      }

      id v4 = v11;
    }

    self = v9;
  }
  v48 = v7;
  v49 = (void *)v5;
  v53 = [v8 storefrontIdentifier];
  v47 = v8;
  v13 = [v8 DSID];
  v14 = [v4 clientInfo];
  v15 = [v14 clientIdentifier];
  v16 = [v14 clientVersion];
  v52 = [v14 bundleIdentifier];
  v51 = [v14 bagProfile];
  v50 = [v14 bagProfileVersion];
  v17 = +[ICDeviceInfo currentDeviceInfo];
  v18 = [v17 currentLocale];
  v19 = [v17 productPlatform];
  uint64_t v20 = [v4 personalizationStyle];
  v21 = NSString;
  if (self->_useAMSBag)
  {
    if (v13)
    {
      v22 = v16;
      v23 = v15;
      v24 = NSString;
      uint64_t v25 = [v13 stringValue];
      v21 = v24;
      v15 = v23;
      v16 = v22;
      v26 = (__CFString *)v25;
    }
    else
    {
      v26 = @"nil";
    }
    v32 = v51;
    v31 = v52;
    if (!v52) {
      v31 = @"nil";
    }
    if (v15) {
      v33 = v15;
    }
    else {
      v33 = @"nil";
    }
    if (v16) {
      v34 = v16;
    }
    else {
      v34 = @"nil";
    }
    if (!v51) {
      v32 = @"nil";
    }
    v35 = v50;
    if (!v50) {
      v35 = @"nil";
    }
    v36 = v53;
    if (!v53) {
      v36 = @"nil";
    }
    if (v18) {
      v37 = v18;
    }
    else {
      v37 = @"nil";
    }
    if (v19) {
      v38 = v19;
    }
    else {
      v38 = @"nil";
    }
    v39 = [v21 stringWithFormat:@"%@-%@-%@-%@-%@-%@-%@-%@-%@", v26, v31, v33, v34, v32, v35, v36, v37, v38];
    if (v13) {
LABEL_35:
    }
  }
  else
  {
    if (v13)
    {
      v27 = v16;
      v28 = v15;
      v29 = NSString;
      uint64_t v30 = [v13 stringValue];
      v21 = v29;
      v15 = v28;
      v16 = v27;
      v26 = (__CFString *)v30;
    }
    else
    {
      v26 = @"nil";
    }
    v41 = @"personalized";
    if (!v20) {
      v41 = @"unpersonalized";
    }
    if (v15) {
      v42 = v15;
    }
    else {
      v42 = @"nil";
    }
    if (v16) {
      v43 = v16;
    }
    else {
      v43 = @"nil";
    }
    v44 = v53;
    if (!v53) {
      v44 = @"nil";
    }
    if (v18) {
      v45 = v18;
    }
    else {
      v45 = @"nil";
    }
    if (v19) {
      v46 = v19;
    }
    else {
      v46 = @"nil";
    }
    v39 = [v21 stringWithFormat:@"%ld-%@-%@-%@-%@-%@-%@-%@", 0, v26, v41, v42, v43, v44, v45, v46];
    if (v13) {
      goto LABEL_35;
    }
  }

  return v39;
}

void __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  v3 = [*(id *)(a1 + 32) _getCacheKeyForRequestContext:*(void *)(a1 + 40)];
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__5542;
  v75 = __Block_byref_object_dispose__5543;
  id v76 = [*(id *)(*(void *)v2 + 8) objectForKey:v3];
  if (!v72[5])
  {
    id v4 = [NSString alloc];
    uint64_t v5 = [*(id *)(a1 + 32) _cacheDirectoryPath];
    v6 = (void *)[v4 initWithFormat:@"%@/%@.plist", v5, v3];

    v7 = [*(id *)(a1 + 32) _loadPlistAtPath:v6];
    if (!v7)
    {
LABEL_10:

      goto LABEL_11;
    }
    id v8 = [[ICURLBag alloc] _initWithPropertyListRepresentation:v7];
    v9 = (void *)v72[5];
    v72[5] = (uint64_t)v8;

    uint64_t v10 = v72[5];
    if (v10)
    {
      [*(id *)(*(void *)(a1 + 32) + 8) setObject:v10 forKey:v3];
      id v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v78 = v12;
        __int16 v79 = 2114;
        *(void *)v80 = v3;
        v13 = "%{public}@ Retrieved persisted cache from disk for cache key: %{public}@";
        v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
        _os_log_impl(&dword_1A2D01000, v14, v15, v13, buf, 0x16u);
      }
    }
    else
    {
      id v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v78 = v16;
        __int16 v79 = 2114;
        *(void *)v80 = v3;
        v13 = "%{public}@ Failed to create bag from cached data for key: %{public}@";
        v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }
LABEL_11:
  if (*(unsigned char *)(a1 + 56))
  {
    char v17 = 1;
  }
  else
  {
    v18 = +[ICDefaults standardDefaults];
    char v17 = [v18 shouldBypassURLBagCache];
  }
  v19 = (void *)v72[5];
  if (!v19) {
    goto LABEL_23;
  }
  uint64_t v20 = [v19 amsBag];

  if ((v20 != 0) != (*(unsigned char *)(*(void *)(a1 + 32) + 64) != 0))
  {
    v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      int v23 = *(unsigned __int8 *)(v22 + 64);
      *(_DWORD *)buf = 138543874;
      uint64_t v78 = v22;
      __int16 v79 = 1024;
      *(_DWORD *)v80 = v23;
      *(_WORD *)&v80[4] = 1024;
      *(_DWORD *)&v80[6] = v20 != 0;
      _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Forcing a refresh because _useAMSBag = %{BOOL}u and hasAMSBagPayload = %{BOOL}u", buf, 0x18u);
    }

    goto LABEL_23;
  }
  v24 = (void *)v72[5];
  char v25 = v24 ? v17 : 1;
  if ((v25 & 1) != 0
    || [v24 isExpired]
    && ![*(id *)(a1 + 40) allowsExpiredBags])
  {
LABEL_23:
    v26 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v58 = v3;
      uint64_t v28 = *(void *)(a1 + 32);
      v27 = *(void **)(a1 + 40);
      id v29 = [v27 clientInfo];
      int v30 = *(unsigned __int8 *)(a1 + 56);
      v31 = (void *)v72[5];
      BOOL v32 = v31 != 0;
      int v33 = [v31 isExpired];
      int v34 = [*(id *)(a1 + 40) allowsExpiredBags];
      v35 = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
      *(_DWORD *)buf = 138545410;
      uint64_t v78 = v28;
      __int16 v79 = 2114;
      *(void *)v80 = v27;
      *(_WORD *)&v80[8] = 2114;
      id v81 = v29;
      __int16 v82 = 1024;
      int v83 = v30;
      __int16 v84 = 1024;
      BOOL v85 = v32;
      __int16 v86 = 1024;
      int v87 = v33;
      __int16 v88 = 1024;
      int v89 = v34;
      __int16 v90 = 2114;
      v3 = v58;
      v91 = v58;
      __int16 v92 = 2114;
      v93 = v35;
      _os_log_impl(&dword_1A2D01000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Fetching new bag for requestContext %{public}@, clientInfo=%{public}@; force=%{BOOL}u, cached=%{BOOL}"
        "u, expired=%{BOOL}u, allowsExpired=%{BOOL}u, cacheKey='%{public}@', allKeys=%{public}@",
        buf,
        0x4Cu);
    }
    uint64_t v36 = *(void *)(a1 + 32);
    if (*(void *)(a1 + 40))
    {
      v37 = [*(id *)(v36 + 40) objectForKey:v3];

      if (v37) {
        [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v3];
      }
      else {
      v39 = [MEMORY[0x1E4F1CA48] array];
      }
      v40 = *(void **)(a1 + 48);
      if (v40)
      {
        v41 = (void *)[v40 copy];
        [v39 addObject:v41];
      }
      if (v37)
      {
        v42 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v43 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          uint64_t v78 = v43;
          _os_log_impl(&dword_1A2D01000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ Waiting for a duplicate bag request to complete", buf, 0xCu);
        }
      }
      else
      {
        [*(id *)(*(void *)(a1 + 32) + 56) setObject:MEMORY[0x1E4F1CC28] forKey:*(void *)(a1 + 40)];
        [*(id *)(*(void *)(a1 + 32) + 40) setObject:v39 forKey:v3];
        v44 = *(void **)(a1 + 32);
        uint64_t v45 = *(void *)(a1 + 40);
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_59;
        v61[3] = &unk_1E5AC78D8;
        v61[4] = v44;
        id v62 = v3;
        id v63 = *(id *)(a1 + 40);
        v64 = &v71;
        [v44 _fetchBagForRequestContext:v45 withCompletionHandler:v61];
      }
    }
    else
    {
      v38 = *(NSObject **)(v36 + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_63;
      block[3] = &unk_1E5ACD170;
      id v60 = *(id *)(a1 + 48);
      dispatch_async(v38, block);
      v39 = v60;
    }
    goto LABEL_48;
  }
  v46 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_51;
  v68[3] = &unk_1E5ACC428;
  id v69 = *(id *)(a1 + 48);
  v70 = &v71;
  dispatch_async(v46, v68);
  if ([(id)v72[5] isExpired])
  {
    if (([*(id *)(*(void *)(a1 + 32) + 48) containsObject:v3] & 1) == 0)
    {
      v47 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v3];
      BOOL v48 = v47 == 0;

      if (v48)
      {
        v49 = _ICLogCategoryDefault();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v50 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          uint64_t v78 = v50;
          _os_log_impl(&dword_1A2D01000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ Returned expired URL bag, so scheduling an URL bag refresh in 10 seconds", buf, 0xCu);
        }

        v51 = *(void **)(*(void *)(a1 + 32) + 48);
        if (!v51)
        {
          uint64_t v52 = [MEMORY[0x1E4F1CA80] setWithCapacity:2];
          uint64_t v53 = *(void *)(a1 + 32);
          id v54 = *(void **)(v53 + 48);
          *(void *)(v53 + 48) = v52;

          v51 = *(void **)(*(void *)(a1 + 32) + 48);
        }
        [v51 addObject:v3];
        dispatch_time_t v55 = dispatch_time(0, 10000000000);
        uint64_t v56 = *(void *)(a1 + 32);
        __int16 v57 = *(NSObject **)(v56 + 16);
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_53;
        v65[3] = &unk_1E5ACD5C8;
        v65[4] = v56;
        id v66 = v3;
        id v67 = *(id *)(a1 + 40);
        dispatch_after(v55, v57, v65);
      }
    }
  }
  v39 = v69;
LABEL_48:

  _Block_object_dispose(&v71, 8);
}

uint64_t __79__ICURLBagProvider_getBagForRequestContext_forceRefetch_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

uint64_t __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_51(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0, 0);
  }
  return result;
}

- (void)getBagForRequestContext:(id)a3 withCompletionHandler:(id)a4
{
}

+ (ICURLBagProvider)sharedBagProvider
{
  if (sharedBagProvider_sOnceToken != -1) {
    dispatch_once(&sharedBagProvider_sOnceToken, &__block_literal_global_5696);
  }
  uint64_t v2 = (void *)sharedBagProvider_sSharedBagProvider;

  return (ICURLBagProvider *)v2;
}

- (void)getBagForRequestContext:(id)a3 forceRefetch:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__ICURLBagProvider_getBagForRequestContext_forceRefetch_withCompletionHandler___block_invoke;
  v10[3] = &unk_1E5AC7890;
  id v11 = v8;
  id v9 = v8;
  [(ICURLBagProvider *)self getBagAndURLMetricsForRequestContext:a3 forceRefetch:v5 withCompletionHandler:v10];
}

- (void)getBagAndURLMetricsForRequestContext:(id)a3 forceRefetch:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"ICURLBagProvider.m", 118, @"Invalid parameter not satisfying: %@", @"requestContext != nil" object file lineNumber description];
  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5ACCFB8;
  void block[4] = self;
  id v16 = v9;
  BOOL v18 = a4;
  id v17 = v10;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(accessQueue, block);
}

- (BOOL)useAMSBag
{
  return self->_useAMSBag;
}

void __53__ICURLBagProvider__handleAMSBagChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F4DA18]];
  id v4 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F4DA20]];
  BOOL v5 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F4DA10]];
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    id v29 = v7;
    __int16 v30 = 2114;
    v31 = v3;
    __int16 v32 = 2114;
    int v33 = v4;
    __int16 v34 = 2114;
    v35 = v5;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Recevied AMSBag change notification for profile %{public}@/%{public}@ and account '%{public}@", buf, 0x2Au);
  }

  if (v5)
  {
    id v8 = +[ICMonitoredAccountStore sharedAccountStore];
    id v27 = 0;
    id v9 = [v8 storeAccountWithIdentifier:v5 error:&v27];
    id v10 = v27;

    if (v10)
    {
      id v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = objc_msgSend(v10, "msv_description");
        *(_DWORD *)buf = 138543618;
        id v29 = v5;
        __int16 v30 = 2114;
        v31 = v12;
        _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_ERROR, "Failed to get account for identifier '%{public}@' error=%{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v10 = 0;
    id v9 = 0;
  }
  id v13 = [*(id *)(*(void *)(a1 + 40) + 56) allKeys];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __53__ICURLBagProvider__handleAMSBagChangedNotification___block_invoke_124;
  int v23 = &unk_1E5AC7970;
  id v14 = v3;
  id v24 = v14;
  id v15 = v4;
  id v25 = v15;
  id v16 = v9;
  id v26 = v16;
  id v17 = objc_msgSend(v13, "msv_firstWhere:", &v20);
  if (v17)
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "setObject:forKey:", MEMORY[0x1E4F1CC38], v17, v20, v21, v22, v23, v24, v25);
  }
  else
  {
    BOOL v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      id v29 = v19;
      _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_ERROR, "%{public}@ No matching request context for notification - ignoring", buf, 0xCu);
    }
  }
}

void __30__ICURLBagProvider__loadCache__block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _cacheDirectoryPath];
  v47 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v48 = (void *)v2;
  if ([v47 fileExistsAtPath:v2])
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v56 = v4;
      __int16 v57 = 2114;
      uint64_t v58 = v2;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Loading bag caches from '%{public}@'", buf, 0x16u);
    }
    uint64_t v43 = a1;

    v44 = [MEMORY[0x1E4F1CA80] set];
    BOOL v5 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v6 = [v47 enumeratorAtPath:v2];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v52;
      uint64_t v10 = *MEMORY[0x1E4F28310];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v52 != v9) {
            objc_enumerationMutation(v6);
          }
          id v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          if ([v12 hasSuffix:@".plist"])
          {
            id v13 = [v48 stringByAppendingPathComponent:v12];
            id v14 = [v47 attributesOfItemAtPath:v13 error:0];

            id v15 = [v14 objectForKey:v10];
            if (v15) {
              [v5 setObject:v15 forKey:v12];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v51 objects:v61 count:16];
      }
      while (v8);
    }

    id v16 = [v5 allKeys];
    id v17 = (void *)[v16 mutableCopy];

    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __30__ICURLBagProvider__loadCache__block_invoke_132;
    v49[3] = &unk_1E5AC7998;
    id v42 = v5;
    id v50 = v42;
    [v17 sortUsingComparator:v49];
    BOOL v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    uint64_t v19 = v43;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(v43 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v56 = v20;
      __int16 v57 = 2114;
      uint64_t v58 = (uint64_t)v17;
      _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Loading cached bags for keys '%{public}@'", buf, 0x16u);
    }

    unint64_t v21 = [v17 count];
    uint64_t v22 = 4;
    if (v21 < 4) {
      uint64_t v22 = v21;
    }
    int v23 = v17;
    if (v22)
    {
      for (unint64_t j = 0; j < v41; ++j)
      {
        id v25 = [v23 objectAtIndex:j];
        id v26 = [v48 stringByAppendingPathComponent:v25];
        id v27 = [*(id *)(v19 + 32) _loadPlistAtPath:v26];
        if (v27)
        {
          os_log_t v28 = [[ICURLBag alloc] _initWithPropertyListRepresentation:v27];
          if (v28)
          {
            v46 = [v25 stringByDeletingPathExtension];
            objc_msgSend(v27, "ic_stringValueForKey:", @"build_version");
            id v29 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v30 = +[ICDeviceInfo currentDeviceInfo];
            v31 = [v30 buildVersion];

            id v32 = v31;
            uint64_t v45 = v29;
            if (v29 == v32)
            {
            }
            else
            {
              char v33 = [v29 isEqual:v32];

              if ((v33 & 1) == 0)
              {
                __int16 v34 = [MEMORY[0x1E4F1C9C8] now];
                [v28 _setExpirationDate:v34];

                [*(id *)(v19 + 32) _persistBagToDisk:v28 withKey:v46];
              }
            }
            [*(id *)(*(void *)(v19 + 32) + 8) setObject:v28 forKey:v46];
            [v44 addObject:v26];
            uint64_t v36 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v37 = *(void *)(v19 + 32);
              [v28 expirationDate];
              v39 = v38 = v23;
              *(_DWORD *)buf = 138543874;
              uint64_t v56 = v37;
              __int16 v57 = 2114;
              uint64_t v58 = (uint64_t)v25;
              __int16 v59 = 2114;
              id v60 = v39;
              _os_log_impl(&dword_1A2D01000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ Loaded cached bag for key '%{public}@'. expiration=%{public}@", buf, 0x20u);

              int v23 = v38;
              uint64_t v19 = v43;
            }
          }
        }
        else
        {
          os_log_t v28 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            uint64_t v35 = *(void *)(v19 + 32);
            *(_DWORD *)buf = 138543618;
            uint64_t v56 = v35;
            __int16 v57 = 2114;
            uint64_t v58 = (uint64_t)v26;
            _os_log_impl(&dword_1A2D01000, v28, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load cache at path %{public}@", buf, 0x16u);
          }
        }

        unint64_t v40 = [v23 count];
        if (v40 >= 4) {
          unint64_t v41 = 4;
        }
        else {
          unint64_t v41 = v40;
        }
      }
    }
    [*(id *)(v19 + 32) _cleanBagCacheExcludingPaths:v44];
  }
  else
  {
    [*(id *)(a1 + 32) _loadMonoCache];
  }
}

- (id)_loadPlistAtPath:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v11 = 0;
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v4 options:0 error:&v11];
  id v6 = v11;
  if (v6)
  {
    uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = v4;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Could not load plist at path '%{public}@' error=%{public}@", buf, 0x20u);
    }
  }
  if (v5 && [v5 length])
  {
    uint64_t v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:0];
    id v9 = 0;
    if (_NSIsNSDictionary()) {
      id v9 = v8;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __49__ICURLBagProvider__cleanBagCacheExcludingPaths___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _cacheDirectoryPath];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obunint64_t j = [v3 enumeratorAtPath:v2];
  uint64_t v4 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v36;
    uint64_t v30 = *MEMORY[0x1E4F28310];
    *(void *)&long long v5 = 138543618;
    long long v29 = v5;
    v31 = v2;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v2, "stringByAppendingPathComponent:", v9, v29);
        id v34 = 0;
        id v11 = [v3 attributesOfItemAtPath:v10 error:&v34];
        id v12 = v34;
        if (v12)
        {
          id v13 = v12;
          __int16 v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            uint64_t v15 = *(void *)(v1 + 32);
            *(_DWORD *)buf = 138543874;
            uint64_t v40 = v15;
            __int16 v41 = 2114;
            id v42 = v10;
            __int16 v43 = 2114;
            v44 = v13;
            _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Error reading file attributes at path %{public}@. error=%{public}@", buf, 0x20u);
          }
        }
        else if ([*(id *)(v1 + 40) containsObject:v10])
        {
          id v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v16 = *(void *)(v1 + 32);
            *(_DWORD *)buf = v29;
            uint64_t v40 = v16;
            __int16 v41 = 2114;
            id v42 = v9;
            _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ Cleanup excluding path: %{public}@", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v17 = v1;
          uint64_t v18 = [v11 objectForKey:v30];
          uint64_t v19 = [MEMORY[0x1E4F1C9C8] now];
          [v19 timeIntervalSinceReferenceDate];
          double v21 = v20;
          [v18 timeIntervalSinceReferenceDate];
          double v23 = v21 - v22;

          if (v23 <= 2419200.0)
          {
            id v13 = 0;
          }
          else
          {
            id v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v25 = *(void *)(v17 + 32);
              *(_DWORD *)buf = v29;
              uint64_t v40 = v25;
              __int16 v41 = 2114;
              id v42 = v10;
              _os_log_impl(&dword_1A2D01000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ Removing stale cache at path: %{public}@", buf, 0x16u);
            }

            id v33 = 0;
            char v26 = [v3 removeItemAtPath:v10 error:&v33];
            id v13 = v33;
            if ((v26 & 1) == 0)
            {
              id v27 = os_log_create("com.apple.amp.iTunesCloud", "Default");
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                uint64_t v28 = *(void *)(v17 + 32);
                *(_DWORD *)buf = v29;
                uint64_t v40 = v28;
                __int16 v41 = 2114;
                id v42 = v10;
                _os_log_impl(&dword_1A2D01000, v27, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error removing file at path %{public}@", buf, 0x16u);
              }
            }
          }

          uint64_t v1 = v17;
          uint64_t v2 = v31;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v6);
  }
}

- (id)_cacheDirectoryPath
{
  uint64_t v2 = +[ICClientInfo defaultInfo];
  uint64_t v3 = [v2 processName];
  uint64_t v4 = (void *)v3;
  long long v5 = @"unknown";
  if (v3) {
    long long v5 = (__CFString *)v3;
  }
  uint64_t v6 = v5;

  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v8 = [v7 URLsForDirectory:14 inDomains:1];
  id v9 = [v8 lastObject];

  uint64_t v10 = [NSString stringWithFormat:@"com.apple.iTunesCloud/URLBags/%@", v6];

  id v11 = [v9 URLByAppendingPathComponent:v10];

  id v12 = [v11 path];

  return v12;
}

- (void)_cleanBagCacheExcludingPaths:(id)a3
{
  id v4 = a3;
  persistenceQueue = self->_persistenceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__ICURLBagProvider__cleanBagCacheExcludingPaths___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(persistenceQueue, v7);
}

uint64_t __37__ICURLBagProvider_sharedBagProvider__block_invoke()
{
  sharedBagProvider_sSharedBagProvider = objc_alloc_init(ICURLBagProvider);

  return MEMORY[0x1F41817F8]();
}

- (ICURLBagProvider)init
{
  v19.receiver = self;
  v19.super_class = (Class)ICURLBagProvider;
  uint64_t v2 = [(ICURLBagProvider *)&v19 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingOperationsForCacheKey = v2->_pendingOperationsForCacheKey;
    v2->_pendingOperationsForCacheKey = v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F77998]) initWithMaximumCapacity:4];
    cache = v2->_cache;
    v2->_cache = (MSVLRUDictionary *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.iTunesCloud.ICURLBagProvider.access", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v7;

    id v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.iTunesCloud.ICURLBagProvider.persistence", v9);
    persistenceQueue = v2->_persistenceQueue;
    v2->_persistenceQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.iTunesCloud.ICURLBagProvider.callback", MEMORY[0x1E4F14430]);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v12;

    v2->_useAMSBag = _os_feature_enabled_impl();
    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    bagChangeNotificationReceivedForRequestContext = v2->_bagChangeNotificationReceivedForRequestContext;
    v2->_bagChangeNotificationReceivedForRequestContext = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v2 selector:sel__handleUserIdentityStoreDidChangeNotification_ name:@"ICUserIdentityStoreDidChangeNotification" object:0];

    uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v2 selector:sel__handleAMSBagChangedNotification_ name:*MEMORY[0x1E4F4DA08] object:0];

    [(ICURLBagProvider *)v2 _loadCache];
  }
  return v2;
}

- (void)_loadCache
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__ICURLBagProvider__loadCache__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)_handleAMSBagChangedNotification:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__ICURLBagProvider__handleAMSBagChangedNotification___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

BOOL __30__ICURLBagProvider__loadCache__block_invoke_132(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  dispatch_queue_t v7 = [v5 objectForKeyedSubscript:a2];
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  [v7 timeIntervalSinceReferenceDate];
  double v10 = v9;
  [v8 timeIntervalSinceReferenceDate];
  BOOL v12 = v10 > v11;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagChangeNotificationReceivedForRequestContext, 0);
  objc_storeStrong((id *)&self->_cacheKeysScheduledForRefresh, 0);
  objc_storeStrong((id *)&self->_pendingOperationsForCacheKey, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_persistenceQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)setUseRawPayload:(BOOL)a3
{
  self->_useRawPayload = a3;
}

- (BOOL)useRawPayload
{
  return self->_useRawPayload;
}

- (void)setUseAMSBag:(BOOL)a3
{
  self->_useAMSBag = a3;
}

- (id)_knownMissingBagValuesDictionary
{
  if (_knownMissingBagValuesDictionary_sMissingKeysOnceToken != -1) {
    dispatch_once(&_knownMissingBagValuesDictionary_sMissingKeysOnceToken, &__block_literal_global_156);
  }
  uint64_t v2 = (void *)_knownMissingBagValuesDictionary_sKnownMissingBagValuesDictionary;

  return v2;
}

void __52__ICURLBagProvider__knownMissingBagValuesDictionary__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"podcasts-license-offline-stop";
  v2[1] = @"podcasts-license-offline-stop-nonce";
  v3[0] = @"https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/offline/stop";
  v3[1] = @"https://play.itunes.apple.com/WebObjects/MZPlay.woa/podcast/hls/license/offline/stop/nonce";
  v2[2] = @"cloud-assets-update";
  v3[2] = @"https://genius-3.itunes.apple.com/SGCourier/updateAssets/";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  uint64_t v1 = (void *)_knownMissingBagValuesDictionary_sKnownMissingBagValuesDictionary;
  _knownMissingBagValuesDictionary_sKnownMissingBagValuesDictionary = v0;
}

- (id)_dictionaryFromBagPayloadDictionaryAddingKnownMissingKeys:(id)a3 forProfileName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  objc_super v19 = &v18;
  uint64_t v20 = 0x3032000000;
  double v21 = __Block_byref_object_copy__5542;
  double v22 = __Block_byref_object_dispose__5543;
  id v23 = 0;
  id v8 = [(ICURLBagProvider *)self _knownMissingBagValuesDictionary];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__ICURLBagProvider__dictionaryFromBagPayloadDictionaryAddingKnownMissingKeys_forProfileName___block_invoke;
  v14[3] = &unk_1E5AC79E8;
  id v9 = v6;
  id v15 = v9;
  uint64_t v17 = &v18;
  id v10 = v8;
  id v16 = v10;
  [v10 enumerateKeysAndObjectsUsingBlock:v14];
  double v11 = (void *)v19[5];
  if (!v11) {
    double v11 = v9;
  }
  id v12 = v11;

  _Block_object_dispose(&v18, 8);

  return v12;
}

void __93__ICURLBagProvider__dictionaryFromBagPayloadDictionaryAddingKnownMissingKeys_forProfileName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];

  if (!v6)
  {
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v7)
    {
      id v8 = *(void **)(a1 + 32);
      if (v8)
      {
        id v9 = (void *)[v8 mutableCopy];
      }
      else
      {
        id v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      }
      id v10 = v9;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v9);

      id v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    [v7 setObject:v5 forKeyedSubscript:v11];
  }
}

- (id)_amsProcessInfoFromRequestContext:(id)a3
{
  uint64_t v3 = [a3 clientInfo];
  id v4 = [v3 bundleIdentifier];
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F4DDC8]);
    goto LABEL_5;
  }
  id v5 = (id)[objc_alloc(MEMORY[0x1E4F4DDC8]) initWithBundleIdentifier:v4];
  if (ICSystemApplicationTypeForBundleIdentifier(v4))
  {
LABEL_5:
    id v6 = [v3 clientIdentifier];
    [v5 setExecutableName:v6];

    id v7 = [v3 clientIdentifier];
    [v5 setLocalizedName:v7];

    id v8 = [v3 clientVersion];
    [v5 setClientVersion:v8];
  }
  id v9 = [v3 clientBundleIdentifier];
  id v10 = [v3 bundleIdentifier];
  char v11 = [v9 isEqualToString:v10];

  if ((v11 & 1) == 0)
  {
    id v12 = [v3 clientBundleIdentifier];
    [v5 setProxyAppBundleID:v12];
  }

  return v5;
}

- (id)_legacyCacheFilePath
{
  uint64_t v2 = +[ICClientInfo defaultInfo];
  uint64_t v3 = [v2 processName];

  id v4 = @"unknown";
  if (v3) {
    id v4 = v3;
  }
  id v5 = [NSString stringWithFormat:@"%@.plist", v4];
  id v6 = ICDefaultCacheDirectory();
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v6, @"URLBags", v5, 0);
  id v8 = [NSString pathWithComponents:v7];

  return v8;
}

- (void)_persistBagToDisk:(id)a3 withKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  persistenceQueue = self->_persistenceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__ICURLBagProvider__persistBagToDisk_withKey___block_invoke;
  block[3] = &unk_1E5ACD5C8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(persistenceQueue, block);
}

void __46__ICURLBagProvider__persistBagToDisk_withKey___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _propertyListRepresentation];
  uint64_t v3 = (void *)[v2 mutableCopy];

  id v4 = +[ICDeviceInfo currentDeviceInfo];
  id v5 = [v4 buildVersion];
  [v3 setObject:v5 forKey:@"build_version"];

  id v29 = 0;
  id v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:200 options:0 error:&v29];
  id v7 = v29;
  if (v6)
  {
    id v8 = [*(id *)(a1 + 40) _cacheDirectoryPath];
    id v9 = [[NSString alloc] initWithFormat:@"%@/%@.plist", v8, *(void *)(a1 + 48)];
    id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v10 fileExistsAtPath:v8])
    {
      char v11 = v7;
    }
    else
    {
      uint64_t v28 = v7;
      char v13 = [v10 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v28];
      char v11 = v28;

      if ((v13 & 1) == 0)
      {
        uint64_t v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_21;
        }
        uint64_t v24 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v31 = v24;
        __int16 v32 = 2114;
        id v33 = v8;
        __int16 v34 = 2114;
        long long v35 = v11;
        uint64_t v25 = "%{public}@ Encountered error creating cache directory at %{public}@. error=%{public}@";
        goto LABEL_20;
      }
    }
    if (([v10 fileExistsAtPath:v9] & 1) != 0
      || ([v10 createFileAtPath:v9 contents:v6 attributes:0] & 1) != 0)
    {
      id v27 = v11;
      char v14 = [v6 writeToFile:v9 options:1 error:&v27];
      id v15 = v27;

      id v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      uint64_t v17 = v16;
      if (v14)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          uint64_t v31 = v18;
          __int16 v32 = 2114;
          id v33 = v9;
          objc_super v19 = "%{public}@ Persisted cache at path %{public}@.";
          uint64_t v20 = v17;
          os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
          uint32_t v22 = 22;
LABEL_14:
          _os_log_impl(&dword_1A2D01000, v20, v21, v19, buf, v22);
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v31 = v23;
        __int16 v32 = 2114;
        id v33 = v9;
        __int16 v34 = 2114;
        long long v35 = v15;
        objc_super v19 = "%{public}@ Failed to write cache at path %{public}@ error=%{public}@";
        uint64_t v20 = v17;
        os_log_type_t v21 = OS_LOG_TYPE_ERROR;
        uint32_t v22 = 32;
        goto LABEL_14;
      }
      char v11 = v15;
LABEL_21:

      id v7 = v11;
      goto LABEL_22;
    }
    uint64_t v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    uint64_t v26 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v31 = v26;
    __int16 v32 = 2114;
    id v33 = v9;
    __int16 v34 = 2114;
    long long v35 = v11;
    uint64_t v25 = "%{public}@ Failed to create cache file at path %{public}@ error=%{public}@";
LABEL_20:
    _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_ERROR, v25, buf, 0x20u);
    goto LABEL_21;
  }
  id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v12;
    __int16 v32 = 2114;
    id v33 = v7;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to serialize bag data. err=%{public}@", buf, 0x16u);
  }
LABEL_22:
}

- (void)_loadMonoCache
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__ICURLBagProvider__loadMonoCache__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

void __34__ICURLBagProvider__loadMonoCache__block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _cacheDirectoryPath];
  uint64_t v3 = [v2 stringByAppendingPathExtension:@"plist"];

  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  if ((v5 & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 32) _legacyCacheFilePath];
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v8 = [v7 fileExistsAtPath:v6];

    if (v8)
    {
      id v9 = v6;

      uint64_t v3 = v9;
    }
  }
  id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v46 = v11;
    __int16 v47 = 2114;
    uint64_t v48 = (uint64_t)v3;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Loading bag cache from mono cache file '%{public}@'", buf, 0x16u);
  }

  id v44 = 0;
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v3 options:0 error:&v44];
  id v13 = v44;
  if (![v12 length])
  {
    char v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v46 = v15;
      __int16 v47 = 2114;
      uint64_t v48 = (uint64_t)v13;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load bag cache data. err=%{public}@", buf, 0x16u);
    }
  }
  if ([v12 length])
  {
    id v16 = [MEMORY[0x1E4F28F98] propertyListWithData:v12 options:0 format:0 error:0];
    if (!_NSIsNSDictionary())
    {
LABEL_25:

      goto LABEL_26;
    }
    uint64_t v17 = objc_msgSend(v16, "ic_stringValueForKey:", @"build_version");
    uint64_t v18 = +[ICDeviceInfo currentDeviceInfo];
    uint64_t v19 = [v18 buildVersion];

    uint64_t v20 = v17;
    v39 = (void *)v19;
    if (v17 == (void *)v19) {
      LODWORD(v17) = 0;
    }
    else {
      LODWORD(v17) = [v17 isEqual:v19] ^ 1;
    }
    os_log_type_t v21 = objc_msgSend(v16, "ic_dictionaryValueForKey:", @"cache_entries");
    uint32_t v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    uint64_t v40 = v21;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = (int)v17;
      uint64_t v17 = v13;
      uint64_t v23 = v20;
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v25 = [v21 count];
      uint64_t v26 = [v40 allKeys];
      *(_DWORD *)buf = 138544386;
      uint64_t v46 = v24;
      uint64_t v20 = v23;
      id v13 = v17;
      LOBYTE(v17) = v38;
      __int16 v47 = 2048;
      uint64_t v48 = v25;
      os_log_type_t v21 = v40;
      __int16 v49 = 2114;
      id v50 = v20;
      __int16 v51 = 1024;
      int v52 = v38;
      __int16 v53 = 2114;
      long long v54 = v26;
      _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Found %lu cached bags. cachedBuildVersion=%{public}@, shouldInvalidateCache=%{BOOL}u, keys=%{public}@", buf, 0x30u);
    }
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __34__ICURLBagProvider__loadMonoCache__block_invoke_137;
    v42[3] = &unk_1E5AC79C0;
    v42[4] = *(void *)(a1 + 32);
    char v43 = (char)v17;
    [v21 enumerateKeysAndObjectsUsingBlock:v42];
    id v27 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v41 = 0;
    int v28 = [v27 removeItemAtPath:v3 error:&v41];
    id v29 = v41;

    uint64_t v30 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    uint64_t v31 = v30;
    if (v28)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v32 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v46 = v32;
        __int16 v47 = 2114;
        uint64_t v48 = (uint64_t)v3;
        id v33 = "%{public}@ Removed mono cache at path %{public}@";
        __int16 v34 = v31;
        os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
        uint32_t v36 = 22;
LABEL_23:
        _os_log_impl(&dword_1A2D01000, v34, v35, v33, buf, v36);
      }
    }
    else if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v46 = v37;
      __int16 v47 = 2114;
      uint64_t v48 = (uint64_t)v3;
      __int16 v49 = 2114;
      id v50 = v29;
      id v33 = "%{public}@ Failed to remove monoCache at path: %{public}@. error=%{public}@";
      __int16 v34 = v31;
      os_log_type_t v35 = OS_LOG_TYPE_ERROR;
      uint32_t v36 = 32;
      goto LABEL_23;
    }

    goto LABEL_25;
  }
LABEL_26:
}

void __34__ICURLBagProvider__loadMonoCache__block_invoke_137(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (_NSIsNSString() && _NSIsNSDictionary())
  {
    id v7 = [[ICURLBag alloc] _initWithPropertyListRepresentation:v6];
    int v8 = v7;
    if (!v7)
    {
      id v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        int v21 = 138543618;
        uint64_t v22 = v19;
        __int16 v23 = 2114;
        id v24 = v5;
        _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create bag from cache for key '%{public}@'", (uint8_t *)&v21, 0x16u);
      }
      goto LABEL_15;
    }
    id v9 = [v7 expirationDate];
    id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v21 = 138543874;
      uint64_t v22 = v11;
      __int16 v23 = 2114;
      id v24 = v5;
      __int16 v25 = 2114;
      uint64_t v26 = v9;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Loaded cached bag for key '%{public}@'. expiration=%{public}@", (uint8_t *)&v21, 0x20u);
    }

    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v12 = [MEMORY[0x1E4F1C9C8] now];
      [v12 timeIntervalSinceReferenceDate];
      double v14 = v13;
      [v9 timeIntervalSinceReferenceDate];
      double v16 = v14 - v15;

      if (v16 > 604800.0)
      {
        uint64_t v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          int v21 = 138543618;
          uint64_t v22 = v18;
          __int16 v23 = 2114;
          id v24 = v5;
          _os_log_impl(&dword_1A2D01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping loading cached bag for key '%{public}@' because its too old", (uint8_t *)&v21, 0x16u);
        }

        goto LABEL_15;
      }
      uint64_t v20 = [MEMORY[0x1E4F1C9C8] now];
      [v8 _setExpirationDate:v20];
    }
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v8 forKey:v5];
    [*(id *)(a1 + 32) _persistBagToDisk:v8 withKey:v5];
LABEL_15:
  }
}

uint64_t __53__ICURLBagProvider__handleAMSBagChangedNotification___block_invoke_124(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 clientInfo];
  id v5 = [v4 bagProfile];
  if (([v5 isEqualToString:*(void *)(a1 + 32)] & 1) == 0)
  {

    goto LABEL_8;
  }
  id v6 = [v4 bagProfileVersion];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 40)];

  if (v7)
  {
    if (*(void *)(a1 + 48))
    {
      int v8 = [v3 identity];
      id v9 = [v3 identityStore];
      id v10 = [v9 DSIDForUserIdentity:v8 outError:0];

      objc_msgSend(*(id *)(a1 + 48), "ic_DSID");
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v10 != v11)
      {
        uint64_t v12 = v11;
        char v13 = [v10 isEqual:v11];

        if (v13) {
          goto LABEL_10;
        }
        goto LABEL_8;
      }
    }
LABEL_10:
    uint64_t v14 = 1;
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v14 = 0;
LABEL_11:

  return v14;
}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ user identity changed - invalidating bag cache", (uint8_t *)&v5, 0xCu);
  }

  [(ICURLBagProvider *)self invalidateCache];
}

- (void)_fetchBagForRequestContext:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v55 = a4;
  uint64_t v7 = +[ICDeviceInfo currentDeviceInfo];
  int v8 = [v6 clientInfo];
  int v52 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v6 clientInfo];
    *(_DWORD *)buf = 138543874;
    v74 = self;
    __int16 v75 = 2114;
    id v76 = v6;
    __int16 v77 = 2114;
    uint64_t v78 = (uint64_t)v10;
    _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing bag request for requestContext %{public}@. clientInfo=%{public}@", buf, 0x20u);
  }
  id v11 = [v8 bagProfile];
  if (!v11)
  {
    uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v74 = self;
      _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ No bag profile name provided - using default", buf, 0xCu);
    }

    id v11 = @"itunescloudd";
    char v13 = @"itunescloudd";
  }
  uint64_t v14 = [v8 bagProfileVersion];
  if (!v14)
  {
    double v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v74 = self;
      _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ No bag profile version provided - using default", buf, 0xCu);
    }

    uint64_t v14 = @"1";
    double v16 = @"1";
  }
  __int16 v53 = v8;
  uint64_t v17 = [v6 identityStore];
  uint64_t v18 = [v6 identity];
  id v72 = 0;
  uint64_t v19 = [v17 DSIDForUserIdentity:v18 outError:&v72];
  id v20 = v72;

  if (v20)
  {
    int v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = [v6 identity];
      *(_DWORD *)buf = 138543874;
      v74 = self;
      __int16 v75 = 2114;
      id v76 = v22;
      __int16 v77 = 2114;
      uint64_t v78 = (uint64_t)v20;
      _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load account DSID for identity %{public}@. err=%{public}@", buf, 0x20u);
    }
  }
  __int16 v51 = v19;
  long long v54 = v7;
  if (self->_useAMSBag)
  {
    if (v19)
    {
      __int16 v23 = +[ICMonitoredAccountStore sharedAccountStore];
      id v71 = v20;
      uint64_t v24 = [v23 storeAccountForDSID:v19 error:&v71];
      id v25 = v71;

      if (v25)
      {
        uint64_t v26 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = ICCreateLoggableValueForDSID(v19);
          *(_DWORD *)buf = 138543874;
          v74 = self;
          __int16 v75 = 2114;
          id v76 = v27;
          __int16 v77 = 2114;
          uint64_t v78 = (uint64_t)v25;
          _os_log_impl(&dword_1A2D01000, v26, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load account for DSID %{public}@. err=%{public}@", buf, 0x20u);
        }
      }
      uint64_t v28 = v24;
    }
    else
    {
      id v25 = v20;
      uint64_t v28 = 0;
    }
    uint64_t v45 = [(ICURLBagProvider *)self _amsProcessInfoFromRequestContext:v6];
    uint64_t v46 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v74 = self;
      __int16 v75 = 2114;
      id v76 = v6;
      __int16 v77 = 2114;
      uint64_t v78 = v28;
      _os_log_impl(&dword_1A2D01000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching AMS bag for context %{public}@ using account %{public}@.", buf, 0x20u);
    }

    id v50 = (void *)v45;
    if (v28)
    {
      __int16 v47 = (void *)v28;
      [MEMORY[0x1E4F4DBD8] bagForProfile:v11 profileVersion:v14 processInfo:v45 account:v28];
    }
    else
    {
      __int16 v47 = 0;
      [MEMORY[0x1E4F4DBD8] bagForProfile:v11 profileVersion:v14 processInfo:v45];
    uint64_t v48 = };
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke;
    v63[3] = &unk_1E5AC7920;
    v63[4] = self;
    id v42 = v55;
    id v70 = v55;
    id v64 = v48;
    v65 = v11;
    id v44 = v52;
    id v66 = v52;
    id v67 = v14;
    id v68 = v51;
    id v69 = v6;
    id v38 = v51;
    id v34 = v48;
    [v34 createSnapshotWithCompletion:v63];

    uint64_t v30 = v47;
  }
  else
  {
    id v29 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v74 = self;
      __int16 v75 = 2114;
      id v76 = v6;
      _os_log_impl(&dword_1A2D01000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ fetching legacy bag for context %{public}@", buf, 0x16u);
    }
    id v49 = v20;

    uint64_t v30 = [MEMORY[0x1E4F1CA60] dictionary];
    [v30 setObject:@"6" forKey:@"ix"];
    uint64_t v31 = [v7 currentLocale];
    if (v31) {
      [v30 setObject:v31 forKey:@"locale"];
    }
    id v50 = (void *)v31;
    uint64_t v32 = [v7 productVersion];
    id v33 = [v32 componentsSeparatedByString:@"."];
    id v34 = [v33 firstObject];

    if ([v34 length]) {
      [v30 setObject:v34 forKey:@"os"];
    }
    id v35 = objc_alloc(MEMORY[0x1E4F18D50]);
    uint32_t v36 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://init.itunes.apple.com/bag.xml"];
    uint64_t v37 = objc_msgSend(v36, "ic_URLByAppendingQueryParameters:", v30);
    id v38 = (id)[v35 initWithURL:v37];

    [v38 setCachePolicy:1];
    v39 = [[ICStoreURLRequest alloc] initWithURLRequest:v38 requestContext:v6];
    [(ICStoreURLRequest *)v39 setShouldRequireURLBag:0];
    [(ICStoreURLRequest *)v39 setAnisetteVersion:0];
    [(ICURLRequest *)v39 setPrioritize:1];
    [(ICStoreURLRequest *)v39 setShouldUseMescalSigning:0];
    uint64_t v40 = [NSString stringWithFormat:@"urlBag/%@/%@", v11, v14];
    [(ICURLRequest *)v39 enableLoadURLMetricsWithRequestName:v40];

    id v41 = +[ICURLSessionManager unlimitedHighPrioritySession];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_119;
    v56[3] = &unk_1E5AC92A8;
    v56[4] = self;
    id v42 = v55;
    id v62 = v55;
    __int16 v57 = v11;
    id v58 = v52;
    __int16 v59 = v14;
    id v60 = v51;
    id v61 = v6;
    id v43 = v51;
    [v41 enqueueDataRequest:v39 withCompletionHandler:v56];

    id v44 = v52;
    id v25 = v49;
  }
}

void __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v19;
      __int16 v43 = 2114;
      id v44 = v7;
      _os_log_impl(&dword_1A2D01000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch url bag. err=%{public}@", buf, 0x16u);
    }

    id v20 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_88;
    v38[3] = &unk_1E5ACD2F0;
    id v40 = *(id *)(a1 + 88);
    id v39 = v7;
    dispatch_async(v20, v38);

    id v10 = v40;
  }
  else
  {
    int v8 = [*(id *)(a1 + 40) _temporaryDictionary];
    id v37 = 0;
    id v9 = [v8 resultWithError:&v37];
    id v10 = v37;
    if (v10 || !v9)
    {
      int v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v22;
        __int16 v43 = 2114;
        id v44 = v10;
        _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load payload dictionary. err=%{public}@", buf, 0x16u);
      }

      __int16 v23 = *(NSObject **)(*(void *)(a1 + 32) + 16);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_92;
      v34[3] = &unk_1E5ACD2F0;
      uint64_t v14 = &v36;
      id v36 = *(id *)(a1 + 88);
      id v35 = v10;
      dispatch_async(v23, v34);
      uint64_t v17 = v35;
    }
    else
    {
      uint64_t v11 = *(void *)(a1 + 32);
      if (!*(unsigned char *)(v11 + 65))
      {
        uint64_t v12 = [(id)v11 _dictionaryFromBagPayloadDictionaryAddingKnownMissingKeys:v9 forProfileName:*(void *)(a1 + 48)];

        uint64_t v11 = *(void *)(a1 + 32);
        id v9 = (id)v12;
      }
      char v13 = *(NSObject **)(v11 + 16);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_2;
      block[3] = &unk_1E5AC7948;
      uint64_t v14 = (id *)v25;
      id v15 = *(id *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 32);
      v25[0] = v15;
      v25[1] = v16;
      id v9 = v9;
      id v26 = v9;
      id v27 = v5;
      id v28 = *(id *)(a1 + 56);
      id v29 = *(id *)(a1 + 48);
      id v30 = *(id *)(a1 + 64);
      id v31 = *(id *)(a1 + 72);
      id v32 = *(id *)(a1 + 80);
      id v33 = *(id *)(a1 + 88);
      dispatch_async(v13, block);

      uint64_t v17 = v26;
    }
  }
}

void __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 performanceMetrics];

  if (v7)
  {
    uint64_t v7 = [v5 aggregatedPerformanceMetrics];
  }
  if (v6)
  {
    int v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v9;
      __int16 v43 = 2114;
      id v44 = v6;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch legacy url bag. err=%{public}@", buf, 0x16u);
    }

    id v10 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_120;
    block[3] = &unk_1E5ACD250;
    id v40 = *(id *)(a1 + 80);
    id v38 = v7;
    id v39 = v6;
    dispatch_async(v10, block);

    id v11 = v40;
  }
  else
  {
    uint64_t v12 = [v5 parsedBodyDictionary];
    if (v12)
    {
      char v13 = (void *)v12;
      uint64_t v14 = *(void *)(a1 + 32);
      if (!*(unsigned char *)(v14 + 65))
      {
        uint64_t v15 = [(id)v14 _dictionaryFromBagPayloadDictionaryAddingKnownMissingKeys:v13 forProfileName:*(void *)(a1 + 40)];

        uint64_t v14 = *(void *)(a1 + 32);
        char v13 = (void *)v15;
      }
      uint64_t v16 = *(NSObject **)(v14 + 16);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_2_122;
      v23[3] = &unk_1E5AC7948;
      id v17 = v5;
      uint64_t v18 = *(void *)(a1 + 32);
      id v24 = v17;
      uint64_t v25 = v18;
      id v26 = v13;
      id v27 = *(id *)(a1 + 48);
      id v28 = *(id *)(a1 + 40);
      id v29 = *(id *)(a1 + 56);
      id v30 = *(id *)(a1 + 64);
      id v31 = *(id *)(a1 + 72);
      id v33 = *(id *)(a1 + 80);
      id v32 = v7;
      id v11 = v13;
      dispatch_async(v16, v23);
    }
    else
    {
      uint64_t v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        int v21 = [v5 parsedBody];
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v20;
        __int16 v43 = 2114;
        id v44 = v21;
        _os_log_impl(&dword_1A2D01000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Failed to parse the legacy bag response. body=%{public}@", buf, 0x16u);
      }
      uint64_t v22 = *(NSObject **)(*(void *)(a1 + 32) + 16);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_121;
      v34[3] = &unk_1E5ACD2F0;
      id v36 = *(id *)(a1 + 80);
      id v35 = v7;
      dispatch_async(v22, v34);

      id v11 = v36;
    }
  }
}

uint64_t __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_120(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], 0, a1[4], a1[5]);
}

void __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_121(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7102 userInfo:0];
  (*(void (**)(uint64_t, void, uint64_t, id))(v1 + 16))(v1, 0, v2, v3);
}

void __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_2_122(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) urlResponse];
  id v3 = objc_msgSend(v2, "ic_valueForHTTPHeaderField:", @"x-apple-jingle-correlation-key");
  id v4 = objc_msgSend(v2, "ic_valueForHTTPHeaderField:", @"X-Apple-Application-Site");
  id v5 = [*(id *)(a1 + 32) urlResponse];
  [v5 _calculatedExpiration];
  double v7 = v6;

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v9 = v8;
  double v10 = v8 + 600.0;
  if (v7 < v10) {
    double v7 = v10;
  }
  id v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v7];
  uint64_t v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    [v11 timeIntervalSince1970];
    *(_DWORD *)buf = 138543874;
    uint64_t v18 = v13;
    __int16 v19 = 2048;
    double v20 = v7 - v9;
    __int16 v21 = 2048;
    uint64_t v22 = (uint64_t)v14;
    _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ fetched new bag which expires in %fs (expiration date: %{time_t}zd).", buf, 0x20u);
  }

  id v15 = [[ICURLBag alloc] _initWithDictionary:*(void *)(a1 + 48) amsBag:0 requestDate:*(void *)(a1 + 56) expirationDate:v11 serverCorrelationKey:v3 serverEnvironment:v4 profileName:*(void *)(a1 + 64) profileVersion:*(void *)(a1 + 72) sourceAccountDSID:*(void *)(a1 + 80)];
  uint64_t v16 = [*(id *)(a1 + 40) _getCacheKeyForRequestContext:*(void *)(a1 + 88)];
  [*(id *)(*(void *)(a1 + 40) + 8) setObject:v15 forKey:v16];
  [*(id *)(a1 + 40) _persistBagToDisk:v15 withKey:v16];
  (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
}

void __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_88(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -7200, *(void *)(a1 + 32), @"Failed to fetch url bag");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

void __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_92(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:underlyingError:debugDescription:", @"ICError", -7200, *(void *)(a1 + 32), @"Failed to load payload dictionary");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

void __69__ICURLBagProvider__fetchBagForRequestContext_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) expirationDate];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  if (v2) {
    [v2 timeIntervalSinceReferenceDate];
  }
  else {
    double v5 = v3 + 7200.0;
  }
  if (v5 >= v4 + 600.0) {
    double v6 = v5;
  }
  else {
    double v6 = v4 + 600.0;
  }
  double v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v6];
  double v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 40);
    [v7 timeIntervalSince1970];
    uint64_t v11 = (uint64_t)v10;
    [v2 timeIntervalSince1970];
    *(_DWORD *)buf = 138544130;
    uint64_t v16 = v9;
    __int16 v17 = 2048;
    double v18 = v6 - v4;
    __int16 v19 = 2048;
    uint64_t v20 = v11;
    __int16 v21 = 2048;
    uint64_t v22 = (uint64_t)v12;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ fetched new bag which expires in %fs (expiration time: %{time_t}zd, adjusted from %{time_t}zd)", buf, 0x2Au);
  }

  id v13 = [[ICURLBag alloc] _initWithDictionary:*(void *)(a1 + 48) amsBag:*(void *)(a1 + 56) requestDate:*(void *)(a1 + 64) expirationDate:v7 serverCorrelationKey:0 serverEnvironment:0 profileName:*(void *)(a1 + 72) profileVersion:*(void *)(a1 + 80) sourceAccountDSID:*(void *)(a1 + 88)];
  double v14 = [*(id *)(a1 + 40) _getCacheKeyForRequestContext:*(void *)(a1 + 96)];
  [*(id *)(*(void *)(a1 + 40) + 8) setObject:v13 forKey:v14];
  [*(id *)(a1 + 40) _persistBagToDisk:v13 withKey:v14];
  (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
}

- (void)invalidateCache
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__ICURLBagProvider_invalidateCache__block_invoke;
  block[3] = &unk_1E5ACD750;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

void __35__ICURLBagProvider_invalidateCache__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A2D01000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalidating all entries in url bag cache by expiring them", (uint8_t *)&v5, 0xCu);
  }

  double v4 = [*(id *)(*(void *)(a1 + 32) + 8) allValues];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_68];
}

void __35__ICURLBagProvider_invalidateCache__block_invoke_65(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v4 = [v2 now];
  [v3 _setExpirationDate:v4];
}

void __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_53(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  id v3 = v2;
  if (!v2 || [v2 isExpired])
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting to refresh an expired URL bag", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(a1 + 32) getBagForRequestContext:*(void *)(a1 + 48) forceRefetch:1 withCompletionHandler:&__block_literal_global_57];
  }
}

void __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_59(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v27 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [*(id *)(a1[4] + 40) objectForKey:a1[5]];
  [*(id *)(a1[4] + 40) removeObjectForKey:a1[5]];
  double v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = a1[4];
    uint64_t v12 = [v9 count];
    uint64_t v13 = a1[6];
    *(_DWORD *)buf = 138543874;
    uint64_t v42 = v11;
    __int16 v43 = 2048;
    uint64_t v44 = v12;
    __int16 v45 = 2114;
    uint64_t v46 = v13;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Notifying %lu callers that we got the bag for context %{public}@", buf, 0x20u);
  }

  if ([v9 count])
  {
    unint64_t v14 = 0;
    do
    {
      id v15 = objc_msgSend(v9, "objectAtIndex:", v14, v27);
      uint64_t v16 = v15;
      if (v15)
      {
        __int16 v17 = *(NSObject **)(a1[4] + 32);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_60;
        block[3] = &unk_1E5ACD2A0;
        id v40 = v15;
        id v37 = v27;
        id v38 = v7;
        id v39 = v8;
        dispatch_async(v17, block);
      }
      ++v14;
    }
    while (v14 < [v9 count]);
  }
  if (!v8)
  {
    uint64_t v18 = a1[4];
    if (*(unsigned char *)(v18 + 64))
    {
      __int16 v19 = [*(id *)(v18 + 56) objectForKey:a1[6]];
      int v20 = [v19 BOOLValue];

      if (!v20) {
        goto LABEL_17;
      }
    }
    else
    {
      __int16 v21 = *(void **)(*(void *)(a1[7] + 8) + 40);
      if (v21 && ([v21 isEqual:v27] & 1) != 0) {
        goto LABEL_17;
      }
    }
    uint64_t v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = a1[4];
      uint64_t v24 = a1[6];
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v23;
      __int16 v43 = 2114;
      uint64_t v44 = v24;
      _os_log_impl(&dword_1A2D01000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Detected bag change for requestContext %{public}@ - posting notification", buf, 0x16u);
    }

    uint64_t v25 = a1[4];
    id v26 = *(NSObject **)(v25 + 32);
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    id v31 = __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_61;
    id v32 = &unk_1E5ACD5C8;
    uint64_t v33 = v25;
    id v34 = (id)a1[6];
    id v35 = v27;
    dispatch_async(v26, &v29);
  }
LABEL_17:
  objc_msgSend(*(id *)(a1[4] + 56), "removeObjectForKey:", a1[6], v27, v29, v30, v31, v32, v33);
}

void __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_63(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:-7002 userInfo:0];
    (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
  }
}

uint64_t __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_60(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __92__ICURLBagProvider_getBagAndURLMetricsForRequestContext_forceRefetch_withCompletionHandler___block_invoke_61(void *a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = a1[4];
  uint64_t v3 = a1[5];
  v7[0] = @"request_context";
  v7[1] = @"url_bag";
  uint64_t v5 = a1[6];
  v8[0] = v3;
  v8[1] = v5;
  int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v2 postNotificationName:@"ICURLBagProviderDidUpdateBagNotification" object:v4 userInfo:v6];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"ICUserIdentityStoreDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)ICURLBagProvider;
  [(ICURLBagProvider *)&v4 dealloc];
}

@end