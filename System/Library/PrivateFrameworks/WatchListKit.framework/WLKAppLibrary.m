@interface WLKAppLibrary
+ (id)defaultAppLibrary;
- (BOOL)isTVAppInstalled;
- (WLKAppLibrary)init;
- (id)_bundleIdentifiersfromProxies:(id)a3;
- (id)_nonConformingAppBundleIdentifiers;
- (id)_nonConformingAppProxies;
- (id)_refreshAppLibrary;
- (id)_subscriptionInfosForProxies:(id)a3;
- (id)allAppBundleIdentifiers;
- (id)allAppProxies;
- (id)allAppProxiesPerCategory;
- (id)dictionaryRepresentation;
- (id)installedAppBundleIdentifiers;
- (id)installedAppProxies;
- (id)localizedNameForBundle:(id)a3;
- (id)refresh;
- (id)subscribedAppBundleIdentifiers;
- (id)subscribedAppProxies;
- (id)subscriptionInfoForBundle:(id)a3;
- (id)testAppBundleIdentifiers;
- (id)testAppProxies;
- (void)_handleInvalidationWithReason:(id)a3;
- (void)_subscriptionsDidChangeNotification:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)beginIgnoringAppLibraryChanges;
- (void)dealloc;
- (void)endIgnoringAppLibraryChanges;
@end

@implementation WLKAppLibrary

+ (id)defaultAppLibrary
{
  if (defaultAppLibrary___once != -1) {
    dispatch_once(&defaultAppLibrary___once, &__block_literal_global_37);
  }
  v2 = (void *)defaultAppLibrary___defaultAppLibrary;

  return v2;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__WLKAppLibrary_dictionaryRepresentation__block_invoke;
  v5[3] = &unk_1E620B250;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__WLKAppLibrary_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = v2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[3];
  if (v5)
  {
    [v2 setObject:v5 forKeyedSubscript:@"Installed"];
    v4 = *(void **)(a1 + 32);
  }
  uint64_t v6 = v4[4];
  if (v6)
  {
    [v3 setObject:v6 forKeyedSubscript:@"Subscribed"];
    v7 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKeyedSubscript:", @"Subscribed", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v14 = [v13 subscriptionInfo];
          v15 = [v13 bundleIdentifier];
          [v7 setObject:v14 forKey:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    v16 = (void *)[v7 copy];
    [v3 setObject:v16 forKeyedSubscript:@"SubscriptionInfo"];

    v4 = *(void **)(a1 + 32);
  }
  uint64_t v17 = v4[5];
  if (v17)
  {
    [v3 setObject:v17 forKeyedSubscript:@"Test"];
    v4 = *(void **)(a1 + 32);
  }
  uint64_t v18 = v4[6];
  if (v18) {
    [v3 setObject:v18 forKeyedSubscript:@"NonConforming"];
  }
  uint64_t v19 = [v3 copy];
  uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
  v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;
}

void __40__WLKAppLibrary_allAppBundleIdentifiers__block_invoke(uint64_t a1)
{
}

void __35__WLKAppLibrary__refreshAppLibrary__block_invoke_29(void *a1)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(v2 + 40);
  if (v3) {
    v4 = (void *)[*(id *)(v2 + 40) copy];
  }
  else {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v4);
  if (v3) {

  }
  uint64_t v5 = a1[4];
  uint64_t v6 = *(void *)(v5 + 24);
  if (v6) {
    v7 = (void *)[*(id *)(v5 + 24) copy];
  }
  else {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v7);
  if (v6) {

  }
  uint64_t v8 = a1[4];
  uint64_t v9 = *(void *)(v8 + 32);
  if (v9) {
    uint64_t v10 = (void *)[*(id *)(v8 + 32) copy];
  }
  else {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v10);
  if (v9) {

  }
  uint64_t v11 = (id *)a1[4];
  v12 = [v11[1] objectForKeyedSubscript:@"Subscribed"];
  uint64_t v13 = [v11 _subscriptionInfosForProxies:v12];
  uint64_t v14 = *(void *)(a1[8] + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  objc_storeStrong((id *)(a1[4] + 8), *(id *)(*(void *)(a1[9] + 8) + 40));
  v16 = (id *)a1[4];
  uint64_t v17 = [v16[1] objectForKeyedSubscript:@"Test"];
  uint64_t v18 = [v16 _bundleIdentifiersfromProxies:v17];
  uint64_t v19 = a1[4];
  uint64_t v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

  uint64_t v21 = [*(id *)(a1[4] + 40) sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  uint64_t v22 = a1[4];
  long long v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;

  long long v24 = (id *)a1[4];
  long long v25 = [v24[1] objectForKeyedSubscript:@"Installed"];
  uint64_t v26 = [v24 _bundleIdentifiersfromProxies:v25];
  uint64_t v27 = a1[4];
  v28 = *(void **)(v27 + 24);
  *(void *)(v27 + 24) = v26;

  uint64_t v29 = [*(id *)(a1[4] + 24) sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  uint64_t v30 = a1[4];
  v31 = *(void **)(v30 + 24);
  *(void *)(v30 + 24) = v29;

  v32 = (id *)a1[4];
  v33 = [v32[1] objectForKeyedSubscript:@"Subscribed"];
  uint64_t v34 = [v32 _bundleIdentifiersfromProxies:v33];
  uint64_t v35 = a1[4];
  v36 = *(void **)(v35 + 32);
  *(void *)(v35 + 32) = v34;

  uint64_t v37 = [*(id *)(a1[4] + 32) sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  uint64_t v38 = a1[4];
  v39 = *(void **)(v38 + 32);
  *(void *)(v38 + 32) = v37;

  v40 = (id *)a1[4];
  v41 = [v40[1] objectForKeyedSubscript:@"NonConforming"];
  uint64_t v42 = [v40 _bundleIdentifiersfromProxies:v41];
  uint64_t v43 = a1[4];
  v44 = *(void **)(v43 + 48);
  *(void *)(v43 + 48) = v42;

  uint64_t v45 = [*(id *)(a1[4] + 48) sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  uint64_t v46 = a1[4];
  v47 = *(void **)(v46 + 48);
  *(void *)(v46 + 48) = v45;

  v48 = (id *)a1[4];
  v49 = [v48[1] objectForKeyedSubscript:@"Subscribed"];
  v50 = [v48 _subscriptionInfosForProxies:v49];

  v51 = [MEMORY[0x1E4F1CA80] set];
  [v51 addObjectsFromArray:*(void *)(a1[4] + 40)];
  [v51 addObjectsFromArray:*(void *)(a1[4] + 24)];
  [v51 addObjectsFromArray:*(void *)(a1[4] + 32)];
  uint64_t v52 = [v51 allObjects];
  uint64_t v53 = a1[4];
  v54 = *(void **)(v53 + 16);
  *(void *)(v53 + 16) = v52;

  v55 = *(void **)(*(void *)(a1[5] + 8) + 40);
  if (v55 || *(void *)(*(void *)(a1[6] + 8) + 40) || *(void *)(*(void *)(a1[7] + 8) + 40))
  {
    id v56 = *(id *)(a1[4] + 40);
    id v57 = v55;
    v58 = v57;
    if (v56 == v57)
    {
    }
    else
    {
      if (!v57 || !v56) {
        goto LABEL_42;
      }
      int v59 = [v56 isEqual:v57];

      if (!v59) {
        goto LABEL_43;
      }
    }
    v60 = *(void **)(*(void *)(a1[6] + 8) + 40);
    id v56 = *(id *)(a1[4] + 24);
    id v61 = v60;
    if (v56 == v61)
    {
    }
    else
    {
      v58 = v61;
      if (!v56 || !v61) {
        goto LABEL_42;
      }
      int v62 = [v56 isEqual:v61];

      if (!v62) {
        goto LABEL_43;
      }
    }
    v63 = *(void **)(*(void *)(a1[7] + 8) + 40);
    id v56 = *(id *)(a1[4] + 32);
    id v64 = v63;
    if (v56 == v64)
    {

LABEL_37:
      v66 = *(void **)(*(void *)(a1[8] + 8) + 40);
      id v56 = v50;
      id v67 = v66;
      if (v56 == v67)
      {

LABEL_56:
        goto LABEL_57;
      }
      v58 = v67;
      if (v56 && v67)
      {
        char v68 = [v56 isEqual:v67];

        if (v68) {
          goto LABEL_57;
        }
        goto LABEL_43;
      }
      goto LABEL_42;
    }
    v58 = v64;
    if (v56 && v64)
    {
      int v65 = [v56 isEqual:v64];

      if (!v65) {
        goto LABEL_43;
      }
      goto LABEL_37;
    }
LABEL_42:

LABEL_43:
    id v56 = [MEMORY[0x1E4F1CA60] dictionary];
    v69 = objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "wlk_arrayDifference:", *(void *)(a1[4] + 40));
    if ([v69 count]) {
      [v56 setObject:v69 forKeyedSubscript:@"TestChanges"];
    }
    v70 = objc_msgSend(*(id *)(*(void *)(a1[6] + 8) + 40), "wlk_arrayDifference:", *(void *)(a1[4] + 24));

    if ([v70 count]) {
      [v56 setObject:v70 forKeyedSubscript:@"InstalledChanges"];
    }
    v71 = objc_msgSend(*(id *)(*(void *)(a1[7] + 8) + 40), "wlk_arrayDifference:", *(void *)(a1[4] + 32));

    if ([v71 count])
    {
      [v56 setObject:v71 forKeyedSubscript:@"SubscribedChanges"];
      v72 = v71;
    }
    else
    {
      v72 = objc_msgSend(*(id *)(*(void *)(a1[8] + 8) + 40), "wlk_dictionaryDifference:", v50);

      if ([v72 count])
      {
        v73 = WLKSystemLogObject();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v83 = v72;
          _os_log_impl(&dword_1BA2E8000, v73, OS_LOG_TYPE_DEFAULT, "WLKAppLibrary - Subscription info did change: %@", buf, 0xCu);
        }

        v80 = @"SubscriptionInfoChanges";
        v81 = v72;
        v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
        [v56 setObject:v74 forKeyedSubscript:@"SubscribedChanges"];
      }
    }
    uint64_t v75 = [v56 copy];
    uint64_t v76 = *(void *)(a1[10] + 8);
    v77 = *(void **)(v76 + 40);
    *(void *)(v76 + 40) = v75;

    v78 = WLKSystemLogObject();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      v79 = *(void **)(*(void *)(a1[10] + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v83 = v79;
      _os_log_impl(&dword_1BA2E8000, v78, OS_LOG_TYPE_DEFAULT, "WLKAppLibrary - Library did change: %@", buf, 0xCu);
    }

    goto LABEL_56;
  }
LABEL_57:
}

- (id)_bundleIdentifiersfromProxies:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "bundleIdentifier", (void)v13);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = (void *)[v4 copy];

  return v11;
}

- (id)_subscriptionInfosForProxies:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__WLKAppLibrary__subscriptionInfosForProxies___block_invoke;
  v9[3] = &unk_1E620B6B0;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  uint64_t v7 = (void *)[v6 copy];

  return v7;
}

void __35__WLKAppLibrary__refreshAppLibrary__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_refreshAppLibrary
{
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__6;
  uint64_t v43 = __Block_byref_object_dispose__6;
  id v44 = 0;
  id v3 = (void *)MEMORY[0x1BA9E92A0](self, a2);
  id v4 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Library.Refresh", "", buf, 2u);
  }

  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  uint64_t v34 = buf;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__6;
  uint64_t v37 = __Block_byref_object_dispose__6;
  id v38 = 0;
  id v6 = +[WLKAppLibraryCore sharedInstance];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __35__WLKAppLibrary__refreshAppLibrary__block_invoke;
  v30[3] = &unk_1E620B6D8;
  v32 = buf;
  uint64_t v7 = v5;
  v31 = v7;
  [v6 fetchApplications:v30];

  if (WLKIsDaemon())
  {
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v8 = WLKStartupSignpostLogObject();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)long long v24 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Library.Refresh", "", v24, 2u);
    }

LABEL_13:
    *(void *)long long v24 = 0;
    long long v25 = v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__6;
    v28 = __Block_byref_object_dispose__6;
    id v29 = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__6;
    v22[4] = __Block_byref_object_dispose__6;
    id v23 = 0;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x3032000000;
    v20[3] = __Block_byref_object_copy__6;
    v20[4] = __Block_byref_object_dispose__6;
    id v21 = 0;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__6;
    v18[4] = __Block_byref_object_dispose__6;
    id v19 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__WLKAppLibrary__refreshAppLibrary__block_invoke_29;
    block[3] = &unk_1E620B700;
    block[4] = self;
    block[5] = v24;
    block[6] = v22;
    block[7] = v20;
    block[8] = v18;
    block[9] = buf;
    block[10] = &v39;
    dispatch_sync(accessQueue, block);
    _Block_object_dispose(v18, 8);

    _Block_object_dispose(v20, 8);
    _Block_object_dispose(v22, 8);

    _Block_object_dispose(v24, 8);
    int v13 = 1;
    goto LABEL_14;
  }
  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  intptr_t v10 = dispatch_semaphore_wait(v7, v9);
  uint64_t v11 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)long long v24 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Library.Refresh", "", v24, 2u);
  }

  if (!v10) {
    goto LABEL_13;
  }
  v12 = WLKSystemLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v24 = 0;
    _os_log_impl(&dword_1BA2E8000, v12, OS_LOG_TYPE_DEFAULT, "WLKAppLibrary - Timeout while waiting for list of apps.", v24, 2u);
  }

  int v13 = 0;
LABEL_14:

  _Block_object_dispose(buf, 8);
  if (v13) {
    id v15 = (id)v40[5];
  }
  else {
    id v15 = 0;
  }
  _Block_object_dispose(&v39, 8);

  return v15;
}

- (id)allAppBundleIdentifiers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_time_t v9 = __Block_byref_object_copy__6;
  intptr_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__WLKAppLibrary_allAppBundleIdentifiers__block_invoke;
  v5[3] = &unk_1E620AB18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __41__WLKAppLibrary_allAppProxiesPerCategory__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];

  return MEMORY[0x1F41817F8]();
}

void __34__WLKAppLibrary_defaultAppLibrary__block_invoke()
{
  v0 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Library.Init", "", buf, 2u);
  }

  v1 = objc_alloc_init(WLKAppLibrary);
  uint64_t v2 = (void *)defaultAppLibrary___defaultAppLibrary;
  defaultAppLibrary___defaultAppLibrary = (uint64_t)v1;

  id v3 = WLKStartupSignpostLogObject();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)id v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BA2E8000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Library.Init", "", v4, 2u);
  }
}

- (WLKAppLibrary)init
{
  v14.receiver = self;
  v14.super_class = (Class)WLKAppLibrary;
  uint64_t v2 = [(WLKAppLibrary *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("WLKAppLibraryQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("WLKAppLibraryRefreshQueue", 0);
    refreshQueue = v2->_refreshQueue;
    v2->_refreshQueue = (OS_dispatch_queue *)v5;

    if (WLKIsDaemon())
    {
      id v7 = [(WLKAppLibrary *)v2 refresh];
      uint64_t v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v8 addObserver:v2];
    }
    else
    {
      id v9 = [(WLKAppLibrary *)v2 _refreshAppLibrary];
    }
    intptr_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v2 selector:sel__subscriptionsDidChangeNotification_ name:@"VSActiveSubscriptionsDidChangeNotification" object:0];

    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __21__WLKAppLibrary_init__block_invoke;
    handler[3] = &unk_1E620AE50;
    int v13 = v2;
    notify_register_dispatch("com.apple.WatchListKit.WLKAppLibraryDidChangeNotification", &v2->_didChangeNotificationToken, MEMORY[0x1E4F14428], handler);
  }
  return v2;
}

- (id)allAppProxiesPerCategory
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__6;
  intptr_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__WLKAppLibrary_allAppProxiesPerCategory__block_invoke;
  v5[3] = &unk_1E620AB18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __21__WLKAppLibrary_init__block_invoke(uint64_t a1)
{
  uint64_t state64 = 0;
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 88), &state64);
  uint64_t result = getpid();
  if (state64 != (int)result) {
    return [*(id *)(a1 + 32) _handleInvalidationWithReason:@"WLKAppLibraryDidChange"];
  }
  return result;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 removeObserver:self];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  int didChangeNotificationToken = self->_didChangeNotificationToken;
  if (didChangeNotificationToken) {
    notify_cancel(didChangeNotificationToken);
  }
  v6.receiver = self;
  v6.super_class = (Class)WLKAppLibrary;
  [(WLKAppLibrary *)&v6 dealloc];
}

- (id)installedAppBundleIdentifiers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__6;
  intptr_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__WLKAppLibrary_installedAppBundleIdentifiers__block_invoke;
  v5[3] = &unk_1E620AB18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__WLKAppLibrary_installedAppBundleIdentifiers__block_invoke(uint64_t a1)
{
}

- (id)subscribedAppBundleIdentifiers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__6;
  intptr_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__WLKAppLibrary_subscribedAppBundleIdentifiers__block_invoke;
  v5[3] = &unk_1E620AB18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__WLKAppLibrary_subscribedAppBundleIdentifiers__block_invoke(uint64_t a1)
{
}

- (id)testAppBundleIdentifiers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__6;
  intptr_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__WLKAppLibrary_testAppBundleIdentifiers__block_invoke;
  v5[3] = &unk_1E620AB18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __41__WLKAppLibrary_testAppBundleIdentifiers__block_invoke(uint64_t a1)
{
}

- (id)installedAppProxies
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__6;
  intptr_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__WLKAppLibrary_installedAppProxies__block_invoke;
  v5[3] = &unk_1E620AB18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __36__WLKAppLibrary_installedAppProxies__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"Installed"];

  return MEMORY[0x1F41817F8]();
}

- (id)subscribedAppProxies
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__6;
  intptr_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__WLKAppLibrary_subscribedAppProxies__block_invoke;
  v5[3] = &unk_1E620AB18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __37__WLKAppLibrary_subscribedAppProxies__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"Subscribed"];

  return MEMORY[0x1F41817F8]();
}

- (id)testAppProxies
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__6;
  intptr_t v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__WLKAppLibrary_testAppProxies__block_invoke;
  v5[3] = &unk_1E620AB18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __31__WLKAppLibrary_testAppProxies__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"Test"];

  return MEMORY[0x1F41817F8]();
}

- (id)allAppProxies
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  intptr_t v10 = __Block_byref_object_copy__6;
  id v11 = __Block_byref_object_dispose__6;
  id v12 = [MEMORY[0x1E4F1CA80] set];
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__WLKAppLibrary_allAppProxies__block_invoke;
  v6[3] = &unk_1E620AB18;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(accessQueue, v6);
  id v4 = [(id)v8[5] allObjects];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __30__WLKAppLibrary_allAppProxies__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"Installed"];
  [v2 addObjectsFromArray:v3];

  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  dispatch_queue_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"Subscribed"];
  [v4 addObjectsFromArray:v5];

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v8 = [*(id *)(v6 + 8) objectForKeyedSubscript:@"Test"];
  [v7 addObjectsFromArray:v8];
}

- (id)subscriptionInfoForBundle:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6;
  long long v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__WLKAppLibrary_subscriptionInfoForBundle___block_invoke;
  block[3] = &unk_1E620B688;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __43__WLKAppLibrary_subscriptionInfoForBundle___block_invoke(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", @"Subscribed", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v8 = [v7 bundleIdentifier];
        int v9 = [v8 isEqualToString:a1[5]];

        if (v9)
        {
          uint64_t v10 = [v7 subscriptionInfo];
          uint64_t v11 = *(void *)(a1[6] + 8);
          uint64_t v12 = *(void **)(v11 + 40);
          *(void *)(v11 + 40) = v10;

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)localizedNameForBundle:(id)a3
{
  id v3 = a3;
  id v11 = 0;
  uint64_t v4 = [MEMORY[0x1E4F223F8] bundleRecordWithApplicationIdentifier:v3 error:&v11];
  id v5 = v11;
  if (v5)
  {

    id v10 = 0;
    uint64_t v6 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v3 allowPlaceholder:0 error:&v10];
    id v7 = v10;

    uint64_t v4 = (void *)v6;
  }
  id v8 = [v4 localizedName];

  return v8;
}

- (BOOL)isTVAppInstalled
{
  uint64_t v2 = [(WLKAppLibrary *)self installedAppBundleIdentifiers];
  id v3 = WLKTVAppBundleID();
  char v4 = [v2 containsObject:v3];

  return v4;
}

- (id)refresh
{
  id v3 = [[WLKTransactionScope alloc] initWithIdentifier:@"WLKAppLibrary.refresh"];
  char v4 = [(WLKAppLibrary *)self _refreshAppLibrary];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"WLKAppLibraryDidChangeNotification" object:v4];

    if (WLKShouldRunInProcess())
    {
      uint64_t v6 = WLKSystemLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_1BA2E8000, v6, OS_LOG_TYPE_DEFAULT, "WLKAppLibrary - posting cross process note", v10, 2u);
      }

      int didChangeNotificationToken = self->_didChangeNotificationToken;
      pid_t v8 = getpid();
      notify_set_state(didChangeNotificationToken, v8);
      notify_post("com.apple.WatchListKit.WLKAppLibraryDidChangeNotification");
    }
  }

  return v4;
}

void __46__WLKAppLibrary__subscriptionInfosForProxies___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 bundleIdentifier];
  char v4 = [v3 subscriptionInfo];

  if ([v5 length] && objc_msgSend(v4, "length")) {
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v5];
  }
}

- (id)_nonConformingAppBundleIdentifiers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__6;
  id v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__WLKAppLibrary__nonConformingAppBundleIdentifiers__block_invoke;
  v5[3] = &unk_1E620AB18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__WLKAppLibrary__nonConformingAppBundleIdentifiers__block_invoke(uint64_t a1)
{
}

- (id)_nonConformingAppProxies
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__6;
  id v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__WLKAppLibrary__nonConformingAppProxies__block_invoke;
  v5[3] = &unk_1E620AB18;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __41__WLKAppLibrary__nonConformingAppProxies__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"NonConforming"];

  return MEMORY[0x1F41817F8]();
}

- (void)beginIgnoringAppLibraryChanges
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__WLKAppLibrary_beginIgnoringAppLibraryChanges__block_invoke;
  block[3] = &unk_1E620A708;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

uint64_t __47__WLKAppLibrary_beginIgnoringAppLibraryChanges__block_invoke(uint64_t result)
{
  return result;
}

- (void)endIgnoringAppLibraryChanges
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__WLKAppLibrary_endIgnoringAppLibraryChanges__block_invoke;
  block[3] = &unk_1E620B250;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync(accessQueue, block);
  if (*((unsigned char *)v11 + 24))
  {
    char v4 = WLKSystemLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BA2E8000, v4, OS_LOG_TYPE_DEFAULT, "WLKAppLibrary - No longer ignoring app library. Refreshing...", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    refreshQueue = self->_refreshQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__WLKAppLibrary_endIgnoringAppLibraryChanges__block_invoke_26;
    v6[3] = &unk_1E620A550;
    objc_copyWeak(&v7, buf);
    dispatch_async(refreshQueue, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __45__WLKAppLibrary_endIgnoringAppLibraryChanges__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 80);
  BOOL v3 = v2 < 1;
  uint64_t v4 = v2 - 1;
  if (!v3)
  {
    *(void *)(v1 + ++*(void *)(*(void *)(result + 32) + 80) = v4;
    uint64_t v5 = *(void *)(result + 32);
    if (!*(void *)(v5 + 80))
    {
      if (*(unsigned char *)(v5 + 72))
      {
        *(unsigned char *)(v5 + 72) = 0;
        *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
      }
    }
  }
  return result;
}

void __45__WLKAppLibrary_endIgnoringAppLibraryChanges__block_invoke_26(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained refresh];
}

- (void)_handleInvalidationWithReason:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 1;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__WLKAppLibrary__handleInvalidationWithReason___block_invoke;
  block[3] = &unk_1E620B688;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  char v13 = &v14;
  dispatch_sync(accessQueue, block);
  if (*((unsigned char *)v15 + 24))
  {
    id v7 = WLKSystemLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKAppLibrary - Invalidating: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    refreshQueue = self->_refreshQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__WLKAppLibrary__handleInvalidationWithReason___block_invoke_34;
    v9[3] = &unk_1E620A550;
    objc_copyWeak(&v10, (id *)buf);
    dispatch_async(refreshQueue, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }

  _Block_object_dispose(&v14, 8);
}

void __47__WLKAppLibrary__handleInvalidationWithReason___block_invoke(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(uint64_t *)(a1[4] + 80) >= 1)
  {
    uint64_t v2 = WLKSystemLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = a1[5];
      uint64_t v4 = *(void *)(a1[4] + 80);
      int v5 = 138412546;
      uint64_t v6 = v3;
      __int16 v7 = 2048;
      uint64_t v8 = v4;
      _os_log_impl(&dword_1BA2E8000, v2, OS_LOG_TYPE_DEFAULT, "WLKAppLibrary - %@, but currently ignoring app library changes (%ld).", (uint8_t *)&v5, 0x16u);
    }

    *(unsigned char *)(a1[4] + 72) = 1;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

void __47__WLKAppLibrary__handleInvalidationWithReason___block_invoke_34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained refresh];
}

- (void)_subscriptionsDidChangeNotification:(id)a3
{
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  uint64_t v6 = v4;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "bundleIdentifier", (void)v15);
        id v11 = WLKTVAppBundleID();
        char v12 = [v10 isEqualToString:v11];

        if (v12)
        {

          uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v6 postNotificationName:@"WLKAppLibraryTVAppDidInstallNotification" object:self];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
    uint64_t v6 = v4;
  }
LABEL_11:

  char v13 = +[WLKAppLibraryCore sharedInstance];
  int v14 = [v13 containsAppOfInterest:v4];

  if (v14) {
    [(WLKAppLibrary *)self _handleInvalidationWithReason:@"App installed"];
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[WLKAppLibraryCore sharedInstance];
  int v6 = [v5 containsAppOfInterest:v4];

  if (v6)
  {
    [(WLKAppLibrary *)self _handleInvalidationWithReason:@"App uninstalled"];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_nonConformingAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_testAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_subscribedAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_installedAppBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_allAppBundleIdentifiers, 0);

  objc_storeStrong((id *)&self->_appProxies, 0);
}

@end