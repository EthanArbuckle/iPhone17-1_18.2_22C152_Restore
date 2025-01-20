@interface SSSpringBoardUtility
+ (BOOL)_getProcessID:(int *)a3 forApplicationIdentifier:(id)a4;
+ (BOOL)launchApplicationWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)_applicationStateMonitor;
+ (id)_dispatchQueue;
+ (id)_dispatchQueueNotifications;
+ (id)_dispatchQueueSpringBoard;
+ (id)_getApplicationInfoForIdentifier:(id)a3 key:(id)a4;
+ (id)_stateCache;
+ (void)_setApplicationState:(unsigned int)a3 forClientID:(id)a4;
+ (void)wakeAppUsingRequest:(id)a3;
@end

@implementation SSSpringBoardUtility

+ (BOOL)launchApplicationWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__17;
  v46 = __Block_byref_object_dispose__17;
  id v47 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v10 = SSVFrontBoardServicesFramework();
  v11 = objc_msgSend(SSVWeakLinkedClassForString(&cfstr_Fbssystemservi.isa, v10), "sharedService");
  uint64_t v36 = MEMORY[0x1E4F143A8];
  uint64_t v37 = 3221225472;
  v38 = __70__SSSpringBoardUtility_launchApplicationWithIdentifier_options_error___block_invoke;
  v39 = &unk_1E5BA8E70;
  v41 = &v42;
  v12 = v9;
  v40 = v12;
  [v11 openApplication:v7 options:v8 withResult:&v36];

  dispatch_time_t v13 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    v14 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v14)
    {
      v14 = +[SSLogConfig sharedConfig];
    }
    int v15 = [v14 shouldLog];
    int v16 = [v14 shouldLogToDisk];
    v17 = [v14 OSLogObject];
    v18 = v17;
    if (v16) {
      v15 |= 2u;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      v15 &= 2u;
    }
    if (v15)
    {
      v19 = objc_opt_class();
      int v48 = 138543618;
      v49 = v19;
      __int16 v50 = 2114;
      id v51 = v7;
      id v20 = v19;
      LODWORD(v35) = 22;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_12:

        goto LABEL_13;
      }
      v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v48, v35, v36, v37, v38, v39);
      free(v21);
      SSFileLog(v14, @"%@", v22, v23, v24, v25, v26, v27, (uint64_t)v18);
    }

    goto LABEL_12;
  }
LABEL_13:
  v28 = (void *)SSVFrontBoardServicesFramework();
  v29 = SSVWeakLinkedStringConstantForString("FBSOpenApplicationErrorDomain", v28);
  v30 = [(id)v43[5] domain];
  int v31 = [v30 isEqualToString:v29];

  v32 = (void *)v43[5];
  if (v31) {
    v32 = (void *)[v32 code];
  }
  BOOL v33 = v32 == 0;
  if (a5 && v32) {
    *a5 = (id) v43[5];
  }

  _Block_object_dispose(&v42, 8);
  return v33;
}

void __70__SSSpringBoardUtility_launchApplicationWithIdentifier_options_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)wakeAppUsingRequest:(id)a3
{
  id v4 = a3;
  v5 = [a1 _dispatchQueueSpringBoard];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SSSpringBoardUtility_wakeAppUsingRequest___block_invoke;
  v7[3] = &unk_1E5BA8DA8;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__SSSpringBoardUtility_wakeAppUsingRequest___block_invoke(uint64_t a1)
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  v2 = +[SSTransactionStore defaultStore];
  [v2 takeKeepAliveWithTransactionID:@"com.apple.storeservices.wakeAppTransactionIdentifier"];

  v3 = [*(id *)(a1 + 32) appIdentifier];
  if (![*(id *)(a1 + 32) shouldLaunchApp])
  {
LABEL_6:
    unsigned int v84 = 0;
    if ([*(id *)(a1 + 40) _getProcessID:&v84 forApplicationIdentifier:v3])
    {
      v14 = [*(id *)(a1 + 32) processAssertionIdentifier];
      [*(id *)(a1 + 32) processAssertionInterval];
      double v16 = v15;
      uint64_t v17 = [*(id *)(a1 + 32) processAssertionReason];
      v18 = (void *)v17;
      if (!v14 || !v17 || v16 <= 2.22044605e-16)
      {
        v60 = +[SSTransactionStore defaultStore];
        [v60 releaseKeepAliveWithTransactionID:@"com.apple.storeservices.wakeAppTransactionIdentifier"];
LABEL_66:

        goto LABEL_67;
      }
      v19 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v19)
      {
        v19 = +[SSLogConfig sharedConfig];
      }
      int v20 = [v19 shouldLog];
      if ([v19 shouldLogToDisk]) {
        int v21 = v20 | 2;
      }
      else {
        int v21 = v20;
      }
      uint64_t v22 = [v19 OSLogObject];
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
        v21 &= 2u;
      }
      if (v21)
      {
        uint64_t v23 = objc_opt_class();
        int v86 = 138544130;
        v87 = v23;
        __int16 v88 = 2114;
        v89 = v14;
        __int16 v90 = 2050;
        double v91 = v16;
        __int16 v92 = 2114;
        v93 = v18;
        id v24 = v23;
        LODWORD(v79) = 42;
        v78 = &v86;
        uint64_t v25 = (void *)_os_log_send_and_compose_impl();

        if (!v25) {
          goto LABEL_21;
        }
        uint64_t v22 = objc_msgSend(NSString, "stringWithCString:encoding:", v25, 4, &v86, v79);
        free(v25);
        SSFileLog(v19, @"%@", v26, v27, v28, v29, v30, v31, (uint64_t)v22);
      }

LABEL_21:
      if ([v18 isEqualToString:@"ProcessAssertionReasonBackgroundDownload"])
      {
        uint64_t v32 = 10;
      }
      else if ([v18 isEqualToString:@"ProcessAssertionReasonTaskCompletion"])
      {
        uint64_t v32 = 4;
      }
      else
      {
        uint64_t v32 = 0;
      }
      id v61 = objc_alloc(MEMORY[0x1E4F4E280]);
      v60 = (void *)[v61 initWithPID:v84 flags:1 reason:v32 name:v14];
      if ([v60 valid])
      {
        dispatch_time_t v62 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
        v63 = [*(id *)(a1 + 40) _dispatchQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __44__SSSpringBoardUtility_wakeAppUsingRequest___block_invoke_18;
        block[3] = &unk_1E5BA86D0;
        uint64_t v83 = *(void *)(a1 + 40);
        id v81 = v14;
        id v82 = v60;
        dispatch_after(v62, v63, block);

        v64 = v81;
LABEL_65:

        goto LABEL_66;
      }
      v65 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v65)
      {
        v65 = +[SSLogConfig sharedConfig];
      }
      int v66 = objc_msgSend(v65, "shouldLog", v78);
      if ([v65 shouldLogToDisk]) {
        int v67 = v66 | 2;
      }
      else {
        int v67 = v66;
      }
      v68 = [v65 OSLogObject];
      if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
        v67 &= 2u;
      }
      if (v67)
      {
        v69 = objc_opt_class();
        int v86 = 138543618;
        v87 = v69;
        __int16 v88 = 2114;
        v89 = v14;
        id v70 = v69;
        LODWORD(v79) = 22;
        v71 = (void *)_os_log_send_and_compose_impl();

        if (!v71)
        {
LABEL_64:

          v64 = +[SSTransactionStore defaultStore];
          [v64 releaseKeepAliveWithTransactionID:@"com.apple.storeservices.wakeAppTransactionIdentifier"];
          goto LABEL_65;
        }
        v68 = objc_msgSend(NSString, "stringWithCString:encoding:", v71, 4, &v86, v79);
        free(v71);
        SSFileLog(v65, @"%@", v72, v73, v74, v75, v76, v77, (uint64_t)v68);
      }

      goto LABEL_64;
    }
    BOOL v33 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v33)
    {
      BOOL v33 = +[SSLogConfig sharedConfig];
    }
    int v34 = [v33 shouldLog];
    if ([v33 shouldLogToDisk]) {
      int v35 = v34 | 2;
    }
    else {
      int v35 = v34;
    }
    uint64_t v36 = [v33 OSLogObject];
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      v35 &= 2u;
    }
    if (v35)
    {
      uint64_t v37 = objc_opt_class();
      int v86 = 138543618;
      v87 = v37;
      __int16 v88 = 2114;
      v89 = v3;
      id v38 = v37;
      LODWORD(v79) = 22;
      v39 = (void *)_os_log_send_and_compose_impl();

      if (!v39)
      {
LABEL_34:

        v14 = +[SSTransactionStore defaultStore];
        [v14 releaseKeepAliveWithTransactionID:@"com.apple.storeservices.wakeAppTransactionIdentifier"];
LABEL_67:

        goto LABEL_68;
      }
      uint64_t v36 = objc_msgSend(NSString, "stringWithCString:encoding:", v39, 4, &v86, v79);
      free(v39);
      SSFileLog(v33, @"%@", v40, v41, v42, v43, v44, v45, (uint64_t)v36);
    }

    goto LABEL_34;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v5 = (void *)SSVFrontBoardServicesFramework();
  id v6 = SSVWeakLinkedStringConstantForString("FBSOpenApplicationOptionKeyActivateSuspended", v5);
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v6];

  id v7 = [*(id *)(a1 + 32) launchOptions];
  if (v7)
  {
    id v8 = (void *)SSVFrontBoardServicesFramework();
    id v9 = SSVWeakLinkedStringConstantForString("FBSOpenApplicationOptionKeyPayloadOptions", v8);
    [v4 setObject:v7 forKeyedSubscript:v9];
  }
  uint64_t v10 = *(void **)(a1 + 40);
  id v85 = 0;
  char v11 = [v10 launchApplicationWithIdentifier:v3 options:v4 error:&v85];
  id v12 = v85;
  dispatch_time_t v13 = v12;
  if (v11)
  {

    goto LABEL_6;
  }
  v46 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v46)
  {
    v46 = +[SSLogConfig sharedConfig];
  }
  int v47 = [v46 shouldLog];
  if ([v46 shouldLogToDisk]) {
    int v48 = v47 | 2;
  }
  else {
    int v48 = v47;
  }
  v49 = [v46 OSLogObject];
  if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
    v48 &= 2u;
  }
  if (!v48) {
    goto LABEL_45;
  }
  __int16 v50 = objc_opt_class();
  int v86 = 138543874;
  v87 = v50;
  __int16 v88 = 2114;
  v89 = v3;
  __int16 v90 = 2114;
  double v91 = *(double *)&v13;
  id v51 = v50;
  LODWORD(v79) = 32;
  uint64_t v52 = (void *)_os_log_send_and_compose_impl();

  if (v52)
  {
    v49 = objc_msgSend(NSString, "stringWithCString:encoding:", v52, 4, &v86, v79);
    free(v52);
    SSFileLog(v46, @"%@", v53, v54, v55, v56, v57, v58, (uint64_t)v49);
LABEL_45:
  }
  v59 = +[SSTransactionStore defaultStore];
  [v59 releaseKeepAliveWithTransactionID:@"com.apple.storeservices.wakeAppTransactionIdentifier"];

LABEL_68:
}

void __44__SSSpringBoardUtility_wakeAppUsingRequest___block_invoke_18(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = +[SSLogConfig sharedDaemonConfig];
  if (!v2)
  {
    v2 = +[SSLogConfig sharedConfig];
  }
  int v3 = [v2 shouldLog];
  if ([v2 shouldLogToDisk]) {
    int v4 = v3 | 2;
  }
  else {
    int v4 = v3;
  }
  v5 = [v2 OSLogObject];
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
    v4 &= 2u;
  }
  if (!v4) {
    goto LABEL_11;
  }
  id v6 = objc_opt_class();
  uint64_t v7 = *(void *)(a1 + 32);
  *(_DWORD *)v18 = 138543618;
  *(void *)&v18[4] = v6;
  *(_WORD *)&v18[12] = 2112;
  *(void *)&v18[14] = v7;
  id v8 = v6;
  LODWORD(v17) = 22;
  id v9 = (void *)_os_log_send_and_compose_impl();

  if (v9)
  {
    v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, v18, v17, *(_OWORD *)v18, *(void *)&v18[16]);
    free(v9);
    SSFileLog(v2, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v5);
LABEL_11:
  }
  [*(id *)(a1 + 40) invalidate];
  double v16 = +[SSTransactionStore defaultStore];
  [v16 releaseKeepAliveWithTransactionID:@"com.apple.storeservices.wakeAppTransactionIdentifier"];
}

+ (id)_applicationStateMonitor
{
  int v3 = [a1 _dispatchQueueSpringBoard];
  dispatch_assert_queue_V2(v3);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SSSpringBoardUtility__applicationStateMonitor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (_applicationStateMonitor_onceToken != -1) {
    dispatch_once(&_applicationStateMonitor_onceToken, block);
  }
  int v4 = (void *)_applicationStateMonitor_sApplicationStateMonitor;
  return v4;
}

void __48__SSSpringBoardUtility__applicationStateMonitor__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4E278]);
  int v3 = (void *)_applicationStateMonitor_sApplicationStateMonitor;
  _applicationStateMonitor_sApplicationStateMonitor = (uint64_t)v2;

  objc_initWeak(&location, *(id *)(a1 + 32));
  int v4 = (void *)_applicationStateMonitor_sApplicationStateMonitor;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__SSSpringBoardUtility__applicationStateMonitor__block_invoke_2;
  v5[3] = &unk_1E5BA9558;
  objc_copyWeak(&v6, &location);
  [v4 setHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __48__SSSpringBoardUtility__applicationStateMonitor__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  int v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4E248]];
  uint64_t v5 = [v4 unsignedIntValue];
  id v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4E230]];

  [WeakRetained _setApplicationState:v5 forClientID:v6];
}

+ (id)_dispatchQueue
{
  if (_dispatchQueue_onceToken != -1) {
    dispatch_once(&_dispatchQueue_onceToken, &__block_literal_global_6);
  }
  id v2 = (void *)_dispatchQueue_sDispatchQueue;
  return v2;
}

void __38__SSSpringBoardUtility__dispatchQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.StoreServices.SSSpringBoardUtility", 0);
  v1 = (void *)_dispatchQueue_sDispatchQueue;
  _dispatchQueue_sDispatchQueue = (uint64_t)v0;
}

+ (id)_dispatchQueueNotifications
{
  if (_dispatchQueueNotifications_onceToken != -1) {
    dispatch_once(&_dispatchQueueNotifications_onceToken, &__block_literal_global_24);
  }
  id v2 = (void *)_dispatchQueueNotifications_sDispatchQueue;
  return v2;
}

void __51__SSSpringBoardUtility__dispatchQueueNotifications__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.StoreServices.SSSpringBoardUtility.Notifications", 0);
  v1 = (void *)_dispatchQueueNotifications_sDispatchQueue;
  _dispatchQueueNotifications_sDispatchQueue = (uint64_t)v0;
}

+ (id)_dispatchQueueSpringBoard
{
  if (_dispatchQueueSpringBoard_onceToken != -1) {
    dispatch_once(&_dispatchQueueSpringBoard_onceToken, &__block_literal_global_27);
  }
  id v2 = (void *)_dispatchQueueSpringBoard_sDispatchQueueSpringBoard;
  return v2;
}

void __49__SSSpringBoardUtility__dispatchQueueSpringBoard__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.StoreServices.SSSpringBoardUtility.SpringBoard", 0);
  v1 = (void *)_dispatchQueueSpringBoard_sDispatchQueueSpringBoard;
  _dispatchQueueSpringBoard_sDispatchQueueSpringBoard = (uint64_t)v0;
}

+ (id)_getApplicationInfoForIdentifier:(id)a3 key:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _dispatchQueueSpringBoard];
  dispatch_assert_queue_V2(v8);

  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__17;
  v39 = __Block_byref_object_dispose__17;
  id v40 = 0;
  id v9 = [a1 _applicationStateMonitor];
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __61__SSSpringBoardUtility__getApplicationInfoForIdentifier_key___block_invoke;
  v31[3] = &unk_1E5BA9580;
  int v34 = &v35;
  id v11 = v7;
  id v32 = v11;
  uint64_t v12 = v10;
  BOOL v33 = v12;
  [v9 applicationInfoForApplication:v6 completion:v31];
  dispatch_time_t v13 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    uint64_t v14 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v14)
    {
      uint64_t v14 = +[SSLogConfig sharedConfig];
    }
    int v15 = [v14 shouldLog];
    int v16 = [v14 shouldLogToDisk];
    uint64_t v17 = [v14 OSLogObject];
    v18 = v17;
    if (v16) {
      v15 |= 2u;
    }
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      v15 &= 2u;
    }
    if (v15)
    {
      uint64_t v19 = objc_opt_class();
      int v41 = 138412802;
      uint64_t v42 = v19;
      __int16 v43 = 2114;
      id v44 = v6;
      __int16 v45 = 2114;
      id v46 = v11;
      id v20 = v19;
      LODWORD(v30) = 32;
      int v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_12:

        goto LABEL_13;
      }
      v18 = objc_msgSend(NSString, "stringWithCString:encoding:", v21, 4, &v41, v30);
      free(v21);
      SSFileLog(v14, @"%@", v22, v23, v24, v25, v26, v27, (uint64_t)v18);
    }

    goto LABEL_12;
  }
LABEL_13:
  id v28 = (id)v36[5];

  _Block_object_dispose(&v35, 8);
  return v28;
}

void __61__SSSpringBoardUtility__getApplicationInfoForIdentifier_key___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v6 objectForKey:*(void *)(a1 + 32)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (BOOL)_getProcessID:(int *)a3 forApplicationIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _dispatchQueueSpringBoard];
  dispatch_assert_queue_V2(v7);

  id v8 = [a1 _getApplicationInfoForIdentifier:v6 key:*MEMORY[0x1E4F4E258]];

  char v9 = objc_opt_respondsToSelector();
  char v10 = v9;
  if (a3 && (v9 & 1) != 0) {
    *a3 = [v8 intValue];
  }

  return v10 & 1;
}

+ (void)_setApplicationState:(unsigned int)a3 forClientID:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _dispatchQueueSpringBoard];
  dispatch_assert_queue_V2(v7);

  id v8 = [a1 _dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SSSpringBoardUtility__setApplicationState_forClientID___block_invoke;
  block[3] = &unk_1E5BA95A8;
  unsigned int v13 = a3;
  id v11 = v6;
  id v12 = a1;
  id v9 = v6;
  dispatch_async(v8, block);
}

void __57__SSSpringBoardUtility__setApplicationState_forClientID___block_invoke(uint64_t a1)
{
  id v2 = (void *)[objc_alloc(NSNumber) initWithInteger:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = [*(id *)(a1 + 40) _stateCache];
  [v3 setObject:v2 forKey:*(void *)(a1 + 32)];

  uint64_t v4 = [*(id *)(a1 + 40) _dispatchQueueNotifications];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__SSSpringBoardUtility__setApplicationState_forClientID___block_invoke_2;
  block[3] = &unk_1E5BA86D0;
  id v7 = *(id *)(a1 + 32);
  id v8 = v2;
  uint64_t v9 = *(void *)(a1 + 40);
  id v5 = v2;
  dispatch_async(v4, block);
}

void __57__SSSpringBoardUtility__setApplicationState_forClientID___block_invoke_2(void *a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F4E248];
  v6[0] = *MEMORY[0x1E4F4E230];
  v6[1] = v2;
  uint64_t v3 = a1[5];
  v7[0] = a1[4];
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"SSSpringBoardUtilityApplicationStateChangeNotification" object:a1[6] userInfo:v4];
}

+ (id)_stateCache
{
  if (_stateCache_onceToken != -1) {
    dispatch_once(&_stateCache_onceToken, &__block_literal_global_33_0);
  }
  uint64_t v2 = (void *)_stateCache_sStateCache;
  return v2;
}

void __35__SSSpringBoardUtility__stateCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_stateCache_sStateCache;
  _stateCache_sStateCache = (uint64_t)v0;
}

@end