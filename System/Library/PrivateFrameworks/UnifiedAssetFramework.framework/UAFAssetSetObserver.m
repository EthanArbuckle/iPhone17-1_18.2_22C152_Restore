@interface UAFAssetSetObserver
+ (BOOL)sendUAFNotificationForAssetSet:(id)a3 forRoot:(BOOL)a4;
+ (id)getConcurrentQueue;
+ (id)getSerialQueue;
+ (id)notificationForAssetSet:(id)a3 forRoot:(BOOL)a4;
+ (int)listenForMAStartupNotification:(id)a3 updateHandler:(id)a4;
+ (int)listenForNotification:(id)a3 queue:(id)a4 updateHandler:(id)a5;
+ (int)listenForUAFNotificationsForAssetSet:(id)a3 forRoot:(BOOL)a4 queue:(id)a5 updateHandler:(id)a6;
- (BOOL)namespaceHasChanged:(id)a3;
- (NSDate)namespaceUpdateDate;
- (NSMutableArray)namespaceTokens;
- (NSMutableSet)namespacesToIgnore;
- (NSSet)namespaces;
- (NSString)assetSetName;
- (TRIClient)trial;
- (UAFAssetSetObserver)initWithAssetSet:(id)a3 configurationDirURLs:(id)a4 queue:(id)a5 updateHandler:(id)a6;
- (UAFAssetSetObserver)initWithAssetSet:(id)a3 queue:(id)a4 updateHandler:(id)a5;
- (id)updateHandler;
- (int)maStartupNotifyToken;
- (int)uafNotifyToken;
- (void)dealloc;
- (void)invalidate;
- (void)resetNamespacesToIgnore:(id)a3;
- (void)setAssetSetName:(id)a3;
- (void)setMaStartupNotifyToken:(int)a3;
- (void)setNamespaceTokens:(id)a3;
- (void)setNamespaceUpdateDate:(id)a3;
- (void)setNamespaces:(id)a3;
- (void)setNamespacesToIgnore:(id)a3;
- (void)setTrial:(id)a3;
- (void)setUafNotifyToken:(int)a3;
- (void)setUpdateHandler:(id)a3;
@end

@implementation UAFAssetSetObserver

+ (int)listenForMAStartupNotification:(id)a3 updateHandler:(id)a4
{
  v5 = (void *)MEMORY[0x263F55968];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 notifyRegistrationName:@"STARTUP_ACTIVATED" forAssetType:@"com.apple.MobileAsset.MAAutoAsset"];
  int v9 = +[UAFAssetSetObserver listenForNotification:v8 queue:v7 updateHandler:v6];

  return v9;
}

+ (int)listenForUAFNotificationsForAssetSet:(id)a3 forRoot:(BOOL)a4 queue:(id)a5 updateHandler:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = a5;
  v11 = +[UAFAssetSetObserver notificationForAssetSet:a3 forRoot:v7];
  LODWORD(a3) = +[UAFAssetSetObserver listenForNotification:v11 queue:v10 updateHandler:v9];

  return (int)a3;
}

+ (int)listenForNotification:(id)a3 queue:(id)a4 updateHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  int out_token = -1;
  id v9 = v7;
  id v10 = a4;
  v11 = (const char *)[v9 UTF8String];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __65__UAFAssetSetObserver_listenForNotification_queue_updateHandler___block_invoke;
  handler[3] = &unk_264CEB528;
  id v12 = v9;
  id v19 = v12;
  id v20 = v8;
  id v13 = v8;
  uint32_t v14 = notify_register_dispatch(v11, &out_token, v10, handler);

  if (v14)
  {
    v15 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "+[UAFAssetSetObserver listenForNotification:queue:updateHandler:]";
      __int16 v24 = 2112;
      id v25 = v12;
      __int16 v26 = 2048;
      uint64_t v27 = v14;
      _os_log_error_impl(&dword_23797A000, v15, OS_LOG_TYPE_ERROR, "%s notify_register_dispatch for %@ failed: %lu", buf, 0x20u);
    }
  }
  int v16 = out_token;

  return v16;
}

+ (id)notificationForAssetSet:(id)a3 forRoot:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [NSString stringWithFormat:@"%@.%@", @"com.apple.siri.uaf", a3];
  if (v4)
  {
    uint64_t v6 = [NSString stringWithFormat:@"%@.%@", v5, @"root"];

    v5 = (void *)v6;
  }

  return v5;
}

- (UAFAssetSetObserver)initWithAssetSet:(id)a3 configurationDirURLs:(id)a4 queue:(id)a5 updateHandler:(id)a6
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v59 = a3;
  id v58 = a4;
  id v60 = a5;
  id v56 = a6;
  v84.receiver = self;
  v84.super_class = (Class)UAFAssetSetObserver;
  v11 = [(UAFAssetSetObserver *)&v84 init];
  val = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetSetName, a3);
    v57 = +[UAFConfigurationManager defaultManager];
    if (v58)
    {
      id v12 = [[UAFConfigurationManager alloc] initWithURLs:v58];

      v57 = v12;
    }
    id v13 = (void *)MEMORY[0x237E26B30]();
    uint32_t v14 = [v57 getAssetSet:v59];
    v15 = v14;
    if (!v14)
    {
      v50 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v88 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]";
        __int16 v89 = 2114;
        id v90 = v59;
        _os_log_error_impl(&dword_23797A000, v50, OS_LOG_TYPE_ERROR, "%s Could not init asset set %{public}@ for observer", buf, 0x16u);
      }

      v49 = 0;
      goto LABEL_44;
    }
    int v16 = [v14 getTrialAssets:0];
    v17 = v16;
    if (!v16 || ![v16 count])
    {
      v18 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v88 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]";
        __int16 v89 = 2114;
        id v90 = v59;
        _os_log_impl(&dword_23797A000, v18, OS_LOG_TYPE_DEFAULT, "%s No trial assets for asset set %{public}@ for observer", buf, 0x16u);
      }
    }
    if (!v60)
    {
      id v60 = +[UAFAssetSetObserver getConcurrentQueue];
    }
    uint64_t v19 = MEMORY[0x237E26D50](v56);
    id updateHandler = val->_updateHandler;
    val->_id updateHandler = (id)v19;

    v21 = objc_opt_new();
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v22 = v17;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v80 objects:v86 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v81 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void *)(*((void *)&v80 + 1) + 8 * i);
          uint64_t v27 = [v22 objectForKeyedSubscript:v26];
          uint64_t v28 = [v27 objectForKeyedSubscript:@"TrialNamespace"];

          if (v28)
          {
            v29 = [v22 objectForKeyedSubscript:v26];
            v30 = [v29 objectForKeyedSubscript:@"TrialNamespace"];
            [v21 addObject:v30];
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v80 objects:v86 count:16];
      }
      while (v23);
    }

    objc_storeStrong((id *)&val->_namespaces, v21);
    uint64_t v31 = [MEMORY[0x263EFF910] distantPast];
    namespaceUpdateDate = val->_namespaceUpdateDate;
    val->_namespaceUpdateDate = (NSDate *)v31;

    uint64_t v33 = objc_opt_new();
    namespacesToIgnore = val->_namespacesToIgnore;
    val->_namespacesToIgnore = (NSMutableSet *)v33;

    uint64_t v35 = objc_opt_new();
    namespaceTokens = val->_namespaceTokens;
    val->_namespaceTokens = (NSMutableArray *)v35;

    objc_initWeak(&location, val);
    v75[0] = MEMORY[0x263EF8330];
    v75[1] = 3221225472;
    v75[2] = __81__UAFAssetSetObserver_initWithAssetSet_configurationDirURLs_queue_updateHandler___block_invoke;
    v75[3] = &unk_264CEB550;
    id v60 = v60;
    id v76 = v60;
    objc_copyWeak(&v78, &location);
    id v63 = v59;
    id v77 = v63;
    v64 = (void *)MEMORY[0x237E26D50](v75);
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    obuint64_t j = val->_namespaces;
    uint64_t v37 = [(NSSet *)obj countByEnumeratingWithState:&v71 objects:v85 count:16];
    if (v37)
    {
      uint64_t v62 = *(void *)v72;
      while (2)
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v72 != v62) {
            objc_enumerationMutation(obj);
          }
          id v39 = *(id *)(*((void *)&v71 + 1) + 8 * j);
          v66[0] = MEMORY[0x263EF8330];
          v66[1] = 3221225472;
          v66[2] = __81__UAFAssetSetObserver_initWithAssetSet_configurationDirURLs_queue_updateHandler___block_invoke_296;
          v66[3] = &unk_264CEB578;
          objc_copyWeak(&v70, &location);
          id v40 = v39;
          id v67 = v40;
          id v68 = v63;
          id v69 = v64;
          v41 = (void *)MEMORY[0x237E26D50](v66);
          v42 = (void *)MEMORY[0x263F80E50];
          v43 = +[UAFAssetSetObserver getSerialQueue];
          v44 = [v42 registerUpdateForNamespaceName:v40 queue:v43 usingBlock:v41];

          if (v44)
          {
            [(NSMutableArray *)val->_namespaceTokens addObject:v44];
          }
          else
          {
            v45 = UAFGetLogCategory((void **)&UAFLogContextClient);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v88 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]";
              __int16 v89 = 2114;
              id v90 = v40;
              _os_log_fault_impl(&dword_23797A000, v45, OS_LOG_TYPE_FAULT, "%s Error registering update handler for %{public}@", buf, 0x16u);
            }

            v46 = UAFGetLogCategory((void **)&UAFLogContextClient);
            UAFFaultCapture((uint64_t)v46, (uint64_t)kUAFABCNotifyRegisterFailure, @"trial", 0);
          }
          objc_destroyWeak(&v70);

          if (!v44)
          {

            goto LABEL_39;
          }
        }
        uint64_t v37 = [(NSSet *)obj countByEnumeratingWithState:&v71 objects:v85 count:16];
        if (v37) {
          continue;
        }
        break;
      }
    }

    int v47 = +[UAFAssetSetObserver listenForUAFNotificationsForAssetSet:v63 forRoot:0 queue:v60 updateHandler:v64];
    val->_uafNotifyToken = v47;
    if (v47 == -1)
    {
      v52 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v88 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]";
        __int16 v89 = 2114;
        id v90 = v63;
        _os_log_fault_impl(&dword_23797A000, v52, OS_LOG_TYPE_FAULT, "%s Error registering update handler for %{public}@", buf, 0x16u);
      }

      v53 = UAFGetLogCategory((void **)&UAFLogContextClient);
      UAFFaultCapture((uint64_t)v53, (uint64_t)kUAFABCNotifyRegisterFailure, @"dtma", 0);
    }
    else
    {
      int v48 = +[UAFAssetSetObserver listenForMAStartupNotification:v60 updateHandler:v64];
      val->_maStartupNotifyToken = v48;
      if (v48 != -1)
      {
        v49 = val;
LABEL_40:

        objc_destroyWeak(&v78);
        objc_destroyWeak(&location);

LABEL_44:
        goto LABEL_45;
      }
      v54 = UAFGetLogCategory((void **)&UAFLogContextClient);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v88 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]";
        __int16 v89 = 2114;
        id v90 = v63;
        _os_log_fault_impl(&dword_23797A000, v54, OS_LOG_TYPE_FAULT, "%s Error registering MA update handler for %{public}@", buf, 0x16u);
      }

      v55 = UAFGetLogCategory((void **)&UAFLogContextClient);
      UAFFaultCapture((uint64_t)v55, (uint64_t)kUAFABCNotifyRegisterFailure, @"maStartup", 0);
    }
LABEL_39:
    v49 = 0;
    goto LABEL_40;
  }
  v49 = 0;
LABEL_45:

  return v49;
}

+ (id)getConcurrentQueue
{
  if (_MergedGlobals_2 != -1) {
    dispatch_once(&_MergedGlobals_2, &__block_literal_global_4);
  }
  v2 = (void *)qword_26AF0B9A0;

  return v2;
}

- (UAFAssetSetObserver)initWithAssetSet:(id)a3 queue:(id)a4 updateHandler:(id)a5
{
  return [(UAFAssetSetObserver *)self initWithAssetSet:a3 configurationDirURLs:0 queue:a4 updateHandler:a5];
}

void __41__UAFAssetSetObserver_getConcurrentQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("UAFAssetSetObserver.Concurrent", MEMORY[0x263EF83A8]);
  v1 = (void *)qword_26AF0B9A0;
  qword_26AF0B9A0 = (uint64_t)v0;
}

+ (id)getSerialQueue
{
  if (qword_26AF0B9A8 != -1) {
    dispatch_once(&qword_26AF0B9A8, &__block_literal_global_277);
  }
  v2 = (void *)qword_26AF0B9B0;

  return v2;
}

void __37__UAFAssetSetObserver_getSerialQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("UAFAssetSetObserver.Serial", 0);
  v1 = (void *)qword_26AF0B9B0;
  qword_26AF0B9B0 = (uint64_t)v0;
}

+ (BOOL)sendUAFNotificationForAssetSet:(id)a3 forRoot:(BOOL)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v4 = +[UAFAssetSetObserver notificationForAssetSet:a3 forRoot:a4];
  v5 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    v11 = "+[UAFAssetSetObserver sendUAFNotificationForAssetSet:forRoot:]";
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_23797A000, v5, OS_LOG_TYPE_DEFAULT, "%s Sending notification %{public}@", (uint8_t *)&v10, 0x16u);
  }

  id v6 = v4;
  uint32_t v7 = notify_post((const char *)[v6 UTF8String]);
  if (v7)
  {
    id v8 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315650;
      v11 = "+[UAFAssetSetObserver sendUAFNotificationForAssetSet:forRoot:]";
      __int16 v12 = 2112;
      id v13 = v6;
      __int16 v14 = 2048;
      uint64_t v15 = v7;
      _os_log_error_impl(&dword_23797A000, v8, OS_LOG_TYPE_ERROR, "%s notify_post to %@ failed: %lu", (uint8_t *)&v10, 0x20u);
    }
  }
  return v7 == 0;
}

uint64_t __65__UAFAssetSetObserver_listenForNotification_queue_updateHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "+[UAFAssetSetObserver listenForNotification:queue:updateHandler:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl(&dword_23797A000, v2, OS_LOG_TYPE_DEFAULT, "%s notification \"%@\" received", (uint8_t *)&v5, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__UAFAssetSetObserver_initWithAssetSet_configurationDirURLs_queue_updateHandler___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __81__UAFAssetSetObserver_initWithAssetSet_configurationDirURLs_queue_updateHandler___block_invoke_2;
  v3[3] = &unk_264CEACE0;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __81__UAFAssetSetObserver_initWithAssetSet_configurationDirURLs_queue_updateHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = UAFGetLogCategory((void **)&UAFLogContextClient);
  uint64_t v4 = (uint64_t)v3;
  if (!WeakRetained)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 136315394;
      uint64_t v9 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]_block_invoke_2";
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_23797A000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "%s Self is nil while calling Update notification for %{public}@", (uint8_t *)&v8, 0x16u);
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 136315394;
    uint64_t v9 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]_block_invoke";
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    _os_log_impl(&dword_23797A000, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "%s Update notification for %{public}@", (uint8_t *)&v8, 0x16u);
  }

  id v6 = [WeakRetained updateHandler];

  if (v6)
  {
    uint64_t v4 = [WeakRetained updateHandler];
    (*(void (**)(void))(v4 + 16))();
LABEL_8:
  }
}

void __81__UAFAssetSetObserver_initWithAssetSet_configurationDirURLs_queue_updateHandler___block_invoke_296(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  char v3 = [WeakRetained namespaceHasChanged:*(void *)(a1 + 32)];

  uint64_t v4 = UAFGetLogCategory((void **)&UAFLogContextClient);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v10 = 136315650;
      uint64_t v11 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]_block_invoke";
      __int16 v12 = 2114;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s Issuing %{public}@ update notification due to %{public}@ update", (uint8_t *)&v10, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (v5)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 136315650;
      uint64_t v11 = "-[UAFAssetSetObserver initWithAssetSet:configurationDirURLs:queue:updateHandler:]_block_invoke";
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s Skipping %{public}@ update notification from %{public}@ due to no actual change", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)resetNamespacesToIgnore:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x263EFF9C0] setWithSet:self->_namespaces];
  namespacesToIgnore = self->_namespacesToIgnore;
  self->_namespacesToIgnore = v5;

  [(NSMutableSet *)self->_namespacesToIgnore removeObject:v4];
  uint64_t v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    assetSetName = self->_assetSetName;
    int v9 = 136315650;
    int v10 = "-[UAFAssetSetObserver resetNamespacesToIgnore:]";
    __int16 v11 = 2112;
    __int16 v12 = assetSetName;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s Possible beginning of sequence of notifications to ignore while observing asset set %@, starting with update to namespace %@", (uint8_t *)&v9, 0x20u);
  }
}

- (BOOL)namespaceHasChanged:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = self->_namespaceUpdateDate;
  uint64_t v6 = [MEMORY[0x263EFF910] now];
  namespaceUpdateDate = self->_namespaceUpdateDate;
  self->_namespaceUpdateDate = v6;

  [(NSDate *)self->_namespaceUpdateDate timeIntervalSinceDate:v5];
  if (v8 <= 5.0 && ([(NSMutableSet *)self->_namespacesToIgnore containsObject:v4] & 1) != 0)
  {
    [(NSMutableSet *)self->_namespacesToIgnore removeObject:v4];
    int v9 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      assetSetName = self->_assetSetName;
      int v13 = 136315650;
      id v14 = "-[UAFAssetSetObserver namespaceHasChanged:]";
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2112;
      v18 = assetSetName;
      _os_log_impl(&dword_23797A000, v9, OS_LOG_TYPE_DEFAULT, "%s Ignoring update to namespace %@ while observing asset set %@", (uint8_t *)&v13, 0x20u);
    }

    BOOL v11 = 0;
  }
  else
  {
    [(UAFAssetSetObserver *)self resetNamespacesToIgnore:v4];
    BOOL v11 = 1;
  }

  return v11;
}

- (void)invalidate
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  int uafNotifyToken = v2->_uafNotifyToken;
  if (uafNotifyToken)
  {
    notify_cancel(uafNotifyToken);
    v2->_int uafNotifyToken = 0;
  }
  int maStartupNotifyToken = v2->_maStartupNotifyToken;
  if (maStartupNotifyToken)
  {
    notify_cancel(maStartupNotifyToken);
    v2->_int maStartupNotifyToken = 0;
  }
  namespaceTokens = v2->_namespaceTokens;
  if (namespaceTokens)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = namespaceTokens;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(MEMORY[0x263F80E50], "deregisterUpdateWithToken:", *(void *)(*((void *)&v11 + 1) + 8 * v9++), (void)v11);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    int v10 = v2->_namespaceTokens;
    v2->_namespaceTokens = 0;
  }
  objc_sync_exit(v2);
}

- (void)dealloc
{
  [(UAFAssetSetObserver *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UAFAssetSetObserver;
  [(UAFAssetSetObserver *)&v3 dealloc];
}

- (NSString)assetSetName
{
  return self->_assetSetName;
}

- (void)setAssetSetName:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (TRIClient)trial
{
  return self->_trial;
}

- (void)setTrial:(id)a3
{
}

- (NSSet)namespaces
{
  return self->_namespaces;
}

- (void)setNamespaces:(id)a3
{
}

- (NSDate)namespaceUpdateDate
{
  return self->_namespaceUpdateDate;
}

- (void)setNamespaceUpdateDate:(id)a3
{
}

- (NSMutableSet)namespacesToIgnore
{
  return self->_namespacesToIgnore;
}

- (void)setNamespacesToIgnore:(id)a3
{
}

- (int)uafNotifyToken
{
  return self->_uafNotifyToken;
}

- (void)setUafNotifyToken:(int)a3
{
  self->_int uafNotifyToken = a3;
}

- (int)maStartupNotifyToken
{
  return self->_maStartupNotifyToken;
}

- (void)setMaStartupNotifyToken:(int)a3
{
  self->_int maStartupNotifyToken = a3;
}

- (NSMutableArray)namespaceTokens
{
  return self->_namespaceTokens;
}

- (void)setNamespaceTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceTokens, 0);
  objc_storeStrong((id *)&self->_namespacesToIgnore, 0);
  objc_storeStrong((id *)&self->_namespaceUpdateDate, 0);
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_trial, 0);
  objc_storeStrong(&self->_updateHandler, 0);

  objc_storeStrong((id *)&self->_assetSetName, 0);
}

@end