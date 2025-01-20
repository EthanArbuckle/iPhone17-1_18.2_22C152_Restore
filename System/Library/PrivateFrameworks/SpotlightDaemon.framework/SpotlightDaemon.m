uint64_t CSSearchAgentFieldNameCallback(uint64_t a1)
{
  return MEMORY[0x270EE85F0](a1, -1);
}

void delayedOpBlockCompleteCallback(void *a1, uint64_t a2)
{
  v4 = (void *)MEMORY[0x223C480D0]();
  v5 = (void (**)(void, void, void))a1[1];
  v5[2](v5, *a1, a2);
  free(a1);
}

void sub_21F1D0E80(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 256);
  _Unwind_Resume(a1);
}

void sub_21F1D36A0(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Block_object_dispose(&STACK[0x290], 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id _setup_block(void *a1, char a2, int a3)
{
  id v5 = a1;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = ___setup_block_block_invoke;
  v17[3] = &unk_264509068;
  id v18 = v5;
  int v19 = a3;
  id v6 = v5;
  v7 = (void *)MEMORY[0x223C48320](v17);
  qos_class_t v8 = qos_class_self();
  if (v8 > QOS_CLASS_BACKGROUND) {
    char v9 = a2;
  }
  else {
    char v9 = 0;
  }
  if ((v9 & 1) != 0 || v8 >= 0x1A) {
    dispatch_block_t v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v8, 0, v7);
  }
  else {
    dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v7);
  }
  v14 = v10;
  v15 = (void *)MEMORY[0x223C48320](v10, v11, v12, v13);

  return v15;
}

void ___setup_block_block_invoke(uint64_t a1)
{
  if (sShuttingDown == 1)
  {
    v2 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      ___setup_block_block_invoke_cold_1();
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x223C480D0]();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void SIBackgroundOpBlock(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = malloc_type_malloc(0x10uLL, 0xE0040E685C293uLL);
  id v6 = (void *)[v4 copy];

  id v7 = v6;
  *id v5 = a1;
  v5[1] = v7;
  _SIScheduleBackgroundOperation();
}

void _checkUnlock()
{
  if (!deviceUnlocked)
  {
    pthread_mutex_lock(&_checkUnlock_sLastTimeLock);
    double Current = CFAbsoluteTimeGetCurrent();
    if (*(double *)&_checkUnlock_sLastTime + 5.0 >= Current)
    {
      pthread_mutex_unlock(&_checkUnlock_sLastTimeLock);
    }
    else
    {
      _checkUnlock_sLastTime = *(void *)&Current;
      pthread_mutex_unlock(&_checkUnlock_sLastTimeLock);
      SIResumeForUnlock();
    }
  }
}

id logForCSLogCategoryIndex()
{
  if (logForCSLogCategoryIndex_onceToken != -1) {
    dispatch_once(&logForCSLogCategoryIndex_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)logForCSLogCategoryIndex_sIndexLog;
  return v0;
}

id SDTransactionCreate(void *a1)
{
  id v1 = a1;
  if ((unint64_t)[v1 count] > 1) {
    [v1 componentsJoinedByString:@"."];
  }
  else {
  v2 = [v1 firstObject];
  }

  if (v2)
  {
    v3 = (__CFString *)[[NSString alloc] initWithFormat:@"com.apple.spotlight.%@", v2];
  }
  else
  {
    v3 = @"com.apple.spotlight";
  }
  id v4 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    SDTransactionCreate_cold_1((uint64_t)v3, v4);
  }

  id v5 = v3;
  [(__CFString *)v5 UTF8String];
  id v6 = (void *)os_transaction_create();

  return v6;
}

id logForCSLogCategoryDefault()
{
  if (logForCSLogCategoryDefault_onceToken != -1) {
    dispatch_once(&logForCSLogCategoryDefault_onceToken, &__block_literal_global);
  }
  v0 = (void *)logForCSLogCategoryDefault_log;
  return v0;
}

void SDTransactionDone(void *a1)
{
  id v1 = a1;
  if (v1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    v2 = (void *)os_transaction_copy_description();
    if (v2)
    {
      v3 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        SDTransactionDone_cold_1((uint64_t)v2, v3);
      }
    }
    free(v2);
  }
}

void setClientStateForIndexing(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  v48[1] = *MEMORY[0x263EF8340];
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __setClientStateForIndexing_block_invoke;
  v40[3] = &unk_264508FA8;
  id v17 = v16;
  id v41 = v17;
  id v18 = v15;
  id v42 = v18;
  int v19 = (void (**)(void, void))MEMORY[0x223C48320](v40);
  if ([v12 length])
  {
    if (v13)
    {
      id v39 = v11;
      v20 = v14;
      id v21 = v11;
      id v22 = v12;
      id v36 = v13;
      id v23 = v13;
      v24 = v19;
      v38 = v20;
      id v25 = v20;
      v26 = [(id)objc_opt_class() _stateInfoAttributeNameWithClientStateName:v25];

      v46[0] = @"_kMDItemBundleID";
      v46[1] = @"_kMDItemExternalID";
      v47[0] = @"com.apple.searchd";
      v47[1] = v22;
      v37 = v22;
      v46[2] = v26;
      v47[2] = v23;
      v27 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:3];
      v48[0] = v27;
      v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:1];

      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = ___setClientStateInner_block_invoke;
      v43[3] = &unk_264508FA8;
      id v29 = v21;
      id v44 = v29;
      id v30 = v24;
      id v45 = v30;
      v31 = (const void *)[v43 copy];
      if (!SISetCSAttributes())
      {
        v35 = v26;
        if (v30)
        {
          v32 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
          (*((void (**)(id, void *))v30 + 2))(v30, v32);
        }
        CFRelease(v31);
        v26 = v35;
      }

      id v14 = v38;
      id v11 = v39;
      id v13 = v36;
    }
    else
    {
      v34 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        setClientStateForIndexing_cold_1();
      }

      if (v19) {
        v19[2](v19, 0);
      }
    }
  }
  else if (v19)
  {
    v33 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1 userInfo:0];
    ((void (**)(void, void *))v19)[2](v19, v33);
  }
}

void __setClientStateForIndexing_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  SDTransactionDone(*(void **)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void sub_21F1D5ECC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F1D6BBC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void *syncContextCreate(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = a2;
  id v5 = malloc_type_malloc(0x10uLL, 0xC0040D1025EB5uLL);
  *id v5 = v3;
  v5[1] = v4;
  dispatch_group_enter(v3);
  return v5;
}

void SISynchedOpWithBlockPropagatingPriority(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = malloc_type_malloc(0x10uLL, 0xE0040E685C293uLL);
  id v6 = (void *)[v4 copy];

  id v7 = v6;
  *id v5 = a1;
  v5[1] = v7;
  SISynchedOpPropagatingPriority();
}

void sub_21F1D72F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long a15, long long a16, uint64_t a17)
{
  *(_OWORD *)uint64_t v17 = a15;
  *(_OWORD *)(v17 + 16) = a16;
  *(void *)(v17 + 32) = a17;
  _Unwind_Resume(exception_object);
}

void sub_21F1D79EC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_21F1D7F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,long long a57,long long a58,uint64_t a59)
{
  objc_destroyWeak(v60);
  si_tracing_restore_current_span((uint64_t)&a51);
  long long v62 = a58;
  *(_OWORD *)uint64_t v59 = a57;
  *(_OWORD *)(v59 + 16) = v62;
  *(void *)(v59 + 32) = a59;
  _Unwind_Resume(a1);
}

void sub_21F1D8A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  si_tracing_restore_current_span((uint64_t)&a31);
  long long v34 = *(_OWORD *)(v32 - 192);
  *(_OWORD *)uint64_t v31 = *(_OWORD *)(v32 - 208);
  *(_OWORD *)(v31 + 16) = v34;
  *(void *)(v31 + 32) = *(void *)(v32 - 176);
  _Unwind_Resume(a1);
}

void sub_21F1D8B44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F1D8BDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F1D94E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F1D9C48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F1D9DA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F1DA2C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id logForCSLogCategoryQuery()
{
  if (logForCSLogCategoryQuery_onceToken != -1) {
    dispatch_once(&logForCSLogCategoryQuery_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)logForCSLogCategoryQuery_sQueryLog;
  return v0;
}

void wakeupTrigger(void *a1, int a2)
{
  uint64_t v3 = +[SPQueryResultsQueue findResultsQueueWithIdentifier:](SPQueryResultsQueue, "findResultsQueueWithIdentifier:");
  id v4 = v3;
  if (a2) {
    [v3 _stopTracking];
  }
  else {
    [v3 _processResults];
  }
}

void sub_21F1DA568(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t SDTraceAdd(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, double a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  if (SDTraceAdd_onceToken != -1) {
    dispatch_once(&SDTraceAdd_onceToken, &__block_literal_global_122);
  }
  if (a1 > 3) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = [sSDTraceTypes[a1] addLabel:v11 identifier:a3 duration:v12 string:v13 data:a6];
  }

  return v14;
}

void sub_21F1DAB3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F1DAFF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F1DB214(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F1DB3B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F1DC154(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL checkBooleanEntitlement(__SecTask *a1, const __CFString *a2)
{
  uint64_t v2 = (void *)SecTaskCopyValueForEntitlement(a1, a2, 0);
  BOOL v3 = v2 == (void *)*MEMORY[0x263EFFB40];

  return v3;
}

void sub_21F1DE880(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F1DEA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21F1DEDA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void __duet_log_activity_start_for_processes_block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  if (!atomic_load((unint64_t *)&sDASOutstanding))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v5 = *MEMORY[0x263F3B078];
    v6[0] = v2;
    BOOL v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
    id v4 = [MEMORY[0x263F3AFD8] sharedScheduler];
    [v4 activityStoppedWithParameters:v3];

    dispatch_suspend((dispatch_object_t)duet_log_activity_start_for_processes_timer);
    atomic_store(0, sDASStarted);
  }
}

void _indexCrossedWorkBoundary(void *a1, double a2)
{
  id v3 = a1;
  id v4 = v3;
  if (a2 > 1.0) {
    [v3 dirty:0];
  }
  if (a2 > 60.0)
  {
    uint64_t v5 = sIndexQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = ___indexCrossedWorkBoundary_block_invoke;
    v7[3] = &unk_2645063F8;
    id v8 = v4;
    id v6 = _setup_block(v7, 0, 3969);
    dispatch_async(v5, v6);
  }
}

void blockRoutine(const void *a1, int a2)
{
  uint64_t v5 = (void (**)(id, void *))MEMORY[0x223C48320]();
  if (v5)
  {
    if (a2)
    {
      id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F01C68] code:-1000 userInfo:0];
    }
    else
    {
      id v4 = 0;
    }
    v5[2](v5, v4);
  }
  if (a1) {
    CFRelease(a1);
  }
}

void __processItemsForImportInner_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained owner];
    id v7 = [v6 extensionDelegate];

    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v10 = *(unsigned __int8 *)(a1 + 73);
    unsigned int v17 = *(unsigned __int8 *)(a1 + 74);
    id v11 = [v5 indexQueue];
    char v12 = *(unsigned char *)(a1 + 75);
    double v13 = *(double *)(a1 + 64);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __processItemsForImportInner_block_invoke_3;
    v18[3] = &unk_264507638;
    id v19 = *(id *)(a1 + 40);
    id v20 = *(id *)(a1 + 48);
    LOBYTE(v16) = v12;
    [v5 completeIndexingItemFor:v8 delegate:v7 didBeginThrottle:v9 didEndThrottle:v10 error:v3 live:v17 queue:v13 slow:v11 startTime:v16 completionHandler:v18];
  }
  else
  {
    uint64_t v14 = *(NSObject **)(a1 + 40);
    if (v14) {
      dispatch_group_leave(v14);
    }
    id v15 = *(NSObject **)(a1 + 48);
    if (v15) {
      dispatch_group_leave(v15);
    }
  }
}

void __processItemsForImportInner_block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = *(NSObject **)(a1 + 32);
  if (v3) {
    dispatch_group_leave(v3);
  }
  id v4 = *(NSObject **)(a1 + 40);
  if (v4) {
    dispatch_group_leave(v4);
  }
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_21F1DFE48(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_21F1E07EC(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 192);
  si_tracing_restore_current_span(v1 - 144);
  _Unwind_Resume(a1);
}

void sub_21F1E135C(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 144);
  _Unwind_Resume(a1);
}

void sub_21F1E17E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  si_tracing_restore_current_span((uint64_t)&a31);
  si_tracing_restore_current_span(v31 - 176);
  _Unwind_Resume(a1);
}

void sub_21F1E2508(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_21F1E39F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F1E3DC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  si_tracing_restore_current_span(v26 - 144);
  _Unwind_Resume(a1);
}

void sub_21F1E4740(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_21F1E5518(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void duet_log_activity_start_for_processes(void *a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = v1;
  if (!atomic_fetch_add(&sDASOutstanding, 1uLL) && (atomic_exchange((atomic_uchar *volatile)sDASStarted, 1u) & 1) == 0)
  {
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    uint64_t v8 = __duet_log_activity_start_for_processes_block_invoke;
    uint64_t v9 = &unk_2645063F8;
    id v3 = v1;
    id v10 = v3;
    if (duet_log_activity_start_for_processes_onceToken != -1) {
      dispatch_once(&duet_log_activity_start_for_processes_onceToken, &v6);
    }
    dispatch_resume((dispatch_object_t)duet_log_activity_start_for_processes_timer);
    uint64_t v11 = *MEMORY[0x263F3B078];
    v12[0] = v3;
    id v4 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1, v6, v7, v8, v9);
    id v5 = [MEMORY[0x263F3AFD8] sharedScheduler];
    [v5 activityStartedWithParameters:v4];
  }
}

void duet_log_activity_start(int a1)
{
  if (a1 == 2) {
    duet_log_activity_start_for_processes(&unk_26D0C8BD8);
  }
  else {
    duet_log_activity_start_for_processes(&unk_26D0C8BF0);
  }
}

void duet_log_activity_stop()
{
}

intptr_t __processItemsForImport_block_invoke(uint64_t a1)
{
  if (sTurboMode)
  {
    int v3 = 0;
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F3AFE0] sharedInstance];
    int v3 = [v2 allowsDiscretionaryWorkForTask:@"indexing" withPriority:*MEMORY[0x263F3B050] withParameters:0] ^ 1;
  }
  if (gIsSystemOnBattery) {
    int v4 = 1;
  }
  else {
    int v4 = v3;
  }
  if (v4) {
    double v5 = 20.0;
  }
  else {
    double v5 = 0.5;
  }
  usleep((v5 * 1000000.0));
  char v6 = lastTimeOnPower_block_invoke_5_counter++;
  if ((v6 & 0xF) == 0)
  {
    uint64_t v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __processItemsForImport_block_invoke_cold_1(a1, v7, v5);
    }
  }
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void **)(a1 + 40);
  id v10 = *(void **)(a1 + 64);
  uint64_t v11 = *(void **)(a1 + 72);
  char v12 = *(void **)(a1 + 48);
  uint64_t v14 = *(void **)(a1 + 80);
  double v13 = *(void **)(a1 + 88);
  char v31 = *(unsigned char *)(a1 + 96);
  id v15 = *(id *)(a1 + 56);
  id v16 = v8;
  id v32 = v10;
  id v17 = v9;
  id v18 = v11;
  id v19 = v12;
  id v20 = v14;
  id v21 = v13;
  id v22 = v21;
  if (v21) {
    dispatch_group_enter(v21);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __processItemsForImportInner_block_invoke;
  v33[3] = &unk_264509108;
  id v34 = v19;
  id v35 = v15;
  id v36 = v22;
  id v37 = v20;
  id v38 = v18;
  id v39 = v16;
  char v41 = v31;
  id v40 = v17;
  id v23 = v19;
  id v24 = v15;
  id v25 = v22;
  id v26 = v20;
  id v27 = v18;
  id v28 = v16;
  id v29 = v17;
  [v32 indexRequestsPerformDataJob:v29 forBundle:v27 completionHandler:v33];

  return dispatch_group_wait(*(dispatch_group_t *)(a1 + 88), 0xFFFFFFFFFFFFFFFFLL);
}

void sub_21F1E67B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void syncFinished(uint64_t a1)
{
  dispatch_group_t v3 = *(dispatch_group_t *)a1;
  dispatch_group_leave(*(dispatch_group_t *)a1);
  uint64_t v2 = *(void **)(a1 + 8);
  SDTransactionDone(v2);
  free((void *)a1);
}

void sub_21F1E6DB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21F1E713C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21F1E7980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_21F1E7B00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21F1E7C48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void __processItemsForImportInner_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if ([(id)v6 code] == 4099)
  {
    uint64_t v7 = [(id)v6 domain];
    int v8 = [v7 isEqualToString:@"NSCocoaErrorDomain"];
  }
  else
  {
    int v8 = 0;
  }
  uint64_t v9 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [(id)v5 length];
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    *(void *)&buf[4] = v5;
    __int16 v29 = 2048;
    uint64_t v30 = v10;
    __int16 v31 = 1024;
    int v32 = v8;
    __int16 v33 = 2112;
    unint64_t v34 = v6;
    __int16 v35 = 2112;
    uint64_t v36 = v11;
    _os_log_impl(&dword_21F1CE000, v9, OS_LOG_TYPE_INFO, "==== CALLBACK data:%p length:%ld crash:%d error:%@ unique:%@", buf, 0x30u);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 128);
  if (v12)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __processItemsForImportInner_block_invoke_3325;
    v16[3] = &unk_2645090E0;
    objc_copyWeak(&v24, (id *)buf);
    id v17 = *(id *)(a1 + 64);
    id v18 = *(id *)(a1 + 32);
    BOOL v25 = (v5 | v6) == 0;
    char v26 = v8;
    id v19 = (id)v5;
    id v20 = *(id *)(a1 + 72);
    char v27 = *(unsigned char *)(a1 + 88);
    id v21 = *(id *)(a1 + 80);
    id v22 = *(id *)(a1 + 48);
    id v23 = *(id *)(a1 + 56);
    SIBackgroundOpBlock(v12, 9, v16);

    objc_destroyWeak(&v24);
  }
  else
  {
    double v13 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __processItemsForImportInner_block_invoke_cold_1();
    }

    uint64_t v14 = *(NSObject **)(a1 + 48);
    if (v14) {
      dispatch_group_leave(v14);
    }
    id v15 = *(NSObject **)(a1 + 56);
    if (v15) {
      dispatch_group_leave(v15);
    }
  }
  objc_destroyWeak((id *)buf);
}

void sub_21F1E7F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
}

void sub_21F1ED75C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void queryPowerState()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  CFTypeRef v0 = IOPSCopyPowerSourcesInfo();
  if (v0)
  {
    uint64_t v1 = v0;
    CFStringRef v2 = IOPSGetProvidingPowerSourceType(v0);
    int v3 = gIsSystemOnBattery;
    if (v2) {
      int v4 = CFEqual(v2, @"Battery Power") != 0;
    }
    else {
      int v4 = 0;
    }
    gIsSystemOnBattery = v4;
    if (v3 != v4)
    {
      unint64_t v5 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        unint64_t v6 = "on battery";
        if (v3) {
          uint64_t v7 = "on battery";
        }
        else {
          uint64_t v7 = "not on battery";
        }
        if (!gIsSystemOnBattery) {
          unint64_t v6 = "not on battery";
        }
        int v8 = 136315394;
        uint64_t v9 = v7;
        __int16 v10 = 2080;
        uint64_t v11 = v6;
        _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_INFO, "System power state change was %s is %s", (uint8_t *)&v8, 0x16u);
      }
    }
    CFRelease(v1);
  }
}

void sub_21F1EDB64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F1EDCB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void __duet_log_activity_start_for_processes_block_invoke(uint64_t a1)
{
  CFStringRef v2 = dispatch_get_global_queue(5, 0);
  dispatch_source_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v2);
  int v4 = (void *)duet_log_activity_start_for_processes_timer;
  duet_log_activity_start_for_processes_timer = (uint64_t)v3;

  unint64_t v5 = duet_log_activity_start_for_processes_timer;
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v5, v6, 0x2540BE400uLL, 0x2540BE400uLL);
  uint64_t v7 = duet_log_activity_start_for_processes_timer;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __duet_log_activity_start_for_processes_block_invoke_2;
  handler[3] = &unk_2645063F8;
  id v9 = *(id *)(a1 + 32);
  dispatch_source_set_event_handler(v7, handler);
  dispatch_suspend((dispatch_object_t)duet_log_activity_start_for_processes_timer);
  dispatch_activate((dispatch_object_t)duet_log_activity_start_for_processes_timer);
}

uint64_t __logForCSLogCategoryDefault_block_invoke()
{
  logForCSLogCategoryDefault_log = (uint64_t)os_log_create("com.apple.corespotlight", "default");
  return MEMORY[0x270F9A758]();
}

uint64_t __logForCSLogCategoryIndex_block_invoke()
{
  logForCSLogCategoryIndex_sIndexLog = (uint64_t)os_log_create("com.apple.corespotlight", "index");
  return MEMORY[0x270F9A758]();
}

uint64_t __logForCSLogCategoryQuery_block_invoke()
{
  logForCSLogCategoryQuery_sQueryLog = (uint64_t)os_log_create("com.apple.corespotlight", "query");
  return MEMORY[0x270F9A758]();
}

id logForCSLogCategoryRecs()
{
  if (logForCSLogCategoryRecs_onceToken != -1) {
    dispatch_once(&logForCSLogCategoryRecs_onceToken, &__block_literal_global_10);
  }
  CFTypeRef v0 = (void *)logForCSLogCategoryRecs_sRecsLog;
  return v0;
}

uint64_t __logForCSLogCategoryRecs_block_invoke()
{
  logForCSLogCategoryRecs_sRecsLog = (uint64_t)os_log_create("com.apple.corespotlight", "recs");
  return MEMORY[0x270F9A758]();
}

id logForCSLogCategoryUA()
{
  if (logForCSLogCategoryUA_onceToken != -1) {
    dispatch_once(&logForCSLogCategoryUA_onceToken, &__block_literal_global_13);
  }
  CFTypeRef v0 = (void *)logForCSLogCategoryUA_sUALog;
  return v0;
}

uint64_t __logForCSLogCategoryUA_block_invoke()
{
  logForCSLogCategoryUA_sUALog = (uint64_t)os_log_create("com.apple.corespotlight", "ua");
  return MEMORY[0x270F9A758]();
}

id logForCSLogCategoryPersonalization()
{
  if (logForCSLogCategoryPersonalization_onceToken != -1) {
    dispatch_once(&logForCSLogCategoryPersonalization_onceToken, &__block_literal_global_16);
  }
  CFTypeRef v0 = (void *)logForCSLogCategoryPersonalization_sPersonalizationLog;
  return v0;
}

uint64_t __logForCSLogCategoryPersonalization_block_invoke()
{
  logForCSLogCategoryPersonalization_sPersonalizationLog = (uint64_t)os_log_create("com.apple.corespotlight", "personalization");
  return MEMORY[0x270F9A758]();
}

id logForCSLogCategoryPhotosQU()
{
  if (logForCSLogCategoryPhotosQU_onceToken != -1) {
    dispatch_once(&logForCSLogCategoryPhotosQU_onceToken, &__block_literal_global_19);
  }
  CFTypeRef v0 = (void *)logForCSLogCategoryPhotosQU_queryUnderstandingLog;
  return v0;
}

uint64_t __logForCSLogCategoryPhotosQU_block_invoke()
{
  logForCSLogCategoryPhotosQU_queryUnderstandingLog = (uint64_t)os_log_create("com.apple.corespotlight", "PhotosQueryUnderstanding");
  return MEMORY[0x270F9A758]();
}

id logForCSLogCategoryDaemonClient()
{
  if (logForCSLogCategoryDaemonClient_onceToken != -1) {
    dispatch_once(&logForCSLogCategoryDaemonClient_onceToken, &__block_literal_global_22);
  }
  CFTypeRef v0 = (void *)logForCSLogCategoryDaemonClient_sDaemonClientLog;
  return v0;
}

uint64_t __logForCSLogCategoryDaemonClient_block_invoke()
{
  logForCSLogCategoryDaemonClient_sDaemonClientLog = (uint64_t)os_log_create("com.apple.corespotlight", "SpotlightDaemonClient");
  return MEMORY[0x270F9A758]();
}

id CSRedactString(void *a1, int a2)
{
  id v3 = a1;
  if (CSShouldRedactForPrivacy_onceToken != -1) {
    dispatch_once(&CSShouldRedactForPrivacy_onceToken, &__block_literal_global_31);
  }
  if (CSShouldRedactForPrivacy_shouldObfuscate && (unint64_t v4 = [v3 length], v4 > 4))
  {
    unint64_t v6 = v4;
    uint64_t v7 = NSString;
    uint64_t v8 = [v3 substringToIndex:3];
    id v9 = (void *)v8;
    if (a2)
    {
      __int16 v10 = [v3 substringFromIndex:v6 - 1];
      id v5 = [v7 stringWithFormat:@"%@...%@<%lu chars>", v9, v10, v6];
    }
    else
    {
      id v5 = [v7 stringWithFormat:@"%@...<%lu chars>", v8, v6];
    }
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

id CSRedactStringArray(void *a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (CSShouldRedactForPrivacy_onceToken != -1) {
    dispatch_once(&CSShouldRedactForPrivacy_onceToken, &__block_literal_global_31);
  }
  if (CSShouldRedactForPrivacy_shouldObfuscate)
  {
    unint64_t v4 = [MEMORY[0x263EFF980] array];
    if (v3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        id v5 = v3;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v15;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v15 != v8) {
                objc_enumerationMutation(v5);
              }
              __int16 v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
              if (v10)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v11 = CSRedactString(v10, a2);
                  objc_msgSend(v4, "addObject:", v11, (void)v14);
                }
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }
          while (v7);
        }
      }
    }
    objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v4, (void)v14);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = v3;
  }

  return v12;
}

void __CSShouldRedactForPrivacy_block_invoke()
{
  id v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  CSShouldRedactForPrivacy_shouldObfuscate = [v0 BOOLForKey:@"com.apple.corespotlight.log-sensitive-data"] ^ 1;
}

void sub_21F1EF4C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F1EFBC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F1EFC74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21F1EFCCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void startAgents(void *a1, int a2)
{
  id v10 = a1;
  id v3 = +[MDAgent sharedAgent];
  +[SpotlightSender setup];
  if (a2)
  {
    uint64_t v4 = [v10 searchServiceName];
    id v5 = +[CSSearchAgent searchAgent:0 serviceName:v4];

    [v5 setIndexer:v10];
    [v5 startListener];
  }
  uint64_t v6 = [v10 indexServiceName];
  uint64_t v7 = +[CSIndexAgent indexAgent:0 serviceName:v6];

  [v7 setIndexer:v10];
  [v7 startListener];
  uint64_t v8 = [v10 delegateServiceName];
  uint64_t v9 = +[CSIndexAgent indexDelegateAgent:v8];

  [v9 setIndexer:v10];
  [v9 startListener];
}

void startAllAgents(void *a1)
{
}

void startIndexAgent(void *a1)
{
}

void suspendAllAgents()
{
  id v0 = +[CSIndexAgent indexAgent];
  [v0 suspend];

  id v1 = +[CSSearchAgent searchAgent];
  [v1 suspend];
}

void resumeAllAgents()
{
  id v0 = +[CSIndexAgent indexAgent];
  [v0 resume];

  id v1 = +[CSSearchAgent searchAgent];
  [v1 resume];
}

void sub_21F1F0B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1)
{
  CFStringRef v2 = *(void **)(a1 + 32);
  return [v2 count];
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x26u);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t __SDTraceAdd_block_invoke()
{
  id v0 = [[SDTrace alloc] initWithTitle:@"SDQuery"];
  uint64_t v1 = (void *)qword_26AB4C088;
  qword_26AB4C088 = (uint64_t)v0;

  CFStringRef v2 = [[SDTrace alloc] initWithTitle:@"IndexQuery"];
  id v3 = (void *)qword_26AB4C090;
  qword_26AB4C090 = (uint64_t)v2;

  qword_26AB4C098 = [[SDTrace alloc] initWithTitle:@"Index"];
  return MEMORY[0x270F9A758]();
}

id SDTraceDescription(uint64_t a1)
{
  if (a1 > 3)
  {
    id v3 = 0;
  }
  else
  {
    if ([sSDTraceTypes[a1] current] == -1)
    {
      id v3 = 0;
    }
    else
    {
      id v3 = [sSDTraceTypes[a1] description];
    }
  }
  return v3;
}

uint64_t _getDeviceMigrationComplete()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v0 = [MEMORY[0x263F395B0] sharedInstance];
  char v1 = [v0 isDeviceUsingEphemeralStorage];

  if (v1) {
    return 1;
  }
  id v3 = [MEMORY[0x263F395B0] sharedInstance];
  uint64_t v4 = [v3 buildVersion];

  id v5 = [MEMORY[0x263F395B0] sharedInstance];
  uint64_t v6 = [v5 lastBuildVersionPref];

  uint64_t v2 = [MEMORY[0x263F395B0] isBuildVersion:v4 equalToBuildVersion:v6];
  uint64_t v7 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_21F1CE000, v7, OS_LOG_TYPE_DEFAULT, "[LOCK] MD current:%@ last: %@", (uint8_t *)&v9, 0x16u);
  }

  return v2;
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t BulkDeleteAttributes(uint64_t result, uint64_t *a2, uint64_t a3)
{
  if (a3 >= 1)
  {
    uint64_t v3 = a3;
    uint64_t v5 = result;
    do
    {
      uint64_t v6 = *a2++;
      result = MEMORY[0x223C47200](v5, v6);
      --v3;
    }
    while (v3);
  }
  return result;
}

void unpauseCallback(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 134217984;
    uint64_t v4 = a1;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_INFO, "Resume queue:%p", (uint8_t *)&v3, 0xCu);
  }

  [a1 resumeResults];
}

void sub_21F1F8FD8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F1FA400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F1FA7FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void unpauseIfSystemInGoodStateCallback(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 134217984;
    uint64_t v4 = a1;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_INFO, "Resume queue:%p", (uint8_t *)&v3, 0xCu);
  }

  [a1 resumeResultsIfSystemInGoodState];
}

void SISynchedOpWithBlock(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = malloc_type_malloc(0x10uLL, 0xE0040E685C293uLL);
  uint64_t v6 = (void *)[v4 copy];

  id v7 = v6;
  *uint64_t v5 = a1;
  v5[1] = v7;
  SISynchedOp();
}

void sub_21F1FB5B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F1FB9FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void relatedItemCallback(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  if (a2 && a3 && a4)
  {
    id v8 = a4;
    id v9 = a3;
    id v10 = a2;
    __int16 v11 = [[SPUAProgressItem alloc] initWithBundleID:v10 uaID:v8 relatedID:v9];

    [(SPUAProgressItem *)v11 update:a5];
  }
}

uint64_t copyBundleRemapCallback(uint64_t a1)
{
  uint64_t v2 = [(id)sIndexer fileProviderExtensionToAppBundleMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:a1];

  return v3;
}

void sub_21F1FC7D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F1FCB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F1FD6D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F1FDF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F1FE408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F1FE570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F1FE96C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F1FEECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v16 - 168));
  _Unwind_Resume(a1);
}

void sub_21F1FF354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 184), 8);
  _Unwind_Resume(a1);
}

void sub_21F1FFA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F2000C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  objc_destroyWeak(location);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v30 - 144), 8);
  objc_destroyWeak(&a30);
  _Unwind_Resume(a1);
}

void sub_21F2006DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose((const void *)(v42 - 160), 8);
  _Unwind_Resume(a1);
}

id indexOpenRecordPath()
{
  id v0 = NSString;
  uint64_t v1 = [(id)sDelegate indexDirectory];
  uint64_t v2 = [v0 stringWithFormat:@"%@/indexOpenRecord.plist", v1];

  return v2;
}

id newIndexOpensDict()
{
  id v0 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v1 = [NSNumber numberWithLong:-1];
  [v0 setObject:v1 forKeyedSubscript:@"pcA_lastOpen"];

  uint64_t v2 = [NSNumber numberWithLong:-1];
  [v0 setObject:v2 forKeyedSubscript:@"pcB_lastOpen"];

  uint64_t v3 = [NSNumber numberWithLong:-1];
  [v0 setObject:v3 forKeyedSubscript:@"pcC_lastOpen"];

  id v4 = [NSNumber numberWithLong:-1];
  [v0 setObject:v4 forKeyedSubscript:@"pcCX_lastOpen"];

  uint64_t v5 = [NSNumber numberWithLong:-1];
  [v0 setObject:v5 forKeyedSubscript:@"pcPriority_lastOpen"];

  uint64_t v6 = [NSNumber numberWithLong:-1];
  [v0 setObject:v6 forKeyedSubscript:@"pcA_lastAnalytics"];

  id v7 = [NSNumber numberWithLong:-1];
  [v0 setObject:v7 forKeyedSubscript:@"pcB_lastAnalytics"];

  id v8 = [NSNumber numberWithLong:-1];
  [v0 setObject:v8 forKeyedSubscript:@"pcC_lastAnalytics"];

  id v9 = [NSNumber numberWithLong:-1];
  [v0 setObject:v9 forKeyedSubscript:@"pcCX_lastAnalytics"];

  id v10 = [NSNumber numberWithLong:-1];
  [v0 setObject:v10 forKeyedSubscript:@"pcPriority_lastAnalytics"];

  return v0;
}

id indexHeartbeatPath()
{
  id v0 = NSString;
  uint64_t v1 = [(id)sDelegate indexDirectory];
  uint64_t v2 = [v0 stringWithFormat:@"%@/heartbeat.plist", v1];

  return v2;
}

id newHeartbeatDict()
{
  id v0 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v1 = [NSNumber numberWithLong:-1];
  [v0 setObject:v1 forKeyedSubscript:@"pcA_age"];

  uint64_t v2 = [NSNumber numberWithLong:-1];
  [v0 setObject:v2 forKeyedSubscript:@"pcB_age"];

  uint64_t v3 = [NSNumber numberWithLong:-1];
  [v0 setObject:v3 forKeyedSubscript:@"pcC_age"];

  id v4 = [NSNumber numberWithLong:-1];
  [v0 setObject:v4 forKeyedSubscript:@"pcCX_age"];

  uint64_t v5 = [NSNumber numberWithLong:-1];
  [v0 setObject:v5 forKeyedSubscript:@"pcPriority_age"];

  uint64_t v6 = [NSNumber numberWithLong:0];
  [v0 setObject:v6 forKeyedSubscript:@"pcA_wipes"];

  id v7 = [NSNumber numberWithLong:0];
  [v0 setObject:v7 forKeyedSubscript:@"pcB_wipes"];

  id v8 = [NSNumber numberWithLong:0];
  [v0 setObject:v8 forKeyedSubscript:@"pcC_wipes"];

  id v9 = [NSNumber numberWithLong:0];
  [v0 setObject:v9 forKeyedSubscript:@"pcCX_wipes"];

  id v10 = [NSNumber numberWithLong:0];
  [v0 setObject:v10 forKeyedSubscript:@"pcPriority_wipes"];

  __int16 v11 = [NSNumber numberWithLong:0];
  [v0 setObject:v11 forKeyedSubscript:@"pcA_wipes_aggregate"];

  id v12 = [NSNumber numberWithLong:0];
  [v0 setObject:v12 forKeyedSubscript:@"pcB_wipes_aggregate"];

  uint64_t v13 = [NSNumber numberWithLong:0];
  [v0 setObject:v13 forKeyedSubscript:@"pcC_wipes_aggregate"];

  long long v14 = [NSNumber numberWithLong:0];
  [v0 setObject:v14 forKeyedSubscript:@"pcCX_wipes_aggregate"];

  long long v15 = [NSNumber numberWithLong:0];
  [v0 setObject:v15 forKeyedSubscript:@"pcPriority_wipes_aggregate"];

  uint64_t v16 = [NSNumber numberWithLong:-1];
  [v0 setObject:v16 forKeyedSubscript:@"pcA_obj_count"];

  long long v17 = [NSNumber numberWithLong:-1];
  [v0 setObject:v17 forKeyedSubscript:@"pcB_obj_count"];

  id v18 = [NSNumber numberWithLong:-1];
  [v0 setObject:v18 forKeyedSubscript:@"pcC_obj_count"];

  uint64_t v19 = [NSNumber numberWithLong:-1];
  [v0 setObject:v19 forKeyedSubscript:@"pcCX_obj_count"];

  id v20 = [NSNumber numberWithLong:-1];
  [v0 setObject:v20 forKeyedSubscript:@"pcPriority_obj_count"];

  id v21 = [NSNumber numberWithBool:0];
  [v0 setObject:v21 forKeyedSubscript:@"rootsinstalled"];

  [v0 setObject:@"unknown" forKeyedSubscript:@"spotlightversion"];
  [v0 setObject:@"unknown" forKeyedSubscript:@"previousspotlightversion"];
  id v22 = [NSNumber numberWithBool:0];
  [v0 setObject:v22 forKeyedSubscript:@"vectorindexon"];

  id v23 = [NSNumber numberWithLong:-1];
  [v0 setObject:v23 forKeyedSubscript:@"timesinceboot"];

  id v24 = [NSNumber numberWithLong:-1];
  [v0 setObject:v24 forKeyedSubscript:@"timesinceupdate"];

  [v0 setObject:@"unknown" forKeyedSubscript:@"build"];
  [v0 setObject:@"unknown" forKeyedSubscript:@"previousbuild"];
  [v0 setObject:@"unknown" forKeyedSubscript:@"buildbeforeupgrade"];
  BOOL v25 = [NSNumber numberWithBool:0];
  [v0 setObject:v25 forKeyedSubscript:@"textsemanticsearchon"];

  char v26 = [NSNumber numberWithBool:0];
  [v0 setObject:v26 forKeyedSubscript:@"embeddingdonationon"];

  char v27 = [NSNumber numberWithUnsignedLongLong:0];
  [v0 setObject:v27 forKeyedSubscript:@"otaversion"];

  id v28 = NSNumber;
  __int16 v29 = [MEMORY[0x263EFF910] date];
  [v29 timeIntervalSince1970];
  __int16 v31 = [v28 numberWithLong:(uint64_t)v30];
  [v0 setObject:v31 forKeyedSubscript:@"heartbeat_age"];

  memset(&v39.st_birthtimespec, 0, 64);
  objc_msgSend((id)sDelegate, "indexDirectory", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  id v32 = objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = stat((const char *)[v32 UTF8String], &v39);

  int v33 = *__error();
  if (v29)
  {
    uint64_t v34 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      newHeartbeatDict_cold_1();
    }

    __darwin_time_t tv_sec = -1;
  }
  else
  {
    __darwin_time_t tv_sec = v39.st_birthtimespec.tv_sec;
  }
  *__error() = v33;
  uint64_t v36 = [NSNumber numberWithLong:tv_sec];
  [v0 setObject:v36 forKeyedSubscript:@"parentDirectory_age"];

  uint64_t v37 = [NSNumber numberWithLong:-1];
  [v0 setObject:v37 forKeyedSubscript:@"lastSent"];

  return v0;
}

uint64_t protectionClassForAnalytics(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x263F08080]])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F08088]])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F080A0]])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F08098]])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Priority"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v3 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      protectionClassForAnalytics_cold_1(v1, v3);
    }

    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *rebuildReasonString(int a1, char a2)
{
  if (a1) {
    uint64_t v2 = @"Intentional: marked purgeable";
  }
  else {
    uint64_t v2 = @"Error: not fully created";
  }
  if (a1 && (a2 & 1) == 0)
  {
    uint64_t v2 = [NSString stringWithUTF8String:SIGetRebuildReason()];
  }
  if (SIGetPreviousError())
  {
    uint64_t v3 = [[NSString alloc] initWithFormat:@"%@ / %s", v2, SIGetPreviousError()];

    uint64_t v2 = (__CFString *)v3;
  }
  return v2;
}

void sub_21F203FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F2042F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F20478C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F206018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t protectionClassIntValue(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x263F08080]])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F08088]])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F080A0]])
  {
    uint64_t v2 = 7;
  }
  else
  {
    uint64_t v2 = 3;
  }

  return v2;
}

void sub_21F207F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id *location, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a70, 8);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)&STACK[0x230]);
  _Unwind_Resume(a1);
}

uint64_t createResetTouchFileForUUID(void *a1, void *a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 alloc];
  id v7 = [(id)sDelegate indexDirectory];
  id v8 = (void *)[v6 initWithFormat:@"%@/TrialResets/%@/%@", v7, v5, v4];

  uint64_t v13 = *MEMORY[0x263F080A8];
  v14[0] = *MEMORY[0x263F08098];
  id v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  id v10 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v11 = [v10 createFileAtPath:v8 contents:0 attributes:v9];

  return v11;
}

void sub_21F209BD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_21F20A500(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F20B8CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose((const void *)(v35 - 128), 8);
  _Unwind_Resume(a1);
}

void processReverseInfo(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (a2 <= 510)
  {
    *(void *)(a1 + 8 * (511 - a2)) = [v11 integerValue];
    MEMORY[0x270FA5388]();
    long long v14 = (char *)&v32 - v13;
    bzero((char *)&v32 - v13, v15);
    unsigned char *v14 = 0;
    uint64_t v16 = v14;
    if ((a2 & 0x80000000) == 0)
    {
      uint64_t v17 = a2;
      uint64_t v16 = v14;
      do
      {
        uint64_t v18 = *(void *)(a1 + 8 * ~a2 + 4096 + 8 * v17);
        *uint64_t v16 = 47;
        uint64_t v19 = -1;
        uint64_t v20 = 1;
        uint64_t v21 = v18;
        do
        {
          uint64_t v22 = v20;
          unint64_t v23 = v21 + 9;
          v21 /= 10;
          ++v19;
          ++v20;
        }
        while (v23 > 0x12);
        do
        {
          v16[v22--] = v18 % 10 + 48;
          v18 /= 10;
        }
        while (v22 > 0);
        v16 += v19 + 2;
      }
      while (v17-- > 0);
    }
    *uint64_t v16 = 0;
    objc_msgSend(v9, "appendFormat:", @"%s\n", v14);
    BOOL v25 = [v10 objectForKeyedSubscript:v12];
    if (v25)
    {
      uint64_t v26 = (a2 + 1);
      [v10 setObject:0 forKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v33 = 0u;
        long long v32 = 0u;
        id v27 = v25;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v33;
          do
          {
            uint64_t v31 = 0;
            do
            {
              if (*(void *)v33 != v30) {
                objc_enumerationMutation(v27);
              }
              processReverseInfo(a1, v26, v9, v10, *(void *)(*((void *)&v32 + 1) + 8 * v31++));
            }
            while (v29 != v31);
            uint64_t v29 = [v27 countByEnumeratingWithState:&v32 objects:v36 count:16];
          }
          while (v29);
        }
      }
      else
      {
        processReverseInfo(a1, v26, v9, v10, v25);
      }
    }
  }
}

void sub_21F20E364(_Unwind_Exception *a1)
{
}

id SPLogDirectory()
{
  if (SPLogDirectory_onceToken != -1) {
    dispatch_once(&SPLogDirectory_onceToken, &__block_literal_global_3396);
  }
  id v0 = (void *)SPLogDirectory_sSPLogDirectory;
  return v0;
}

void sub_21F20FF2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F210110(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void processItemsForImport(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, char a7)
{
  id v13 = a1;
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  uint64_t v18 = a6;
  uint64_t v19 = v18;
  if (v18) {
    dispatch_group_enter(v18);
  }
  dispatch_group_t v20 = dispatch_group_create();
  uint64_t v21 = gImportQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __processItemsForImport_block_invoke;
  block[3] = &unk_264509090;
  id v30 = v14;
  id v31 = v16;
  id v32 = v17;
  id v33 = v13;
  id v34 = v15;
  long long v35 = @"com.apple.CoreSpotlight.ImportExtension";
  uint64_t v36 = v19;
  dispatch_group_t v37 = v20;
  char v38 = a7;
  uint64_t v22 = v20;
  unint64_t v23 = v19;
  id v24 = v15;
  id v25 = v13;
  id v26 = v17;
  id v27 = v16;
  id v28 = v14;
  dispatch_async(v21, block);
}

void sub_21F212F28(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose(&STACK[0x470], 8);
  _Block_object_dispose(&STACK[0x4A8], 8);
  _Block_object_dispose(&STACK[0x4C8], 8);
  _Unwind_Resume(a1);
}

void sub_21F215580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21F219884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F21A41C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  objc_destroyWeak(v31);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void si_dispatch_leave_routine(dispatch_group_t group)
{
  if (group) {
    dispatch_group_leave(group);
  }
}

void sub_21F21BF2C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_21F21D978(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_21F21DB60(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21F220918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_21F220B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F220C64(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

unsigned __int8 *uuidBytesToString(unsigned __int8 *result, unsigned char *a2)
{
  unsigned int v2 = *result;
  int v3 = (v2 >> 4) + 55;
  if (v2 < 0xA0) {
    LOBYTE(v3) = (*result >> 4) | 0x30;
  }
  *a2 = v3;
  unsigned int v4 = v2 & 0xF;
  char v5 = v2 & 0xF | 0x30;
  char v6 = (v2 & 0xF) + 55;
  if (v4 < 0xA) {
    char v6 = v5;
  }
  a2[1] = v6;
  unsigned int v7 = result[1];
  int v8 = (v7 >> 4) + 55;
  if (v7 < 0xA0) {
    LOBYTE(v_Block_object_dispose(&STACK[0x280], 8) = (result[1] >> 4) | 0x30;
  }
  a2[2] = v8;
  unsigned int v9 = v7 & 0xF;
  char v10 = v7 & 0xF | 0x30;
  char v11 = (v7 & 0xF) + 55;
  if (v9 < 0xA) {
    char v11 = v10;
  }
  a2[3] = v11;
  unsigned int v12 = result[2];
  int v13 = (v12 >> 4) + 55;
  if (v12 < 0xA0) {
    LOBYTE(v13) = (result[2] >> 4) | 0x30;
  }
  a2[4] = v13;
  unsigned int v14 = v12 & 0xF;
  char v15 = v12 & 0xF | 0x30;
  char v16 = (v12 & 0xF) + 55;
  if (v14 < 0xA) {
    char v16 = v15;
  }
  a2[5] = v16;
  unsigned int v17 = result[3];
  int v18 = (v17 >> 4) + 55;
  if (v17 < 0xA0) {
    LOBYTE(v1_Block_object_dispose(&STACK[0x280], 8) = (result[3] >> 4) | 0x30;
  }
  a2[6] = v18;
  unsigned int v19 = v17 & 0xF;
  char v20 = v17 & 0xF | 0x30;
  char v21 = (v17 & 0xF) + 55;
  if (v19 < 0xA) {
    char v21 = v20;
  }
  a2[7] = v21;
  a2[8] = 45;
  unsigned int v22 = result[4];
  int v23 = (v22 >> 4) + 55;
  if (v22 < 0xA0) {
    LOBYTE(v23) = (result[4] >> 4) | 0x30;
  }
  a2[9] = v23;
  unsigned int v24 = v22 & 0xF;
  char v25 = v22 & 0xF | 0x30;
  char v26 = (v22 & 0xF) + 55;
  if (v24 < 0xA) {
    char v26 = v25;
  }
  a2[10] = v26;
  unsigned int v27 = result[5];
  int v28 = (v27 >> 4) + 55;
  if (v27 < 0xA0) {
    LOBYTE(v2_Block_object_dispose(&STACK[0x280], 8) = (result[5] >> 4) | 0x30;
  }
  a2[11] = v28;
  unsigned int v29 = v27 & 0xF;
  char v30 = v27 & 0xF | 0x30;
  char v31 = (v27 & 0xF) + 55;
  if (v29 < 0xA) {
    char v31 = v30;
  }
  a2[12] = v31;
  a2[13] = 45;
  unsigned int v32 = result[6];
  int v33 = (v32 >> 4) + 55;
  if (v32 < 0xA0) {
    LOBYTE(v33) = (result[6] >> 4) | 0x30;
  }
  a2[14] = v33;
  unsigned int v34 = v32 & 0xF;
  char v35 = v32 & 0xF | 0x30;
  char v36 = (v32 & 0xF) + 55;
  if (v34 < 0xA) {
    char v36 = v35;
  }
  a2[15] = v36;
  unsigned int v37 = result[7];
  int v38 = (v37 >> 4) + 55;
  if (v37 < 0xA0) {
    LOBYTE(v3_Block_object_dispose(&STACK[0x280], 8) = (result[7] >> 4) | 0x30;
  }
  a2[16] = v38;
  unsigned int v39 = v37 & 0xF;
  char v40 = v37 & 0xF | 0x30;
  char v41 = (v37 & 0xF) + 55;
  if (v39 < 0xA) {
    char v41 = v40;
  }
  a2[17] = v41;
  a2[18] = 45;
  unsigned int v42 = result[8];
  int v43 = (v42 >> 4) + 55;
  if (v42 < 0xA0) {
    LOBYTE(v43) = (result[8] >> 4) | 0x30;
  }
  a2[19] = v43;
  unsigned int v44 = v42 & 0xF;
  char v45 = v42 & 0xF | 0x30;
  char v46 = (v42 & 0xF) + 55;
  if (v44 < 0xA) {
    char v46 = v45;
  }
  a2[20] = v46;
  unsigned int v47 = result[9];
  int v48 = (v47 >> 4) + 55;
  if (v47 < 0xA0) {
    LOBYTE(v4_Block_object_dispose(&STACK[0x280], 8) = (result[9] >> 4) | 0x30;
  }
  a2[21] = v48;
  unsigned int v49 = v47 & 0xF;
  char v50 = v47 & 0xF | 0x30;
  char v51 = (v47 & 0xF) + 55;
  if (v49 < 0xA) {
    char v51 = v50;
  }
  a2[22] = v51;
  a2[23] = 45;
  unsigned int v52 = result[10];
  int v53 = (v52 >> 4) + 55;
  if (v52 < 0xA0) {
    LOBYTE(v53) = (result[10] >> 4) | 0x30;
  }
  a2[24] = v53;
  unsigned int v54 = v52 & 0xF;
  char v55 = v52 & 0xF | 0x30;
  char v56 = (v52 & 0xF) + 55;
  if (v54 < 0xA) {
    char v56 = v55;
  }
  a2[25] = v56;
  unsigned int v57 = result[11];
  int v58 = (v57 >> 4) + 55;
  if (v57 < 0xA0) {
    LOBYTE(v5_Block_object_dispose(&STACK[0x280], 8) = (result[11] >> 4) | 0x30;
  }
  a2[26] = v58;
  unsigned int v59 = v57 & 0xF;
  char v60 = v57 & 0xF | 0x30;
  char v61 = (v57 & 0xF) + 55;
  if (v59 < 0xA) {
    char v61 = v60;
  }
  a2[27] = v61;
  unsigned int v62 = result[12];
  int v63 = (v62 >> 4) + 55;
  if (v62 < 0xA0) {
    LOBYTE(v63) = (result[12] >> 4) | 0x30;
  }
  a2[28] = v63;
  unsigned int v64 = v62 & 0xF;
  char v65 = v62 & 0xF | 0x30;
  char v66 = (v62 & 0xF) + 55;
  if (v64 < 0xA) {
    char v66 = v65;
  }
  a2[29] = v66;
  unsigned int v67 = result[13];
  int v68 = (v67 >> 4) + 55;
  if (v67 < 0xA0) {
    LOBYTE(v6_Block_object_dispose(&STACK[0x280], 8) = (result[13] >> 4) | 0x30;
  }
  a2[30] = v68;
  unsigned int v69 = v67 & 0xF;
  char v70 = v67 & 0xF | 0x30;
  char v71 = (v67 & 0xF) + 55;
  if (v69 < 0xA) {
    char v71 = v70;
  }
  a2[31] = v71;
  unsigned int v72 = result[14];
  int v73 = (v72 >> 4) + 55;
  if (v72 < 0xA0) {
    LOBYTE(v73) = (result[14] >> 4) | 0x30;
  }
  a2[32] = v73;
  unsigned int v74 = v72 & 0xF;
  char v75 = v72 & 0xF | 0x30;
  char v76 = (v72 & 0xF) + 55;
  if (v74 < 0xA) {
    char v76 = v75;
  }
  a2[33] = v76;
  unsigned int v77 = result[15];
  int v78 = (v77 >> 4) + 55;
  if (v77 < 0xA0) {
    LOBYTE(v7_Block_object_dispose(&STACK[0x280], 8) = (result[15] >> 4) | 0x30;
  }
  a2[34] = v78;
  unsigned int v79 = v77 & 0xF;
  char v80 = v77 & 0xF | 0x30;
  char v81 = (v77 & 0xF) + 55;
  if (v79 >= 0xA) {
    char v80 = v81;
  }
  a2[35] = v80;
  a2[36] = 0;
  return result;
}

void sub_21F224248(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_21F226930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, id *location, id *a11, id *a12, id *a13, id *a14, uint64_t a15, id *a16)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v17);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(v18);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak(a16);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)&STACK[0x2F0]);
  _Unwind_Resume(a1);
}

void sub_21F2280E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21F228710(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_21F228DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_21F22A354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _upgradeIndexerCommitSynchronous(void *a1)
{
  if ([a1 index] && SISyncIndex())
  {
    dispatch_group_t v1 = dispatch_group_create();
    syncContextCreate(v1, 0);
    SISynchedOp();
  }
}

void sub_21F22AE1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F22B018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21F22BF74(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F22C0E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F22C6B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F22E1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

void sub_21F232CC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F2331FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21F2334CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F233EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21F233F5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F234118(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F234960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

void sub_21F234D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_21F23552C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_21F235B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F235FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F236478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F2368F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F2371B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void setTurboMode(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v2 = "Disable";
    if (a1) {
      unsigned int v2 = "Enable";
    }
    *(_DWORD *)buf = 136315138;
    unsigned int v7 = v2;
    _os_log_impl(&dword_21F1CE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s turbo mode", buf, 0xCu);
  }
  sTurboMode = a1;
  int v3 = (const char *)turboFilePath();
  if (a1)
  {
    int v4 = open(v3, 514, 384);
    if (v4 != -1) {
      close(v4);
    }
  }
  else
  {
    unlink(v3);
  }
  _SISetTurboMode();
  char v5 = [MEMORY[0x263F78CE8] sharedProcessor];
  [v5 setTurboMode:a1];
}

void wait_for_apfs_kb_state(const char *a1, int a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (a2) {
      int v4 = 5;
    }
    else {
      int v4 = 4;
    }
    uint64_t v14 = 0;
    memset(v13, 0, sizeof(v13));
    LODWORD(v13[0]) = v4;
    char v5 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 67109378;
      int v10 = a2;
      __int16 v11 = 2080;
      unsigned int v12 = a1;
      _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_DEFAULT, "### wait_for_apfs_kb_state %d enter %s", (uint8_t *)&v9, 0x12u);
    }

    if (fsctl(a1, 0x80284A5AuLL, v13, 0) == -1)
    {
      int v7 = *__error();
      if (v7 != 19 && v7 != 45)
      {
        uint64_t v8 = logForCSLogCategoryDefault();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          wait_for_apfs_kb_state_cold_1();
        }
      }
    }
    char v6 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 67109378;
      int v10 = a2;
      __int16 v11 = 2080;
      unsigned int v12 = a1;
      _os_log_impl(&dword_21F1CE000, v6, OS_LOG_TYPE_DEFAULT, "### wait_for_apfs_kb_state %d exit %s", (uint8_t *)&v9, 0x12u);
    }
  }
}

void extractBundlesAndProtectionClasses(void *a1, void *a2, void *a3)
{
  id v21 = a1;
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [v21 count];
  if (v7 >= 2)
  {
    unint64_t v8 = v7;
    char v20 = 0;
    char v9 = 0;
    char v10 = 0;
    char v11 = 0;
    char v12 = 0;
    uint64_t v13 = 1;
    uint64_t v17 = *MEMORY[0x263F08088];
    uint64_t v18 = *MEMORY[0x263F08080];
    uint64_t v19 = *MEMORY[0x263F08098];
    uint64_t v16 = *MEMORY[0x263F080A0];
    do
    {
      uint64_t v14 = objc_msgSend(v21, "objectAtIndexedSubscript:", v13, v16);
      if ([v14 length])
      {
        if ([v14 hasPrefix:@"com."])
        {
          [v5 addObject:v14];
        }
        else
        {
          int v15 = [v14 characterAtIndex:0];
          if (v15 <= 87)
          {
            if (v15 <= 66)
            {
              if (v15 == 65) {
                goto LABEL_27;
              }
              if (v15 == 66) {
                goto LABEL_31;
              }
            }
            else
            {
              if ((v15 - 67) < 2) {
                goto LABEL_35;
              }
              if (v15 == 78)
              {
                if ([v14 isEqualToString:v18])
                {
LABEL_27:
                  if ((v11 & 1) == 0) {
                    [v6 addObject:v18];
                  }
                  char v11 = 1;
                  goto LABEL_42;
                }
                if ([v14 isEqualToString:v17])
                {
LABEL_31:
                  if ((v10 & 1) == 0) {
                    [v6 addObject:v17];
                  }
                  char v10 = 1;
                  goto LABEL_42;
                }
                if ([v14 isEqualToString:v19])
                {
LABEL_35:
                  if ((v12 & 1) == 0) {
                    [v6 addObject:v19];
                  }
                  char v12 = 1;
                  goto LABEL_42;
                }
                if ([v14 isEqualToString:v16]) {
                  goto LABEL_39;
                }
              }
              else if (v15 == 80)
              {
                goto LABEL_16;
              }
            }
          }
          else if (v15 <= 98)
          {
            switch(v15)
            {
              case 'X':
                goto LABEL_39;
              case 'a':
                goto LABEL_27;
              case 'b':
                goto LABEL_31;
            }
          }
          else
          {
            if ((v15 - 99) < 2) {
              goto LABEL_35;
            }
            if (v15 == 112)
            {
LABEL_16:
              if ((v20 & 1) == 0) {
                [v6 addObject:@"Priority"];
              }
              char v20 = 1;
              goto LABEL_42;
            }
            if (v15 == 120)
            {
LABEL_39:
              if ((v9 & 1) == 0) {
                [v6 addObject:v16];
              }
              char v9 = 1;
            }
          }
        }
      }
LABEL_42:

      ++v13;
    }
    while (v8 != v13);
  }
}

void sub_21F23A0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F23A2E4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_21F23ABA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F23DB08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F23E16C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t hasResetTouchFilesForUUID(void *a1)
{
  uint64_t v1 = (objc_class *)NSString;
  id v2 = a1;
  id v3 = [v1 alloc];
  int v4 = [(id)sDelegate indexDirectory];
  id v5 = (void *)[v3 initWithFormat:@"%@/TrialResets/%@", v4, v2];

  id v6 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v7 = [v6 fileExistsAtPath:v5];

  return v7;
}

uint64_t createResetTouchFileDirectoryForUUID(void *a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = (objc_class *)NSString;
  id v2 = a1;
  id v3 = [v1 alloc];
  int v4 = [(id)sDelegate indexDirectory];
  id v5 = (void *)[v3 initWithFormat:@"%@/TrialResets/%@", v4, v2];

  uint64_t v13 = *MEMORY[0x263F080A8];
  v14[0] = *MEMORY[0x263F08098];
  id v6 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
  id v12 = 0;
  uint64_t v8 = [v7 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:v6 error:&v12];
  id v9 = v12;

  if (v9)
  {
    char v10 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      createResetTouchFileDirectoryForUUID_cold_1();
    }
  }
  return v8;
}

void _queueRelatedDelete(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v3;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_21F1CE000, v5, OS_LOG_TYPE_DEFAULT, "queue related delete %@:%@", (uint8_t *)&v12, 0x16u);
  }

  id v6 = [(id)sDeleteBatches objectForKeyedSubscript:v3];
  if (!v6)
  {
    id v6 = objc_opt_new();
    [(id)sDeleteBatches setObject:v6 forKeyedSubscript:v3];
  }
  [v6 addObject:v4];
  uint64_t v7 = sTotalOutstandingDeletes;
  unint64_t v8 = ++sTotalOutstandingDeletes;
  if (v7)
  {
    if (v8 >= 0x64) {
      _flushDeleteQueue();
    }
  }
  else
  {
    if (!sDeletesTransaction)
    {
      uint64_t v9 = SDTransactionCreate(&unk_26D0C8E30);
      char v10 = (void *)sDeletesTransaction;
      sDeletesTransaction = v9;
    }
    dispatch_time_t v11 = dispatch_time(0, 5000000000);
    dispatch_after(v11, (dispatch_queue_t)sBatchDeleteQueue, &__block_literal_global_3389);
  }
}

uint64_t MDBootTime()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  *(void *)id v5 = 0x1500000001;
  v3[0] = 0;
  v3[1] = 0;
  size_t v4 = 16;
  int v0 = sysctl(v5, 2u, v3, &v4, 0, 0);
  if (v3[0]) {
    BOOL v1 = v0 == -1;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1) {
    return 0;
  }
  else {
    return v3[0];
  }
}

void __updatedFrom2024Seed_block_invoke()
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v0 = indexHeartbeatPath();
  pthread_rwlock_wrlock(&sIndexHeartbeatLock);
  BOOL v1 = [MEMORY[0x263F08850] defaultManager];
  char v2 = [v1 fileExistsAtPath:v0];

  if (v2)
  {
    id v3 = [NSDictionary dictionaryWithContentsOfFile:v0];
    pthread_rwlock_unlock(&sIndexHeartbeatLock);
    size_t v4 = [v3 objectForKeyedSubscript:@"previousbuild"];
    if (v4)
    {
      int v5 = isAppleInternalInstall();
      BOOL v6 = is2024Seed(v4);
      char v7 = v5 | v6;
      if (v5 && !v6)
      {
        id v8 = v4;
        id v18 = 0;
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"22[AB]\\d{1,3}($|\\D)" options:0 error:&v18];
        id v10 = v18;
        dispatch_time_t v11 = v10;
        if (!v9 || v10)
        {
          int v12 = logForCSLogCategoryIndex();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            __updatedFrom2024Seed_block_invoke_cold_2();
          }
        }
        uint64_t v13 = objc_msgSend(v9, "numberOfMatchesInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
        __int16 v14 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = &stru_26D0BD940;
          if (!v13) {
            id v15 = @" not";
          }
          *(_DWORD *)buf = 138412546;
          id v20 = v8;
          __int16 v21 = 2112;
          unsigned int v22 = v15;
          _os_log_impl(&dword_21F1CE000, v14, OS_LOG_TYPE_DEFAULT, "%@ is%@ a 2024 release build", buf, 0x16u);
        }

        char v7 = v13 != 0;
      }
    }
    else
    {
      uint64_t v17 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __updatedFrom2024Seed_block_invoke_cold_1();
      }

      char v7 = 0;
    }
    updatedFrom2024Seed_updatedFromSeed = v7;
  }
  else
  {
    uint64_t v16 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F1CE000, v16, OS_LOG_TYPE_DEFAULT, "Did not find heartbeat file", buf, 2u);
    }

    pthread_rwlock_unlock(&sIndexHeartbeatLock);
    updatedFrom2024Seed_updatedFromSeed = 0;
  }
}

BOOL is2024Seed(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v11 = 0;
  char v2 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"22[AB][45]\\d{3}($|\\D)" options:0 error:&v11];
  id v3 = v11;
  size_t v4 = v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    BOOL v6 = logForCSLogCategoryIndex();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      is2024Seed_cold_1();
    }
  }
  uint64_t v7 = objc_msgSend(v2, "numberOfMatchesInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
  id v8 = logForCSLogCategoryIndex();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = &stru_26D0BD940;
    if (!v7) {
      uint64_t v9 = @" not";
    }
    *(_DWORD *)buf = 138412546;
    id v13 = v1;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_DEFAULT, "%@ is%@ a 2024 seed build", buf, 0x16u);
  }

  return v7 != 0;
}

void ___indexCrossedWorkBoundary_block_invoke(uint64_t a1)
{
  dispatch_group_t v2 = dispatch_group_create();
  [*(id *)(a1 + 32) commitUpdates:v2];
}

void __processItemsForImportInner_block_invoke_3325(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  if (a3)
  {
    size_t v4 = *(NSObject **)(a1 + 72);
    if (v4) {
      dispatch_group_leave(v4);
    }
    BOOL v5 = *(NSObject **)(a1 + 80);
    if (v5)
    {
      dispatch_group_leave(v5);
    }
    return;
  }
  char v50 = (id *)(a1 + 88);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  __int16 v83 = 0;
  __int16 v82 = 0;
  char v81 = 0;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v51 = a1;
  [WeakRetained checkAdmission:*(void *)(a1 + 32) background:1 didBeginThrottle:(char *)&v83 + 1 didEndThrottle:&v83 live:(char *)&v82 + 1 slow:&v82 memoryPressure:&v81];
  uint64_t v8 = [*(id *)(a1 + 40) count];
  if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v9 = [MEMORY[0x263EFF980] array];
    if (v8 >= 1)
    {
      uint64_t v10 = *MEMORY[0x263F023E8];
      uint64_t v11 = MEMORY[0x263EFFA88];
      do
      {
        uint64_t v91 = v10;
        uint64_t v92 = v11;
        int v12 = [NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
        [v9 addObject:v12];

        --v8;
      }
      while (v8);
    }
LABEL_12:
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithArray:v9];
    goto LABEL_19;
  }
  if (*(unsigned char *)(a1 + 97))
  {
    uint64_t v9 = [MEMORY[0x263EFF980] array];
    if (v8 >= 1)
    {
      uint64_t v14 = *MEMORY[0x263F023E0];
      uint64_t v15 = MEMORY[0x263EFFA88];
      do
      {
        uint64_t v89 = v14;
        uint64_t v90 = v15;
        uint64_t v16 = [NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
        [v9 addObject:v16];

        --v8;
      }
      while (v8);
    }
    goto LABEL_12;
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F02A48]) initWithData:*(void *)(a1 + 48)];
  uint64_t v13 = [v9 decode];
LABEL_19:
  uint64_t v17 = (void *)v13;

  id v18 = objc_alloc_init(MEMORY[0x263F02A30]);
  [v18 beginArray];
  uint64_t v19 = *(void **)(v51 + 56);
  id v20 = *(void **)(v51 + 40);
  int v56 = *(unsigned __int8 *)(v51 + 98);
  id v58 = WeakRetained;
  id v52 = v19;
  id v21 = v20;
  id v61 = v17;
  id v22 = v18;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  obuint64_t j = v21;
  uint64_t v66 = [v21 countByEnumeratingWithState:&v84 objects:v93 count:16];
  if (!v66) {
    goto LABEL_43;
  }
  uint64_t v23 = 0;
  unsigned int v59 = 0;
  uint64_t v60 = *(void *)v85;
  uint64_t v55 = *MEMORY[0x263F023D8];
  uint64_t v64 = *MEMORY[0x263EFFD08];
  uint64_t v54 = *MEMORY[0x263F023F8];
  uint64_t v53 = *MEMORY[0x263F023F0];
  uint64_t v62 = *MEMORY[0x263F028D0];
  do
  {
    for (uint64_t i = 0; i != v66; ++i)
    {
      if (*(void *)v85 != v60) {
        objc_enumerationMutation(obj);
      }
      char v25 = *(void **)(*((void *)&v84 + 1) + 8 * i);
      char v26 = [v61 objectAtIndexedSubscript:v23 + i];
      unsigned int v27 = [v26 objectForKeyedSubscript:@"_kMDItemExternalID"];
      if (!v27
        || (objc_opt_class(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && [v25 isEqualToString:v27])
      {
        if (v26) {
          [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v26];
        }
        else {
        int v28 = [MEMORY[0x263EFF9A0] dictionary];
        }
        [v28 setObject:&unk_26D0C8F80 forKeyedSubscript:v55];
        [v28 setObject:v25 forKeyedSubscript:@"_kMDItemExternalID"];
        [v28 setObject:v64 forKeyedSubscript:v54];
        [v28 setObject:v64 forKeyedSubscript:v53];
        unsigned int v29 = [v28 objectForKeyedSubscript:v62];
        if (v29)
        {
          char v30 = v59;
          if (!v59)
          {
            id v31 = objc_alloc_init(MEMORY[0x263F02A30]);
            [v31 beginArray];
            [v31 encodeString:"contentText"];
            [v31 beginDictionary];
            char v30 = v31;
          }
          unsigned int v59 = v30;
          [v30 encodeObject:v29 withKey:v25];
        }
        if (v56)
        {
          unsigned int v32 = [MEMORY[0x263F78CE8] sharedProcessor];
          int v33 = [v58 dataclass];
          unsigned int v34 = [v32 processorAttributesForRecord:v28 bundleID:v52 protectionClass:v33 isUpdate:0];

          if (v34) {
            [v28 addEntriesFromDictionary:v34];
          }
        }
        [v28 removeObjectForKey:v62];
        [v22 beginArray];
        [v22 encodeString:"__class:CSSearchableItemAttributeSet"];
        [v22 encodeInt64:8];
        [v22 encodeObject:v28];
        [v22 endArray];
      }
    }
    uint64_t v66 = [obj countByEnumeratingWithState:&v84 objects:v93 count:16];
    v23 += i;
  }
  while (v66);
  if (v59)
  {
    [v59 endDictionary];
    [v59 endArray];
  }
  else
  {
LABEL_43:
    unsigned int v59 = 0;
  }

  [v22 endArray];
  unsigned int v67 = [v22 data];
  char v65 = [v59 data];
  if (v67)
  {
    if (([*(id *)(v51 + 64) jobOptions] & 0x100) != 0)
    {
      uint64_t v35 = [v58 _interestedAttributesMaskForBundleID:*(void *)(v51 + 56)];
      if (v35)
      {
        int v63 = (void *)[objc_alloc(MEMORY[0x263F02A48]) initWithData:v67];
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v36 = (id)[objc_alloc(MEMORY[0x263F02AF0]) initWithItems:v63 itemsContent:0];
        unsigned int v37 = 0;
        uint64_t v38 = 0;
        uint64_t v39 = [v36 countByEnumeratingWithState:&v77 objects:v88 count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v78;
          do
          {
            for (uint64_t j = 0; j != v39; ++j)
            {
              if (*(void *)v78 != v40) {
                objc_enumerationMutation(v36);
              }
              unsigned int v42 = *(void **)(*((void *)&v77 + 1) + 8 * j);
              uint64_t v43 = [(id)objc_opt_class() checkItemOfInterest:v42 mask:v35];
              int v44 = [v42 isUpdate];
              if (v43) {
                int v45 = v44;
              }
              else {
                int v45 = 0;
              }
              if (v45 == 1)
              {
                if (!v37) {
                  unsigned int v37 = objc_opt_new();
                }
                [v37 addObject:v42];
                v38 |= v43;
              }
            }
            uint64_t v39 = [v36 countByEnumeratingWithState:&v77 objects:v88 count:16];
          }
          while (v39);
        }

        [v58 notifyClientForItemUpdates:*(void *)(v51 + 56) updatedItems:v37 batchMask:v38];
      }
    }
  }
  if (v65) {
    [*(id *)(v51 + 64) jobOptions];
  }
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __processItemsForImportInner_block_invoke_2;
  v68[3] = &unk_2645090B8;
  objc_copyWeak(v72, v50);
  id v69 = *(id *)(v51 + 32);
  char v73 = HIBYTE(v83);
  char v74 = v83;
  char v75 = HIBYTE(v82);
  char v76 = v82;
  v72[1] = *(id *)&Current;
  id v70 = *(id *)(v51 + 72);
  id v71 = *(id *)(v51 + 80);
  id v49 = (id)[v68 copy];
  int v46 = SISetCodedAttributes();

  if (!v46)
  {
    unsigned int v47 = *(NSObject **)(v51 + 72);
    if (v47) {
      dispatch_group_leave(v47);
    }
    int v48 = *(NSObject **)(v51 + 80);
    if (v48) {
      dispatch_group_leave(v48);
    }
  }

  objc_destroyWeak(v72);
}

void sub_21F2418B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void ___setClientStateInner_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) dirty:0];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

uint64_t __initializeDiskSpaceNotificationListener_block_invoke(uint64_t a1)
{
  pthread_mutex_lock(&initializeDiskSpaceNotificationListener_sVFSEventLock);
  uintptr_t data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  if (data == 256)
  {
    uint64_t v3 = logForCSLogCategoryDefault();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    __int16 v13 = 0;
    id v4 = "Received empty update vfsevent; assuming not in low disk space state";
    BOOL v5 = (uint8_t *)&v13;
LABEL_8:
    _os_log_impl(&dword_21F1CE000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
LABEL_9:

    char v6 = sVeryLowDiskSpace;
    sVeryLowDiskSpace = 0;
    if (v6)
    {
      uint64_t v7 = +[SPCoreSpotlightIndexer sharedInstance];
      [v7 restoreIndexAndClearPurgeable];
LABEL_15:

      return pthread_mutex_unlock(&initializeDiskSpaceNotificationListener_sVFSEventLock);
    }
    return pthread_mutex_unlock(&initializeDiskSpaceNotificationListener_sVFSEventLock);
  }
  if ((data & 0x200) == 0)
  {
    if ((data & 4) == 0) {
      return pthread_mutex_unlock(&initializeDiskSpaceNotificationListener_sVFSEventLock);
    }
    uint64_t v3 = logForCSLogCategoryDefault();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    __int16 v11 = 0;
    id v4 = "Received low disk space vfsevent; assuming very low disk ended";
    BOOL v5 = (uint8_t *)&v11;
    goto LABEL_8;
  }
  uint64_t v8 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_DEFAULT, "Received very low disk space vfsevent", buf, 2u);
  }

  char v9 = sVeryLowDiskSpace;
  sVeryLowDiskSpace = 1;
  if ((v9 & 1) == 0)
  {
    uint64_t v7 = +[SPCoreSpotlightIndexer sharedInstance];
    [v7 recycleAndPurgeIndex];
    goto LABEL_15;
  }
  return pthread_mutex_unlock(&initializeDiskSpaceNotificationListener_sVFSEventLock);
}

void handleLowDiskSpace()
{
  if ((sVeryLowDiskSpace & 1) == 0)
  {
    sVeryLowDiskSpace = 1;
    int v0 = dispatch_get_global_queue(21, 0);
    dispatch_async(v0, &__block_literal_global_3357);
  }
}

void __handleLowDiskSpace_block_invoke()
{
  id v0 = +[SPCoreSpotlightIndexer sharedInstance];
  [v0 recycleAndPurgeIndex];
}

id __reportVectorIndexDrop_block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t turboFilePath()
{
  id v0 = [(id)sDelegate indexDirectory];
  id v1 = [v0 stringByAppendingPathComponent:@".turbo"];
  uint64_t v2 = [v1 fileSystemRepresentation];

  return v2;
}

void _flushDeleteQueue()
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (sTotalOutstandingDeletes)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v0 = [(id)sDeleteBatches allKeys];
    uint64_t v1 = [v0 countByEnumeratingWithState:&v12 objects:v20 count:16];
    if (v1)
    {
      uint64_t v3 = v1;
      uint64_t v4 = *(void *)v13;
      *(void *)&long long v2 = 67109378;
      long long v11 = v2;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v13 != v4) {
            objc_enumerationMutation(v0);
          }
          uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          uint64_t v7 = objc_msgSend((id)sDeleteBatches, "objectForKeyedSubscript:", v6, v11);
          if ([v7 count])
          {
            uint64_t v8 = logForCSLogCategoryDefault();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              int v9 = [v7 count];
              *(_DWORD *)buf = v11;
              int v17 = v9;
              __int16 v18 = 2112;
              uint64_t v19 = v6;
              _os_log_impl(&dword_21F1CE000, v8, OS_LOG_TYPE_DEFAULT, "flushing %d related deletes for %@", buf, 0x12u);
            }

            +[SpotlightSender deleteSearchableItemsWithIdentifiers:v7 bundleID:v6 contentType:0 client:1];
            +[SpotlightSender deleteSearchableItemsWithIdentifiers:v7 bundleID:v6 contentType:0 client:2];
          }
          [(id)sDeleteBatches removeAllObjects];
          sTotalOutstandingDeletes = 0;
        }
        uint64_t v3 = [v0 countByEnumeratingWithState:&v12 objects:v20 count:16];
      }
      while (v3);
    }
  }
  if (sDeletesTransaction)
  {
    SDTransactionDone((void *)sDeletesTransaction);
    uint64_t v10 = (void *)sDeletesTransaction;
    sDeletesTransaction = 0;
  }
}

uint64_t __SPLogDirectory_block_invoke()
{
  uint64_t v0 = [@"~/Library/Logs/CrashReporter/DiagnosticLogs/Search" stringByExpandingTildeInPath];
  uint64_t v1 = SPLogDirectory_sSPLogDirectory;
  SPLogDirectory_sSPLogDirectory = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_10_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_17(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x280], 8) = a1;
}

void OUTLINED_FUNCTION_20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_21(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_22(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x26u);
}

uint64_t OUTLINED_FUNCTION_32@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 40) = a2;
  return [a1 canceled];
}

void OUTLINED_FUNCTION_33(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x280], 8) = a1;
}

void OUTLINED_FUNCTION_35(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x280], 8) = a1;
}

void OUTLINED_FUNCTION_36(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x280], 8) = a1;
}

uint64_t OUTLINED_FUNCTION_38(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_42(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_44(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_45(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

void OUTLINED_FUNCTION_46(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

uint64_t OUTLINED_FUNCTION_48(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return [v2 count];
}

float weightedDistance(char *a1, char *a2, float a3, float a4)
{
  size_t v8 = strlen(a1);
  size_t v9 = strlen(a2);
  return _weightedDistance((unsigned __int8 *)a1, v8, (unsigned __int8 *)a2, v9, a3, a4);
}

float _weightedDistance(unsigned __int8 *a1, size_t a2, unsigned __int8 *a3, size_t a4, float a5, float a6)
{
  float v6 = a5;
  if (a2 > a4) {
    size_t v7 = a4;
  }
  else {
    size_t v7 = a2;
  }
  if (a2 > a4) {
    size_t v8 = a3;
  }
  else {
    size_t v8 = a1;
  }
  if (a2 > a4) {
    size_t v9 = a2;
  }
  else {
    size_t v9 = a4;
  }
  if (a2 > a4) {
    uint64_t v10 = (char *)a1;
  }
  else {
    uint64_t v10 = (char *)a3;
  }
  unint64_t v11 = v9 - v7;
  float v12 = (float)(v9 - v7);
  if (v12 > a5) {
    return v6;
  }
  if (v9 == v7 && !memcmp(v8, v10, v7)) {
    return 0.0;
  }
  if (!v7)
  {
LABEL_20:
    float v6 = 0.0;
    if (v9 == v7) {
      return v6;
    }
    float v19 = flt_21F26B0A8[a2 <= a4];
    return v19 * v12;
  }
  size_t v16 = v7 - 1;
  int v17 = &v10[v9 - 1];
  while (1)
  {
    int v18 = *v17--;
    if (v8[v16] != v18) {
      break;
    }
    if (--v16 == -1) {
      goto LABEL_20;
    }
  }
  size_t v20 = 0;
  while (v8[v20] == v10[v20])
  {
    if (v7 == ++v20)
    {
      size_t v20 = v7;
      goto LABEL_29;
    }
  }
  unint64_t v11 = v9 - v20;
LABEL_29:
  size_t v21 = v7 - v20;
  if (v7 == v20)
  {
    float v6 = 0.0;
    if (v9 == v7) {
      return v6;
    }
    float v19 = 0.1;
    if (v7 <= 2) {
      float v19 = 0.25;
    }
    if (a2 > a4) {
      float v19 = 0.21;
    }
    return v19 * v12;
  }
  float v22 = (float)v11;
  float v23 = (float)(v11 - v21);
  if (v6 >= 0.0 && v22 >= v6)
  {
    float v22 = v6;
    if (v23 > v6) {
      return v6;
    }
  }
  __int16 v82 = 0;
  __int16 v83 = 0;
  uint64_t v84 = 0;
  LODWORD(__p) = 0;
  std::vector<float>::vector(&v82, v11, &__p);
  __p = 0;
  long long v80 = 0;
  uint64_t v81 = 0;
  int v78 = 0;
  std::vector<float>::vector(&__p, v11, &v78);
  unint64_t v24 = (unint64_t)v22;
  if (v9 != v20)
  {
    uint64_t v25 = 0;
    unint64_t v26 = v11 - 1;
    unsigned int v27 = v82;
    unint64_t v28 = v11 - 2;
    unsigned int v29 = (float *)v82;
    do
    {
      size_t v30 = v25 | v20;
      if (a2 > a4)
      {
        if (!v30)
        {
          _DWORD *v27 = 1053609164;
          goto LABEL_60;
        }
        if (v26 != v25 || !v25)
        {
          if (!v25)
          {
            _DWORD *v27 = 1049582632;
            goto LABEL_60;
          }
          float v32 = *(v29 - 1) + 0.28;
LABEL_57:
          *unsigned int v29 = v32;
          goto LABEL_60;
        }
        float v31 = *(float *)&v27[v28] + 0.21;
      }
      else
      {
        if (!v30)
        {
          _DWORD *v27 = 1055286886;
          goto LABEL_60;
        }
        if (v26 != v25 || !v25)
        {
          if (!v25)
          {
            _DWORD *v27 = 1043878380;
            goto LABEL_60;
          }
          float v32 = *(v29 - 1) + 0.18;
          goto LABEL_57;
        }
        float v31 = *(float *)&v27[v28] + 0.25;
      }
      *(float *)&v27[v26] = v31;
LABEL_60:
      ++v25;
      ++v29;
    }
    while (v11 != v25);
  }
  unint64_t v33 = 0;
  unint64_t v34 = 0;
  unint64_t v77 = (unint64_t)(float)(v22 - v23);
  int v35 = *v8;
  float v36 = flt_21F26B0A0[a2 <= a4];
  char v76 = (char *)v82;
  unsigned int v37 = (float *)((char *)&unk_21F26B098 + 4 * (v20 == 0));
  if (a2 > a4) {
    unsigned int v37 = (float *)((char *)&unk_21F26B090 + 4 * (v20 == 0));
  }
  float v38 = *v37;
  size_t v39 = v21 - 1;
  float v40 = 0.0;
  float v41 = 0.0;
  do
  {
    int v42 = v8[v33 + v20];
    float v43 = v41 + v36;
    if (!v33) {
      float v43 = v38;
    }
    if (v33 <= v77) {
      unint64_t v44 = v34;
    }
    else {
      unint64_t v44 = v34 + 1;
    }
    if (v24 >= v11) {
      unint64_t v45 = v24;
    }
    else {
      unint64_t v45 = v24 + 1;
    }
    if (v44 < v45)
    {
      uint64_t v46 = 0;
      char v47 = 0;
      BOOL v48 = v33 == 0;
      if (!v33) {
        float v41 = 0.0;
      }
      int v49 = v10[v20];
      char v50 = (float *)__p;
      if (v33 == v39) {
        BOOL v48 = 1;
      }
      unint64_t v51 = v44 - 1;
      unint64_t v52 = ~v44 + v24 + (v24 < v11);
      uint64_t v53 = (__PAIR128__(-(uint64_t)v34, v77) - v33) >> 64;
      uint64_t v54 = (char *)__p + 4 * v44;
      uint64_t v55 = &v76[4 * v44];
      float v56 = v43;
      while (1)
      {
        float v57 = v41;
        if (v46 || !v53)
        {
          float v59 = *(float *)&v54[4 * v46];
          *(float *)&v54[4 * v46] = v57;
          float v58 = v40;
        }
        else
        {
          float v58 = v50[v51];
          float v59 = v50[v44];
          v50[v44] = v57;
          int v49 = v10[v51];
        }
        float v40 = v59;
        float v41 = *(float *)&v55[4 * v46];
        int v60 = v10[v20 + v44 + v46];
        if (v42 != v60) {
          break;
        }
        v47 |= v48;
LABEL_137:
        *(float *)&v55[4 * v46++] = v57;
        int v49 = v60;
        float v56 = v57;
        if (v44 + v46 >= v45) {
          goto LABEL_140;
        }
      }
      if (a2 > a4)
      {
        if (v20 | v46)
        {
          if (v52 == v46) {
            float v61 = v57 + 0.19;
          }
          else {
            float v61 = v57 + 0.2;
          }
        }
        else
        {
          float v61 = v57 + 0.27;
          if ((v47 & 1) == 0)
          {
            if ((float)(v41 + 0.45) < v61) {
              float v61 = v41 + 0.45;
            }
            float v62 = v56 + 0.4;
            goto LABEL_115;
          }
        }
        if (v52 == v46)
        {
          if ((float)(v41 + 0.25) < v61) {
            float v61 = v41 + 0.25;
          }
          float v62 = v56 + 0.21;
        }
        else
        {
          if ((float)(v41 + 0.18) < v61) {
            float v61 = v41 + 0.18;
          }
          float v62 = v56 + 0.28;
        }
        goto LABEL_115;
      }
      if (v33 | v20)
      {
        if (v33 == v39)
        {
          float v61 = v57 + 0.19;
LABEL_97:
          float v63 = v56 + 0.25;
          if (v63 < v61) {
            float v61 = v63;
          }
          float v62 = v41 + 0.21;
LABEL_115:
          if (v62 < v61) {
            float v61 = v62;
          }
          if (!v33 || v53 == v46 || v42 != v49 || v35 != v60) {
            goto LABEL_136;
          }
          if (v52 == v46 && v33 == v39) {
            float v67 = 0.38;
          }
          else {
            float v67 = 0.275;
          }
          if (v44 + v46 == 1 && v33 == 1 && v20 == 0) {
            float v67 = 0.39;
          }
          float v57 = v58 + v67;
          if ((float)(v58 + v67) >= v61) {
LABEL_136:
          }
            float v57 = v61;
          goto LABEL_137;
        }
        float v61 = v57 + 0.2;
      }
      else
      {
        float v61 = v57 + 0.27;
        if ((v47 & 1) == 0)
        {
          float v65 = v56 + 0.45;
          if (v65 < v61) {
            float v61 = v65;
          }
          float v62 = v41 + 0.4;
          goto LABEL_115;
        }
        if (v33 == v39) {
          goto LABEL_97;
        }
      }
      float v64 = v56 + 0.18;
      if (v64 < v61) {
        float v61 = v64;
      }
      float v62 = v41 + 0.28;
      goto LABEL_115;
    }
    float v57 = v43;
LABEL_140:
    ++v33;
    int v35 = v42;
    unint64_t v24 = v45;
    unint64_t v34 = v44;
    float v41 = v43;
  }
  while (v33 != v21);
  if (a2 <= a4 && v7 >= 3)
  {
    unint64_t v70 = (unint64_t)(float)((float)(v11 - 1) - v22);
    if (v11 > v70)
    {
      id v71 = (float *)v82;
      unsigned int v72 = (float *)__p;
      unint64_t v73 = ~v70 + v11;
      do
      {
        float v74 = v71[v70] + (float)((float)v73 * 0.1);
        v72[v70] = v74;
        if (v74 < v57) {
          float v57 = v74;
        }
        ++v70;
        --v73;
      }
      while (v70 < v11);
    }
  }
  if (__p)
  {
    long long v80 = __p;
    operator delete(__p);
  }
  if (v57 <= a6) {
    float v6 = v57;
  }
  if (v82)
  {
    __int16 v83 = v82;
    operator delete(v82);
  }
  return v6;
}

void sub_21F242898(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL verifyCandidateLength(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 0x12;
}

BOOL isCandidate(char *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (char *)[v3 UTF8String];
  size_t v5 = strlen(v4);
  size_t v6 = strlen(a1);
  float v7 = _weightedDistance((unsigned __int8 *)v4, v5, (unsigned __int8 *)a1, v6, 4.0, 1.2);
  if (v5 <= v6) {
    unint64_t v8 = v6;
  }
  else {
    unint64_t v8 = v5;
  }
  BOOL v9 = 0;
  if (v7 < fmaxf((float)v8, 4.0) && v8 && v7 >= 0.0) {
    BOOL v9 = (float)(1.0 - (float)(v7 / (float)v8)) >= 0.945;
  }

  return v9;
}

void sub_21F242994(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id SDPommesCorrectionsWithTopKAndToken(void *a1, void *a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v50 = a2;
  id v6 = a3;
  long long v55 = 0u;
  long long v56 = 0u;
  id v7 = v5;
  id v8 = v6;
  BOOL v9 = v8;
  if (!v7
    || !v8
    || ([v7 allKeys],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        unint64_t v11 = [v10 count],
        int v12 = [v9 intValue],
        v10,
        v11 <= v12))
  {
    id v26 = v7;
    goto LABEL_22;
  }
  long long v63 = 0u;
  long long v64 = 0u;
  *(_OWORD *)__p = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:__p objects:&v67 count:16];
  if (!v14) {
    goto LABEL_18;
  }
  uint64_t v15 = *(void *)v60;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v60 != v15) {
        objc_enumerationMutation(v13);
      }
      int v17 = (void *)*((void *)__p[1] + i);
      int v18 = [v13 objectForKeyedSubscript:v17];
      long long v19 = v63;
      if ((int)[v9 intValue] <= (unint64_t)((uint64_t)(*((void *)&v19 + 1) - v19) >> 4))
      {
        if ([*(id *)(v63 + 8) compare:v18] > 0) {
          goto LABEL_16;
        }
        std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,_compareTopKCandidates,std::__wrap_iter<std::pair<NSString * {__strong},NSNumber * {__strong}> *>>(v63, *((uint64_t *)&v63 + 1), (uint64_t)&v65, (uint64_t)(*((void *)&v63 + 1) - v63) >> 4);
        std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__base_destruct_at_end[abi:ne180100]((uint64_t)&v63, *((void *)&v63 + 1) - 16);
      }
      float v57 = v17;
      id v58 = v18;
      size_t v20 = (void *)*((void *)&v63 + 1);
      if (*((void *)&v63 + 1) >= (unint64_t)v64)
      {
        uint64_t v21 = std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__push_back_slow_path<std::pair<NSString * {__strong},NSNumber * {__strong}> const&>((uint64_t *)&v63, (id *)&v57);
      }
      else
      {
        void *v20 = v57;
        v20[1] = v58;
        uint64_t v21 = (uint64_t)(v20 + 2);
      }
      *((void *)&v63 + 1) = v21;
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,_compareTopKCandidates &,std::__wrap_iter<std::pair<NSString * {__strong},NSNumber * {__strong}> *>>(v63, v21, (uint64_t)&v65, (v21 - (uint64_t)v63) >> 4);

LABEL_16:
    }
    uint64_t v14 = [v13 countByEnumeratingWithState:__p objects:&v67 count:16];
  }
  while (v14);
LABEL_18:

  float v22 = objc_opt_new();
  for (uint64_t j = (id *)v63; (void)v63 != *((void *)&v63 + 1); uint64_t j = (id *)v63)
  {
    id v24 = *j;
    id v25 = *(id *)(v63 + 8);
    [v22 setObject:v25 forKeyedSubscript:v24];
    std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,_compareTopKCandidates,std::__wrap_iter<std::pair<NSString * {__strong},NSNumber * {__strong}> *>>(v63, *((uint64_t *)&v63 + 1), (uint64_t)&v65, (uint64_t)(*((void *)&v63 + 1) - v63) >> 4);
    std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__base_destruct_at_end[abi:ne180100]((uint64_t)&v63, *((void *)&v63 + 1) - 16);
  }
  id v26 = (id)[v22 copy];

  float v57 = (void **)&v63;
  std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__destroy_vector::operator()[abi:ne180100](&v57);
LABEL_22:

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v27 = v26;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v51 objects:v66 count:16];
  if (!v28) {
    goto LABEL_65;
  }
  uint64_t v29 = *(void *)v52;
  while (2)
  {
    uint64_t v30 = 0;
    while (2)
    {
      if (*(void *)v52 != v29) {
        objc_enumerationMutation(v27);
      }
      float v31 = *(void **)(*((void *)&v51 + 1) + 8 * v30);
      float v32 = (void *)MEMORY[0x223C480D0]();
      __p[0] = 0;
      __p[1] = 0;
      *(void *)&long long v60 = 0;
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v31 UTF8String]);
      if (SBYTE7(v60) < 0)
      {
        unint64_t v33 = (unint64_t)__p[1];
        if (__p[1] < (void *)3)
        {
LABEL_62:
          operator delete(__p[0]);
          goto LABEL_63;
        }
LABEL_31:
        if (v33 <= 0x14)
        {
          unint64_t v34 = (char *)[v50 UTF8String];
          size_t v35 = strlen(v34);
          float v36 = (SBYTE7(v60) & 0x80u) == 0 ? (unsigned __int8 *)__p : (unsigned __int8 *)__p[0];
          unsigned int v37 = (SBYTE7(v60) & 0x80u) == 0 ? (void *)BYTE7(v60) : __p[1];
          float v38 = _weightedDistance((unsigned __int8 *)v34, v35, v36, (size_t)v37, 4.0, 1.2);
          unint64_t v39 = v35 <= (unint64_t)v37 ? (unint64_t)v37 : v35;
          if (v38 < fmaxf((float)v39, 4.0) && v38 >= 0.0)
          {
            if (v39)
            {
              float v40 = 1.0 - (float)(v38 / (float)v39);
              if (v40 >= 0.945)
              {
                unint64_t v41 = *((void *)&v55 + 1);
                if (*((void *)&v55 + 1) - (void)v55 == 160)
                {
                  if (*(float *)(v55 + 24) > v40) {
                    goto LABEL_61;
                  }
                  std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates,std::__wrap_iter<std::pair<std::string,float> *>>((std::string *)v55, *((uint64_t *)&v55 + 1), (uint64_t)&v67, 5);
                  unint64_t v41 = *((void *)&v55 + 1) - 32;
                  if (*(char *)(*((void *)&v55 + 1) - 9) < 0) {
                    operator delete(*(void **)v41);
                  }
                  *((void *)&v55 + 1) = v41;
                }
                if (SBYTE7(v60) < 0)
                {
                  std::string::__init_copy_ctor_external(&v67, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
                  unint64_t v41 = *((void *)&v55 + 1);
                }
                else
                {
                  *(_OWORD *)&v67.__r_.__value_.__l.__data_ = *(_OWORD *)__p;
                  v67.__r_.__value_.__r.__words[2] = v60;
                }
                float v68 = v40;
                if (v41 >= (unint64_t)v56)
                {
                  uint64_t v43 = std::vector<std::pair<std::string,float>>::__push_back_slow_path<std::pair<std::string,float> const&>((uint64_t *)&v55, (long long *)&v67);
                }
                else
                {
                  if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0)
                  {
                    std::string::__init_copy_ctor_external((std::string *)v41, v67.__r_.__value_.__l.__data_, v67.__r_.__value_.__l.__size_);
                  }
                  else
                  {
                    long long v42 = *(_OWORD *)&v67.__r_.__value_.__l.__data_;
                    *(void *)(v41 + 16) = *((void *)&v67.__r_.__value_.__l + 2);
                    *(_OWORD *)unint64_t v41 = v42;
                  }
                  *(float *)(v41 + 24) = v68;
                  uint64_t v43 = v41 + 32;
                }
                *((void *)&v55 + 1) = v43;
                std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates &,std::__wrap_iter<std::pair<std::string,float> *>>(v55, v43, (uint64_t)&v57, (v43 - (uint64_t)v55) >> 5);
                if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0) {
                  operator delete(v67.__r_.__value_.__l.__data_);
                }
              }
            }
          }
        }
LABEL_61:
        if ((SBYTE7(v60) & 0x80000000) == 0) {
          goto LABEL_63;
        }
        goto LABEL_62;
      }
      unint64_t v33 = BYTE7(v60);
      if (BYTE7(v60) >= 3u) {
        goto LABEL_31;
      }
LABEL_63:
      if (v28 != ++v30) {
        continue;
      }
      break;
    }
    uint64_t v28 = [v27 countByEnumeratingWithState:&v51 objects:v66 count:16];
    if (v28) {
      continue;
    }
    break;
  }
LABEL_65:

  unint64_t v44 = [MEMORY[0x263EFF980] array];
  for (k = (uint64_t *)v55; (void)v55 != *((void *)&v55 + 1); k = (uint64_t *)v55)
  {
    if (*((char *)k + 23) < 0) {
      k = (uint64_t *)*k;
    }
    uint64_t v46 = [NSString stringWithUTF8String:k];
    [v44 insertObject:v46 atIndex:0];
    std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates,std::__wrap_iter<std::pair<std::string,float> *>>((std::string *)v55, *((uint64_t *)&v55 + 1), (uint64_t)&v67, (uint64_t)(*((void *)&v55 + 1) - v55) >> 5);
    char v47 = (void **)(*((void *)&v55 + 1) - 32);
    if (*(char *)(*((void *)&v55 + 1) - 9) < 0) {
      operator delete(*v47);
    }
    *((void *)&v55 + 1) = v47;
  }
  BOOL v48 = (void *)[v44 copy];

  v67.__r_.__value_.__r.__words[0] = (std::string::size_type)&v55;
  std::vector<std::pair<std::string,float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v67);

  return v48;
}

void sub_21F243028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char **a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,void *__p,uint64_t a59,int a60,__int16 a61,char a62,char a63)
{
  a23 = &a36;
  std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a23);

  a36 = &a19;
  std::vector<std::pair<std::string,float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a36);

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

id getAppTokens(NSString *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = [(NSString *)v1 length];
  uint64_t v4 = *MEMORY[0x263F082D8];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = ___Z12getAppTokensP8NSString_block_invoke;
  v10[3] = &unk_264509150;
  id v5 = v1;
  unint64_t v11 = v5;
  id v6 = v2;
  id v12 = v6;
  -[NSString enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:](v5, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v3, v4, 6, 0, v10);
  id v7 = v12;
  id v8 = v6;

  return v8;
}

void sub_21F24327C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void ___Z12getAppTokensP8NSString_block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
  id v3 = [v2 localizedLowercaseString];

  [*(id *)(a1 + 40) addObject:v3];
}

void sub_21F243318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

BOOL isAppPrefixMatch(uint64_t a1, void *a2)
{
  if ([a2 rangeOfString:a1 options:9]) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = v2 == 0;
  }
  return !v3;
}

uint64_t isSpellCorrectionReady(NSString *a1, int a2)
{
  BOOL v3 = a1;
  uint64_t v4 = v3;
  if (!a2)
  {
    if ([(NSString *)v3 length] < 3) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 1;
    goto LABEL_6;
  }
  if ([(NSString *)v3 length] >= 2) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 0;
LABEL_6:

  return v5;
}

void sub_21F2433C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL skipAppSpellCorrection(NSString *a1, NSString *a2, char a3)
{
  uint64_t v5 = a1;
  id v6 = a2;
  if (a3)
  {
    BOOL v7 = 0;
  }
  else
  {
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v10 = [&unk_26D0C8E78 count];
      BOOL v7 = i < v10;
      if (i >= v10) {
        break;
      }
      if (v6)
      {
        if ([(NSString *)v5 length] >= 4)
        {
          unint64_t v11 = [&unk_26D0C8E78 objectAtIndexedSubscript:i];
          id v12 = [v11 objectAtIndexedSubscript:1];
          BOOL v13 = [(NSString *)v6 isEqualToString:v12];

          if (v13)
          {
            uint64_t v14 = [&unk_26D0C8E78 objectAtIndexedSubscript:i];
            uint64_t v15 = [v14 objectAtIndexedSubscript:0];
            uint64_t v16 = [v15 rangeOfString:v5 options:9];
            uint64_t v18 = v17;

            if (!v16)
            {
              if (v18) {
                break;
              }
            }
          }
        }
      }
    }
  }

  return v7;
}

void sub_21F243500(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float appErrorScore(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  float v7 = 0.0;
  if (isSpellCorrectionReady((NSString *)v5, a3))
  {
    if ((isSpellCorrectionReady((NSString *)v6, a3) & 1) != 0
      && !skipAppSpellCorrection((NSString *)v5, (NSString *)v6, a3))
    {
      unint64_t v8 = [v6 length];
      if (v8 >= [v5 length])
      {
        id v9 = [v5 lowercaseString];
        unint64_t v10 = (char *)[v9 UTF8String];
        size_t v11 = strlen(v10);
        id v12 = [v6 lowercaseString];
        BOOL v13 = (char *)[v12 UTF8String];
        size_t v14 = strlen(v13);
        float v15 = (float)(unint64_t)[v6 length];
        float v16 = _weightedDistance((unsigned __int8 *)v10, v11, (unsigned __int8 *)v13, v14, v15, 1.2);
        if (v11 <= v14) {
          unint64_t v17 = v14;
        }
        else {
          unint64_t v17 = v11;
        }
        if ((float)v17 <= v15) {
          float v18 = v15;
        }
        else {
          float v18 = (float)v17;
        }
        float v7 = 0.0;
        if (v16 < v18 && v17 && v16 >= 0.0) {
          float v7 = 1.0 - (float)(v16 / (float)v17);
        }
      }
    }
  }

  return v7;
}

void sub_21F2436A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getAppCorrectionIfAny(void *a1, void *a2, int a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  if (isSpellCorrectionReady((NSString *)v5, a3))
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v7);
          }
          size_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          float v12 = appErrorScore(v5, v11, a3);
          if (v12 > 0.91)
          {
            std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v11 UTF8String]);
            float v26 = -v12;
            uint64_t v13 = *((void *)&v31 + 1);
            if (*((void *)&v31 + 1) >= (unint64_t)v32)
            {
              uint64_t v15 = std::vector<std::pair<std::string,float>>::__push_back_slow_path<std::pair<std::string,float> const&>((uint64_t *)&v31, (long long *)__p);
            }
            else
            {
              if (SHIBYTE(v25) < 0)
              {
                std::string::__init_copy_ctor_external(*((std::string **)&v31 + 1), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
              }
              else
              {
                long long v14 = *(_OWORD *)__p;
                *(void *)(*((void *)&v31 + 1) + 16) = v25;
                *(_OWORD *)uint64_t v13 = v14;
              }
              *(float *)(v13 + 24) = v26;
              uint64_t v15 = v13 + 32;
            }
            *((void *)&v31 + 1) = v15;
            std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates &,std::__wrap_iter<std::pair<std::string,float> *>>(v31, v15, (uint64_t)&v33, (v15 - (uint64_t)v31) >> 5);
            if (SHIBYTE(v25) < 0) {
              operator delete(__p[0]);
            }
          }
          if ([v11 rangeOfString:v5 options:9]) {
            BOOL v17 = 1;
          }
          else {
            BOOL v17 = v16 == 0;
          }
          if (!v17)
          {

            float v22 = (void *)MEMORY[0x263EFFA68];
            goto LABEL_33;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v34 count:16];
      }
      while (v8);
    }

    float v22 = [MEMORY[0x263EFF980] array];
    if ((void)v31 != *((void *)&v31 + 1))
    {
      float v18 = 0.0;
      do
      {
        if ((unint64_t)[v22 count] > 2) {
          break;
        }
        float v19 = *(float *)(v31 + 24);
        if ((unint64_t)[v22 count] >= 2 && v19 < v18) {
          break;
        }
        size_t v20 = objc_msgSend(NSString, "stringWithUTF8String:");
        [v22 addObject:v20];
        std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates,std::__wrap_iter<std::pair<std::string,float> *>>((std::string *)v31, *((uint64_t *)&v31 + 1), (uint64_t)&v33, (uint64_t)(*((void *)&v31 + 1) - v31) >> 5);
        uint64_t v21 = (void **)(*((void *)&v31 + 1) - 32);
        if (*(char *)(*((void *)&v31 + 1) - 9) < 0) {
          operator delete(*v21);
        }
        *((void *)&v31 + 1) = v21;

        float v18 = v19;
      }
      while ((void)v31 != *((void *)&v31 + 1));
    }
LABEL_33:
    __p[0] = &v31;
    std::vector<std::pair<std::string,float>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  }
  else
  {
    float v22 = (void *)MEMORY[0x263EFFA68];
  }

  return v22;
}

void sub_21F2439F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, char *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25)
{
  __p = &a24;
  std::vector<std::pair<std::string,float>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  _Unwind_Resume(a1);
}

void *std::vector<float>::vector(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    id v6 = (_DWORD *)a1[1];
    id v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_21F243AF0(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x280], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264506258, MEMORY[0x263F8C060]);
}

void sub_21F243BE8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,_compareTopKCandidates,std::__wrap_iter<std::pair<NSString * {__strong},NSNumber * {__strong}> *>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    long long v7 = *(_OWORD *)a1;
    *(void *)a1 = 0;
    *(void *)(a1 + _Block_object_dispose(&STACK[0x280], 8) = 0;
    long long v11 = v7;
    uint64_t v8 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,_compareTopKCandidates &,std::__wrap_iter<std::pair<NSString * {__strong},NSNumber * {__strong}> *>>((id *)a1, a3, a4);
    uint64_t v9 = v8;
    unint64_t v10 = (id *)(a2 - 16);
    if (v10 == v8)
    {
      std::pair<NSString * {__strong},NSNumber * {__strong}>::operator=[abi:ne180100](v8, (id *)&v11);
    }
    else
    {
      std::pair<NSString * {__strong},NSNumber * {__strong}>::operator=[abi:ne180100](v8, v10);
      std::pair<NSString * {__strong},NSNumber * {__strong}>::operator=[abi:ne180100](v10, (id *)&v11);
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,_compareTopKCandidates &,std::__wrap_iter<std::pair<NSString * {__strong},NSNumber * {__strong}> *>>(a1, (uint64_t)(v9 + 2), a3, ((uint64_t)v9 - a1 + 16) >> 4);
    }
  }
}

void sub_21F243D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

id *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,_compareTopKCandidates &,std::__wrap_iter<std::pair<NSString * {__strong},NSNumber * {__strong}> *>>(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 0;
  uint64_t v6 = a3 - 2;
  if (a3 < 2) {
    uint64_t v6 = a3 - 1;
  }
  uint64_t v7 = v6 >> 1;
  do
  {
    uint64_t v8 = &a1[2 * v5 + 2];
    uint64_t v9 = (2 * v5) | 1;
    uint64_t v10 = 2 * v5 + 2;
    if (v10 < a3)
    {
      uint64_t v11 = [v8[1] compare:v8[3]];
      v8 += 2 * (v11 > 0);
      if (v11 > 0) {
        uint64_t v9 = v10;
      }
    }
    std::pair<NSString * {__strong},NSNumber * {__strong}>::operator=[abi:ne180100](a1, v8);
    a1 = v8;
    uint64_t v5 = v9;
  }
  while (v9 <= v7);
  return v8;
}

id *std::pair<NSString * {__strong},NSNumber * {__strong}>::operator=[abi:ne180100](id *a1, id *a2)
{
  return a1;
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,_compareTopKCandidates &,std::__wrap_iter<std::pair<NSString * {__strong},NSNumber * {__strong}> *>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v7 = v4 >> 1;
    if ([*(id *)(a1 + 16 * (v4 >> 1) + 8) compare:*(void *)(a2 - 8)] >= 1)
    {
      uint64_t v10 = *(void **)(a2 - 16);
      uint64_t v9 = *(void **)(a2 - 8);
      uint64_t v8 = a2 - 16;
      *(void *)uint64_t v8 = 0;
      *(void *)(v8 + _Block_object_dispose(&STACK[0x280], 8) = 0;
      id v12 = v10;
      id v13 = v9;
      do
      {
        uint64_t v11 = (id *)v8;
        uint64_t v8 = a1 + 16 * v7;
        std::pair<NSString * {__strong},NSNumber * {__strong}>::operator=[abi:ne180100](v11, (id *)v8);
        if (!v7) {
          break;
        }
        unint64_t v7 = (v7 - 1) >> 1;
      }
      while (objc_msgSend(*(id *)(a1 + 16 * v7 + 8), "compare:", v9, v12, v13) > 0);
      std::pair<NSString * {__strong},NSNumber * {__strong}>::operator=[abi:ne180100]((id *)v8, &v12);
    }
  }
}

void sub_21F243ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__base_destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 8); i != a2; i -= 16)
  {

    uint64_t v5 = *(void **)(i - 16);
  }
  *(void *)(a1 + _Block_object_dispose(&STACK[0x280], 8) = a2;
}

uint64_t std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__push_back_slow_path<std::pair<NSString * {__strong},NSNumber * {__strong}> const&>(uint64_t *a1, id *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 4;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 3 > v5) {
    unint64_t v5 = v8 >> 3;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  v14[4] = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<NSString * {__strong},NSNumber * {__strong}>>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = &v10[16 * v4];
  v14[0] = v10;
  v14[1] = v11;
  v14[3] = &v10[16 * v9];
  *(void *)uint64_t v11 = *a2;
  *((void *)v11 + 1) = a2[1];
  void v14[2] = v11 + 16;
  std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__swap_out_circular_buffer(a1, v14);
  uint64_t v12 = a1[1];
  std::__split_buffer<std::pair<NSString * {__strong},NSNumber * {__strong}>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_21F24401C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::pair<NSString * {__strong},NSNumber * {__strong}>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__swap_out_circular_buffer(void *result, void *a2)
{
  uint64_t v3 = (void *)*result;
  uint64_t v2 = (void *)result[1];
  uint64_t v4 = a2[1];
  while (v2 != v3)
  {
    long long v5 = *((_OWORD *)v2 - 1);
    v2 -= 2;
    void *v2 = 0;
    v2[1] = 0;
    *(_OWORD *)(v4 - 16) = v5;
    v4 -= 16;
  }
  a2[1] = v4;
  uint64_t v6 = (void *)*result;
  std::logic_error *result = v4;
  a2[1] = v6;
  uint64_t v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<NSString * {__strong},NSNumber * {__strong}>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

uint64_t std::__split_buffer<std::pair<NSString * {__strong},NSNumber * {__strong}>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 16); i != a2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 16;
  }
}

void std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = (uint64_t *)*a1;
  if (*v2)
  {
    std::vector<std::pair<NSString * {__strong},NSNumber * {__strong}>>::__base_destruct_at_end[abi:ne180100]((uint64_t)v2, *v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::pair<std::string,float>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::pair<std::string,float>>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::pair<std::string,float>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32)
  {
    if (*(char *)(i - 9) < 0) {
      operator delete(*(void **)(i - 32));
    }
  }
  a1[1] = v2;
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates,std::__wrap_iter<std::pair<std::string,float> *>>(std::string *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    *(_OWORD *)__p = 0u;
    long long v12 = 0u;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)__p, this->__r_.__value_.__l.__data_, this->__r_.__value_.__l.__size_);
    }
    else
    {
      long long v8 = *(_OWORD *)&this->__r_.__value_.__l.__data_;
      *(void *)&long long v12 = *((void *)&this->__r_.__value_.__l + 2);
      *(_OWORD *)__p = v8;
    }
    DWORD2(v12) = this[1].__r_.__value_.__l.__data_;
    unint64_t v9 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates &,std::__wrap_iter<std::pair<std::string,float> *>>(this, a3, a4);
    uint64_t v10 = v9;
    if ((std::string *)(a2 - 32) == v9)
    {
      std::string::operator=(v9, (const std::string *)__p);
      LODWORD(v10[1].__r_.__value_.__l.__data_) = DWORD2(v12);
    }
    else
    {
      std::string::operator=(v9, (const std::string *)(a2 - 32));
      LODWORD(v10[1].__r_.__value_.__l.__data_) = *(_DWORD *)(a2 - 8);
      std::string::operator=((std::string *)(a2 - 32), (const std::string *)__p);
      *(_DWORD *)(a2 - _Block_object_dispose(&STACK[0x280], 8) = DWORD2(v12);
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates &,std::__wrap_iter<std::pair<std::string,float> *>>((uint64_t)this, (uint64_t)&v10[1].__r_.__value_.__l.__size_, a3, ((char *)&v10[1].__r_.__value_.__r.__words[1] - (char *)this) >> 5);
    }
    if (SBYTE7(v12) < 0) {
      operator delete(__p[0]);
    }
  }
}

void sub_21F24442C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates &,std::__wrap_iter<std::pair<std::string,float> *>>(std::string *this, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 0;
  uint64_t v6 = a3 - 2;
  if (a3 < 2) {
    uint64_t v6 = a3 - 1;
  }
  uint64_t v7 = v6 >> 1;
  do
  {
    long long v8 = this;
    this = (std::string *)((char *)this + 32 * v5 + 32);
    uint64_t v9 = 2 * v5;
    uint64_t v5 = (2 * v5) | 1;
    uint64_t v10 = v9 + 2;
    if (v10 < a3 && *(float *)&this[1].__r_.__value_.__l.__data_ > *(float *)&this[2].__r_.__value_.__r.__words[1])
    {
      this = (std::string *)((char *)this + 32);
      uint64_t v5 = v10;
    }
    std::string::operator=(v8, this);
    LODWORD(v8[1].__r_.__value_.__l.__data_) = this[1].__r_.__value_.__l.__data_;
  }
  while (v5 <= v7);
  return this;
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,_compareCorectionCandidates &,std::__wrap_iter<std::pair<std::string,float> *>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v7 = v4 >> 1;
    float v8 = *(float *)(a2 - 8);
    if (*(float *)(a1 + 32 * (v4 >> 1) + 24) > v8)
    {
      uint64_t v9 = (std::string *)(a2 - 32);
      *(_OWORD *)__p = 0u;
      long long v13 = 0u;
      if (*(char *)(a2 - 9) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)__p, *(const std::string::value_type **)(a2 - 32), *(void *)(a2 - 24));
        float v8 = *(float *)(a2 - 8);
      }
      else
      {
        long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
        *(void *)&long long v13 = *(void *)(a2 - 16);
        *(_OWORD *)__p = v10;
      }
      *((float *)&v13 + 2) = v8;
      do
      {
        uint64_t v11 = (std::string *)(a1 + 32 * v7);
        std::string::operator=(v9, v11);
        LODWORD(v9[1].__r_.__value_.__l.__data_) = v11[1].__r_.__value_.__l.__data_;
        if (!v7) {
          break;
        }
        unint64_t v7 = (v7 - 1) >> 1;
        uint64_t v9 = v11;
      }
      while (*(float *)(a1 + 32 * v7 + 24) > *((float *)&v13 + 2));
      std::string::operator=(v11, (const std::string *)__p);
      LODWORD(v11[1].__r_.__value_.__l.__data_) = DWORD2(v13);
      if (SBYTE7(v13) < 0) {
        operator delete(__p[0]);
      }
    }
  }
}

void sub_21F2445EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    float v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t std::vector<std::pair<std::string,float>>::__push_back_slow_path<std::pair<std::string,float> const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 5;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 59) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 4 > v5) {
    unint64_t v5 = v8 >> 4;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0) {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  float v18 = a1 + 2;
  if (v9) {
    long long v10 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,float>>>(v7, v9);
  }
  else {
    long long v10 = 0;
  }
  uint64_t v11 = (std::string *)&v10[8 * v4];
  v15[0] = v10;
  v15[1] = v11;
  uint64_t v16 = v11;
  BOOL v17 = (char *)&v10[8 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    uint64_t v11 = v16;
  }
  else
  {
    long long v12 = *a2;
    v11->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
  }
  v10[8 * v4 + 6] = *((_DWORD *)a2 + 6);
  uint64_t v16 = (std::string *)((char *)v11 + 32);
  std::vector<std::pair<std::string,float>>::__swap_out_circular_buffer(a1, v15);
  uint64_t v13 = a1[1];
  std::__split_buffer<std::pair<std::string,float>>::~__split_buffer((uint64_t)v15);
  return v13;
}

void sub_21F2447A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::pair<std::string,float>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::pair<std::string,float>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,float>>,std::reverse_iterator<std::pair<std::string,float>*>,std::reverse_iterator<std::pair<std::string,float>*>,std::reverse_iterator<std::pair<std::string,float>*>>((uint64_t)(a1 + 2), a1[1], (long long *)a1[1], *a1, (long long *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,float>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,float>>,std::reverse_iterator<std::pair<std::string,float>*>,std::reverse_iterator<std::pair<std::string,float>*>,std::reverse_iterator<std::pair<std::string,float>*>>(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, long long *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  uint64_t v15 = a6;
  uint64_t v16 = a7;
  if (a3 != a5)
  {
    unint64_t v9 = (const std::string::value_type **)a3;
    do
    {
      long long v10 = (std::string *)(v7 - 32);
      uint64_t v11 = (long long *)(v9 - 4);
      if (*((char *)v9 - 9) < 0)
      {
        std::string::__init_copy_ctor_external(v10, *(v9 - 4), (std::string::size_type)*(v9 - 3));
        uint64_t v13 = v16;
      }
      else
      {
        long long v12 = *v11;
        *(void *)(v7 - 16) = *(v9 - 2);
        *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v12;
        uint64_t v13 = v7;
      }
      *(_DWORD *)(v7 - _Block_object_dispose(&STACK[0x280], 8) = *((_DWORD *)v9 - 2);
      uint64_t v7 = v13 - 32;
      uint64_t v16 = v13 - 32;
      v9 -= 4;
    }
    while (v11 != a5);
    return v15;
  }
  return a6;
}

void sub_21F24492C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  if (!a12) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,float>>,std::reverse_iterator<std::pair<std::string,float>*>>::operator()[abi:ne180100]((uint64_t)&a9);
  }
  _Unwind_Resume(exception_object);
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,float>>,std::reverse_iterator<std::pair<std::string,float>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 32;
  }
}

uint64_t std::__split_buffer<std::pair<std::string,float>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::pair<std::string,float>>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 4;
      *(void *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

uint64_t json_utf8_string(uint64_t result, unsigned char *a2, unint64_t a3)
{
  if (result)
  {
    uint64_t v3 = *(char **)(result + 8);
    if (*(_DWORD *)result == 5)
    {
      uint64_t v4 = *(void *)(result + 16);
      unint64_t v5 = (unint64_t)&a2[a3];
      uint64_t v6 = a2;
      if (v4 >= 1)
      {
        unint64_t v7 = (unint64_t)&v3[v4];
        uint64_t v8 = a2;
        do
        {
          unint64_t v9 = *v3;
          if ((json_char_table[v9] & 0x40) != 0)
          {
            long long v14 = (unsigned __int8 *)(v3 + 2);
            uint64_t v15 = v3[1];
            int v16 = json_char_table[v15];
            if ((v16 & 0x10000) != 0)
            {
              if ((v16 & 0x40) != 0)
              {
                do
                {
                  if ((unint64_t)v14 >= v7) {
                    break;
                  }
                  int v19 = *v14++;
                }
                while ((json_char_table[v19] & 0x40) != 0);
              }
              if ((unint64_t)v14 <= v7 - 4)
              {
                uint64_t v20 = 0;
                int v21 = 0;
                do
                {
                  uint64_t v22 = v14[v20];
                  int v23 = (char)v22;
                  int v24 = json_char_table[v22];
                  int v25 = (v23 - 87) | (16 * v21);
                  if ((v24 & 0x10) == 0) {
                    int v25 = v21;
                  }
                  if ((v24 & 8) != 0) {
                    int v25 = (v23 - 55) | (16 * v21);
                  }
                  int v21 = (v23 - 48) | (16 * v21);
                  if ((v24 & 2) == 0) {
                    int v21 = v25;
                  }
                  ++v20;
                }
                while (v20 != 4);
                unsigned int v26 = (unsigned __int16)v21;
                if ((uint64_t)(v7 - (void)v14) < 5)
                {
                  uint64_t v11 = v14;
                }
                else
                {
                  uint64_t v11 = v14 + 4;
                  if ((unint64_t)(v14 + 5) < v7
                    && (unsigned __int16)((unsigned __int16)v21 >> 11) >= 0x1Bu
                    && (unsigned __int16)((unsigned __int16)v21 >> 10) <= 0x36u
                    && (json_char_table[*v11] & 0x40) != 0
                    && (uint64_t)(v7 - (void)v11) >= 3
                    && (json_char_table[v14[5]] & 0x10000) != 0)
                  {
                    uint64_t v27 = 0;
                    int v28 = 0;
                    uint64_t v11 = v14 + 6;
                    do
                    {
                      uint64_t v29 = v11[v27];
                      int v30 = (char)v29;
                      int v31 = json_char_table[v29];
                      int v32 = (v30 - 87) | (16 * v28);
                      if ((v31 & 0x10) == 0) {
                        int v32 = v28;
                      }
                      if ((v31 & 8) != 0) {
                        int v32 = (v30 - 55) | (16 * v28);
                      }
                      int v28 = (v30 - 48) | (16 * v28);
                      if ((v31 & 2) == 0) {
                        int v28 = v32;
                      }
                      ++v27;
                    }
                    while (v27 != 4);
                    int v33 = (unsigned __int16)v28 >> 10;
                    int v34 = ((unsigned __int16)v28 + 9216) | ((v26 << 10) - 56623104);
                    uint64_t v35 = v14 + 12;
                    if ((uint64_t)(v7 - (void)v11) <= 6) {
                      uint64_t v35 = v11;
                    }
                    if (v33 == 55)
                    {
                      uint64_t v11 = v35;
                      unsigned int v26 = v34;
                    }
                  }
                }
                if ((int)v26 >= 128)
                {
                  if (v26 >= 0x800)
                  {
                    uint64_t v37 = 4 * (v26 < 0x110000);
                    if (v26 < 0x10000) {
                      uint64_t v37 = 3;
                    }
                    uint64_t v6 = &v8[v37];
                    if ((unint64_t)&v8[v37] < v5)
                    {
                      if (!HIWORD(v26))
                      {
                        v8[2] = v26 & 0x3F | 0x80;
                        v8[1] = (v26 >> 6) & 0x3F | 0x80;
                        unsigned int v26 = (v26 >> 12) | 0xFFFFFFE0;
                        uint64_t v36 = 3;
                        goto LABEL_75;
                      }
                      if (HIWORD(v26) > 0x10u)
                      {
                        uint64_t v36 = 0;
                      }
                      else
                      {
                        v8[3] = v26 & 0x3F | 0x80;
                        v8[2] = (v26 >> 6) & 0x3F | 0x80;
                        v8[1] = (v26 >> 12) & 0x3F | 0x80;
                        unsigned int v26 = (v26 >> 18) | 0xFFFFFFF0;
                        uint64_t v36 = 4;
LABEL_75:
                        *uint64_t v8 = v26;
                      }
                      uint64_t v6 = &v8[v36];
                      goto LABEL_77;
                    }
                  }
                  else
                  {
                    uint64_t v6 = v8 + 2;
                    if ((unint64_t)(v8 + 2) < v5)
                    {
                      v8[1] = v26 & 0x3F | 0x80;
                      unsigned int v26 = (v26 >> 6) | 0xFFFFFFC0;
                      uint64_t v36 = 2;
                      goto LABEL_75;
                    }
                  }
                }
                else
                {
                  uint64_t v6 = v8 + 1;
                  if ((unint64_t)(v8 + 1) < v5)
                  {
                    uint64_t v36 = 1;
                    goto LABEL_75;
                  }
                }
                if (v8 + 1 == (unsigned char *)v5)
                {
LABEL_72:
                  *uint64_t v8 = 0;
                  goto LABEL_77;
                }
              }
              else
              {
                uint64_t v11 = v14;
              }
              uint64_t v6 = v8;
            }
            else
            {
              if ((v16 & 0x1E0) != 0)
              {
                HIDWORD(v1_Block_object_dispose(&STACK[0x280], 8) = v15;
                LODWORD(v1_Block_object_dispose(&STACK[0x280], 8) = v15 - 98;
                unsigned int v17 = v18 >> 1;
                if (v17 <= 9 && ((0x345u >> v17) & 1) != 0) {
                  LOBYTE(v15) = byte_21F26B130[v17];
                }
              }
              uint64_t v6 = v8 + 1;
              if ((unint64_t)(v8 + 1) >= v5)
              {
                if (v8 + 1 == (unsigned char *)v5)
                {
                  *uint64_t v8 = 0;
                  uint64_t v11 = v14;
                  uint64_t v6 = (unsigned char *)v5;
                  goto LABEL_77;
                }
              }
              else
              {
                *uint64_t v8 = v15;
              }
              uint64_t v11 = v14;
            }
          }
          else
          {
            uint64_t v10 = utf8_byte_length_noerror_utf8_len_table[v9 >> 4];
            uint64_t v6 = &v8[v10];
            uint64_t v11 = (unsigned __int8 *)&v3[v10];
            if ((unint64_t)&v8[v10] < v5 && (unint64_t)v11 <= v7)
            {
              do
              {
                char v13 = *v3++;
                *v8++ = v13;
                --v10;
              }
              while (v10);
              goto LABEL_77;
            }
            if (v8 + 1 == (unsigned char *)v5) {
              goto LABEL_72;
            }
          }
LABEL_77:
          uint64_t v8 = v6;
          uint64_t v3 = (char *)v11;
        }
        while ((unint64_t)v11 < v7);
      }
      if ((unint64_t)v6 < v5) {
        *uint64_t v6 = 0;
      }
      uint64_t v40 = v6 - a2;
      return v40 + 1;
    }
    if (v3)
    {
      unint64_t v38 = *(void *)(result + 16);
      if (v38)
      {
        if (v38 >= a3)
        {
          if (!a3)
          {
LABEL_99:
            uint64_t v40 = *(void *)(result + 16);
            return v40 + 1;
          }
          unint64_t v38 = a3 - 1;
          if (a3 != 1)
          {
            unint64_t v41 = a2;
            unint64_t v42 = a3 - 1;
            do
            {
              char v43 = *v3++;
              *v41++ = v43;
              --v42;
            }
            while (v42);
          }
        }
        else
        {
          for (uint64_t i = 0; i != v38; ++i)
            a2[i] = v3[i];
        }
        a2[v38] = 0;
        goto LABEL_99;
      }
    }
    uint64_t result = 0;
    if (!a2) {
      return result;
    }
  }
  else if (!a2)
  {
    return result;
  }
  if (a3)
  {
    uint64_t result = 0;
    *a2 = 0;
  }
  return result;
}

uint64_t json_parse()
{
  uint64_t v0 = (char *)MEMORY[0x270FA5388]();
  uint64_t v3 = v2;
  unint64_t v5 = v4;
  char v7 = v6;
  uint64_t v8 = v0;
  uint64_t v59 = *MEMORY[0x263EF8340];
  long long v54 = v0;
  size_t v55 = 0;
  long long v56 = 0;
  float v57 = v0;
  if ((v1 & 0x8000000000000000) != 0)
  {
    if (!v0)
    {
      unint64_t v9 = 0;
      long long v56 = 0;
      uint64_t v51 = 0;
      long long v52 = 0;
      uint64_t v53 = 0;
      char v50 = 0;
LABEL_236:
      uint64_t v11 = v8;
LABEL_237:
      if (v9 == v11) {
        goto LABEL_250;
      }
      while (1)
      {
        uint64_t v47 = v11 >= v9 ? 0 : *v11;
        if ((json_char_table[v47] & 1) == 0) {
          break;
        }
        if (v9 - v11 >= 1) {
          long long v54 = ++v11;
        }
      }
      if (v7)
      {
LABEL_250:
        unint64_t v9 = v11;
      }
      else if (v9 != v11)
      {
        goto LABEL_246;
      }
      if (v5) {
        *unint64_t v5 = v9 - v8;
      }
      return 1;
    }
    size_t v1 = strlen(v0);
  }
  unint64_t v9 = &v8[v1];
  size_t v55 = v1;
  long long v56 = &v8[v1];
  uint64_t v51 = 0;
  long long v52 = 0;
  uint64_t v53 = 0;
  char v50 = 0;
  if (!v1) {
    goto LABEL_236;
  }
  int v49 = v5;
  bzero(v58, 0x1000uLL);
  LODWORD(v10) = 0;
  while (1)
  {
    uint64_t v11 = v54;
    long long v12 = v56;
    if (v54 >= v56) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = *v54;
    }
    int v14 = json_char_table[v13];
    if ((v14 & 0x20) != 0)
    {
      if (!jscon_scan_string(&v54, (uint64_t)&v51)) {
        goto LABEL_248;
      }
      if ((int)v10 >= 1023)
      {
        uint64_t v11 = v54;
        goto LABEL_246;
      }
      goto LABEL_16;
    }
    if ((v14 & 0x202) != 0) {
      break;
    }
    if (v13 == 91)
    {
      if (v56 - v54 >= 1) {
        uint64_t v11 = ++v54;
      }
      if ((int)v10 >= 1023) {
        goto LABEL_246;
      }
      uint64_t v10 = (int)v10 + 1;
      v58[v10] = 2;
      (*(void (**)(uint64_t, uint64_t, void, char *))(v3 + 16))(v3, 4, 0, &v50);
      if (v11 >= v12) {
        uint64_t v41 = 0;
      }
      else {
        uint64_t v41 = *v11;
      }
      if (json_char_table[v41])
      {
        unint64_t v42 = v54;
        while (1)
        {
          if (v11 >= v12)
          {
            if ((json_char_table[0] & 1) == 0)
            {
              long long v54 = v42;
              goto LABEL_151;
            }
          }
          else
          {
            uint64_t v41 = *v11;
            if ((json_char_table[v41] & 1) == 0)
            {
              long long v54 = v42;
              break;
            }
          }
          if (v12 - v11 >= 1) {
            unint64_t v42 = ++v11;
          }
        }
      }
      if (v41 != 93) {
        goto LABEL_151;
      }
      if (v12 - v11 >= 1) {
        long long v54 = v11 + 1;
      }
      v58[v10] = 1;
      unsigned int v17 = *(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16);
      uint64_t v19 = v3;
      uint64_t v20 = 5;
      goto LABEL_189;
    }
    if (v13 != 123)
    {
      if ((v14 & 0xE000) == 0)
      {
        if ((v14 & 1) == 0) {
          goto LABEL_246;
        }
        unint64_t v44 = v54;
        while (1)
        {
          uint64_t v45 = v11 >= v56 ? 0 : *v11;
          if ((json_char_table[v45] & 1) == 0) {
            break;
          }
          if (v56 - v11 >= 1) {
            unint64_t v44 = ++v11;
          }
        }
        long long v54 = v44;
        goto LABEL_151;
      }
      long long v52 = v54;
      if (v56 - v54 < 5)
      {
        if (v56 - v54 != 4) {
          goto LABEL_246;
        }
LABEL_200:
        if (*(_DWORD *)v54 == 1702195828)
        {
          LODWORD(v51) = 2;
        }
        else
        {
          if (*(_DWORD *)v54 != 1819047278) {
            goto LABEL_246;
          }
          LODWORD(v51) = 1;
        }
        uint64_t v53 = 4;
        uint64_t v11 = v54 + 4;
      }
      else
      {
        if (*(_DWORD *)v54 != 1936482662 || v54[4] != 101) {
          goto LABEL_200;
        }
        LODWORD(v51) = 3;
        uint64_t v53 = 5;
        uint64_t v11 = v54 + 5;
      }
      long long v54 = v11;
      if ((int)v10 >= 1023) {
        goto LABEL_246;
      }
LABEL_16:
      uint64_t v10 = (int)v10 + 1;
      v58[v10] = 1;
      unsigned int v17 = *(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16);
      unint64_t v18 = &v51;
      uint64_t v19 = v3;
      uint64_t v20 = 6;
LABEL_17:
      v17(v19, v20, v18, &v50);
      goto LABEL_78;
    }
    if (v56 - v54 >= 1) {
      uint64_t v11 = ++v54;
    }
    if ((int)v10 >= 1023) {
      goto LABEL_246;
    }
    uint64_t v10 = (int)v10 + 1;
    v58[v10] = 3;
    (*(void (**)(uint64_t, uint64_t, void, char *))(v3 + 16))(v3, 1, 0, &v50);
    if (v11 >= v12) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = *v11;
    }
    int v22 = json_char_table[v21];
    if ((v22 & 1) == 0) {
      goto LABEL_179;
    }
    int v23 = v54;
    while (v11 < v12)
    {
      uint64_t v21 = *v11;
      int v22 = json_char_table[v21];
      if ((v22 & 1) == 0)
      {
        long long v54 = v23;
LABEL_179:
        if ((v22 & 0x20) != 0) {
          goto LABEL_218;
        }
        if (v21 != 125) {
          goto LABEL_246;
        }
        if (v12 - v11 >= 1) {
          long long v54 = v11 + 1;
        }
        v58[v10] = 1;
        unsigned int v17 = *(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16);
        uint64_t v19 = v3;
        uint64_t v20 = 3;
LABEL_189:
        unint64_t v18 = 0;
        goto LABEL_17;
      }
LABEL_29:
      if (v12 - v11 >= 1) {
        int v23 = ++v11;
      }
    }
    if (json_char_table[0]) {
      goto LABEL_29;
    }
    long long v54 = v23;
    if ((json_char_table[0] & 0x20) == 0) {
      goto LABEL_246;
    }
LABEL_218:
    if (!jscon_scan_string(&v54, (uint64_t)&v51)) {
      goto LABEL_248;
    }
    uint64_t v11 = v54;
    if (v54 >= v56) {
      uint64_t v46 = 0;
    }
    else {
      uint64_t v46 = *v54;
    }
    if (json_char_table[v46])
    {
      unint64_t v38 = v54;
      while (1)
      {
        if (v11 >= v56)
        {
          if ((json_char_table[0] & 1) == 0)
          {
LABEL_258:
            long long v54 = v38;
            goto LABEL_246;
          }
        }
        else
        {
          uint64_t v46 = *v11;
          if ((json_char_table[v46] & 1) == 0)
          {
            long long v54 = v38;
            break;
          }
        }
        if (v56 - v11 >= 1) {
          unint64_t v38 = ++v11;
        }
      }
    }
    if (v46 != 58) {
      goto LABEL_246;
    }
    if (v56 - v11 >= 1) {
      long long v54 = v11 + 1;
    }
LABEL_150:
    v58[v10] = 4;
    (*(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16))(v3, 2, &v51, &v50);
LABEL_151:
    if (v50) {
      return 0;
    }
  }
  long long v52 = v54;
  LODWORD(v51) = 6;
  if (v54 >= v56) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = *v54;
  }
  if ((json_char_table[v15] & 0x200) != 0)
  {
    int v16 = v54;
    if (v56 - v54 >= 1) {
      int v16 = ++v54;
    }
    if (v16 >= v56) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = *v16;
    }
  }
  else
  {
    int v16 = v54;
  }
  if ((json_char_table[v15] & 4) != 0)
  {
    if (v56 - v16 >= 1) {
      long long v54 = ++v16;
    }
    if (v16 >= v56) {
      uint64_t v26 = 0;
    }
    else {
      uint64_t v26 = *v16;
    }
    int v27 = json_char_table[v26];
    if ((v27 & 0x800) != 0)
    {
      if (v56 - v16 <= 0) {
        goto LABEL_61;
      }
      goto LABEL_60;
    }
    if ((v27 & 0x1000) == 0)
    {
      if ((v27 & 2) == 0) {
        goto LABEL_74;
      }
      if (v56 - v16 > 0) {
        ++v16;
      }
LABEL_256:
      LODWORD(v51) = 0;
      uint64_t v11 = v16;
      goto LABEL_247;
    }
    if (v56 - v16 <= 0) {
      goto LABEL_129;
    }
LABEL_128:
    long long v54 = ++v16;
    goto LABEL_129;
  }
  LOWORD(v24) = json_char_table[0];
  while (2)
  {
    uint64_t v25 = v56 - v16;
LABEL_40:
    if (v16 >= v56)
    {
      if ((json_char_table[0] & 2) == 0) {
        goto LABEL_55;
      }
LABEL_42:
      if (v25 >= 1)
      {
        long long v54 = ++v16;
        continue;
      }
      goto LABEL_40;
    }
    break;
  }
  if ((json_char_table[*v16] & 2) != 0) {
    goto LABEL_42;
  }
  int v24 = json_char_table[*v16];
LABEL_55:
  if ((v24 & 0x1000) != 0)
  {
    if (v25 <= 0)
    {
LABEL_129:
      LODWORD(v51) = 7;
      if (v16 >= v56) {
        uint64_t v39 = 0;
      }
      else {
        uint64_t v39 = *v16;
      }
      if (v56 - v16 >= 1 && (json_char_table[v39] & 0x600) != 0) {
LABEL_133:
      }
        long long v54 = ++v16;
      while (1)
      {
        uint64_t v40 = v16 >= v56 ? 0 : *v16;
        if ((json_char_table[v40] & 2) == 0) {
          goto LABEL_74;
        }
        if (v56 - v16 >= 1) {
          goto LABEL_133;
        }
      }
    }
    goto LABEL_128;
  }
  if ((v24 & 0x800) == 0) {
    goto LABEL_74;
  }
  if (v25 >= 1) {
LABEL_60:
  }
    long long v54 = ++v16;
LABEL_61:
  LODWORD(v51) = 7;
  if (v16 >= v56)
  {
    uint64_t v28 = 0;
  }
  else
  {
    long long v54 = v16 + 1;
    uint64_t v28 = *v16++;
  }
  if ((json_char_table[v28] & 2) == 0) {
    goto LABEL_256;
  }
  LOWORD(v29) = json_char_table[0];
  while (2)
  {
    uint64_t v30 = v56 - v16;
LABEL_66:
    if (v16 >= v56)
    {
      if ((json_char_table[0] & 2) == 0) {
        goto LABEL_73;
      }
LABEL_68:
      if (v30 >= 1)
      {
        long long v54 = ++v16;
        continue;
      }
      goto LABEL_66;
    }
    break;
  }
  if ((json_char_table[*v16] & 2) != 0) {
    goto LABEL_68;
  }
  int v29 = json_char_table[*v16];
LABEL_73:
  if ((v29 & 0x1000) != 0)
  {
    if (v30 < 1) {
      goto LABEL_129;
    }
    goto LABEL_128;
  }
LABEL_74:
  if (v16 > v56)
  {
    long long v54 = v56;
    int v16 = v56;
  }
  uint64_t v53 = v16 - v11;
  (*(void (**)(uint64_t, uint64_t, uint64_t *, char *))(v3 + 16))(v3, 6, &v51, &v50);
  if ((int)v10 >= 1023) {
    goto LABEL_256;
  }
  uint64_t v10 = (int)v10 + 1;
  v58[v10] = 1;
LABEL_78:
  unint64_t v9 = v56;
  uint64_t v11 = v54;
  while (2)
  {
    if (v11 >= v9) {
      uint64_t v31 = 0;
    }
    else {
      uint64_t v31 = *v11;
    }
    if (json_char_table[v31])
    {
      while (1)
      {
        uint64_t v32 = v11 >= v9 ? 0 : *v11;
        if ((json_char_table[v32] & 1) == 0) {
          break;
        }
        if (v9 - v11 >= 1) {
          long long v54 = ++v11;
        }
      }
      if (v11 < v9)
      {
        uint64_t v31 = *v11;
        break;
      }
      uint64_t v31 = 0;
LABEL_91:
      int v33 = v58[v10 - 1];
      if (v33 == 2)
      {
        if (v31 != 93) {
          goto LABEL_151;
        }
        if (v9 - v11 >= 1) {
          long long v54 = ++v11;
        }
        uint64_t v34 = 5;
      }
      else
      {
        if (v33 != 4)
        {
          if (v33) {
            goto LABEL_151;
          }
          unint64_t v5 = v49;
          goto LABEL_237;
        }
        if (v31 != 125) {
          goto LABEL_151;
        }
        if (v9 - v11 >= 1) {
          long long v54 = ++v11;
        }
        uint64_t v34 = 3;
      }
      v58[v10 - 1] = 1;
      (*(void (**)(uint64_t, uint64_t, void, char *))(v3 + 16))(v3, v34, 0, &v50);
      --v10;
      continue;
    }
    break;
  }
  if (v31 != 44) {
    goto LABEL_91;
  }
  uint64_t v10 = (int)v10 - 1;
  int v35 = v58[v10];
  if (v35 == 2)
  {
    if (v9 - v11 >= 1) {
      long long v54 = v11 + 1;
    }
    goto LABEL_151;
  }
  if (v35 == 4)
  {
    if (v9 - v11 >= 1) {
      long long v54 = ++v11;
    }
    v58[v10] = 3;
    if (v11 >= v9) {
      uint64_t v36 = 0;
    }
    else {
      uint64_t v36 = *v11;
    }
    if (json_char_table[v36])
    {
      while (1)
      {
        if (v11 >= v9)
        {
          if ((json_char_table[0] & 1) == 0)
          {
            uint64_t v36 = 0;
            break;
          }
        }
        else
        {
          uint64_t v36 = *v11;
          if ((json_char_table[v36] & 1) == 0) {
            break;
          }
        }
        if (v9 - v11 >= 1) {
          long long v54 = ++v11;
        }
      }
    }
    if ((json_char_table[v36] & 0x20) != 0)
    {
      if (!jscon_scan_string(&v54, (uint64_t)&v51)) {
        goto LABEL_248;
      }
      uint64_t v11 = v54;
      if (v54 >= v56) {
        uint64_t v37 = 0;
      }
      else {
        uint64_t v37 = *v54;
      }
      if (json_char_table[v37])
      {
        unint64_t v38 = v54;
        while (1)
        {
          if (v11 >= v56)
          {
            if ((json_char_table[0] & 1) == 0) {
              goto LABEL_258;
            }
          }
          else
          {
            uint64_t v37 = *v11;
            if ((json_char_table[v37] & 1) == 0)
            {
              long long v54 = v38;
              break;
            }
          }
          if (v56 - v11 >= 1) {
            unint64_t v38 = ++v11;
          }
        }
      }
      if (v37 == 58)
      {
        if (v56 - v11 >= 1) {
          long long v54 = v11 + 1;
        }
        goto LABEL_150;
      }
    }
  }
LABEL_246:
  LODWORD(v51) = 0;
LABEL_247:
  long long v52 = v11;
  uint64_t v53 = 0;
LABEL_248:
  (*(void (**)(uint64_t, void, uint64_t *, char *))(v3 + 16))(v3, 0, &v51, &v50);
  return 0;
}

uint64_t jscon_scan_string(char **a1, uint64_t a2)
{
  uint64_t v4 = a1[2];
  unint64_t v5 = *a1;
  if (v4 - *a1 >= 1) {
    *a1 = ++v5;
  }
  *(void *)(a2 + _Block_object_dispose(&STACK[0x280], 8) = v5;
  *(_DWORD *)a2 = 4;
  char v6 = v5;
  while (1)
  {
    char v7 = (char *)memchr(v6, 34, v4 - (unsigned char *)v6);
    if (!v7)
    {
      *(_DWORD *)a2 = 0;
      *(void *)(a2 + _Block_object_dispose(&STACK[0x280], 8) = v6;
      uint64_t v11 = (void *)(a2 + 16);
      goto LABEL_29;
    }
    uint64_t v8 = (unsigned __int8 *)v7;
    char v6 = v7 + 1;
    *a1 = v7 + 1;
    if (*(v7 - 1) != 92) {
      break;
    }
    *(_DWORD *)a2 = 5;
    if (*(v7 - 2) == 92)
    {
      uint64_t v9 = 0;
      do
        int v10 = v7[v9-- - 3];
      while (v10 == 92);
      if (((1 - v9) & 1) == 0) {
        break;
      }
    }
  }
  *(void *)(a2 + 16) = v7 - v5;
  uint64_t v11 = (void *)(a2 + 16);
  long long v12 = (unsigned __int8 *)memchr(v5, 92, v7 - v5);
  for (uint64_t i = 1; v12 && v12 < v8; uint64_t i = 1)
  {
    *(_DWORD *)a2 = 5;
    int v14 = (char *)(v12 + 2);
    int v15 = json_char_table[v12[1]];
    if ((v15 & 0x1E0) == 0)
    {
      if ((v15 & 0x10000) == 0 || v8 - (unsigned __int8 *)v14 < 4) {
        goto LABEL_28;
      }
      if ((json_char_table[v12[2]] & 0x1A) == 0)
      {
        int v14 = (char *)(v12 + 3);
        goto LABEL_28;
      }
      if ((json_char_table[v12[3]] & 0x1A) == 0)
      {
        int v14 = (char *)(v12 + 4);
        goto LABEL_28;
      }
      if ((json_char_table[v12[4]] & 0x1A) == 0)
      {
        int v14 = (char *)(v12 + 5);
LABEL_28:
        *(_DWORD *)a2 = 0;
        *(void *)(a2 + _Block_object_dispose(&STACK[0x280], 8) = v14 - 1;
LABEL_29:
        uint64_t i = 0;
        *uint64_t v11 = 0;
        return i;
      }
      int v14 = (char *)(v12 + 6);
      if ((json_char_table[v12[5]] & 0x1A) == 0) {
        goto LABEL_28;
      }
    }
    long long v12 = (unsigned __int8 *)memchr(v14, 92, v8 - (unsigned __int8 *)v14);
  }
  return i;
}

id _SDEventMonitorErrorMake(void *a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F08320];
  v7[0] = a1;
  size_t v1 = NSDictionary;
  id v2 = a1;
  uint64_t v3 = [v1 dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v4 = [MEMORY[0x263F087E8] errorWithDomain:@"SDEventMonitorErrorDomain" code:-1000 userInfo:v3];

  return v4;
}

id SDPommesStemWord(void *a1)
{
  id v1 = a1;
  [v1 cStringUsingEncoding:4];
  uint64_t v2 = PRPommesStemWordWithCString();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v4 = [NSString stringWithCString:v2 encoding:4];
    free(v3);
  }
  else
  {
    id v4 = v1;
  }

  return v4;
}

void sub_21F2494D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F249590(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F2496E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__n128 si_tracing_restore_current_span(uint64_t a1)
{
  uint64_t v2 = ((uint64_t (*)(void))*MEMORY[0x263F55710])();
  si_tracing_log_span_end();
  __n128 result = *(__n128 *)a1;
  long long v4 = *(_OWORD *)(a1 + 16);
  *(void *)(v2 + 32) = *(void *)(a1 + 32);
  *(__n128 *)uint64_t v2 = result;
  *(_OWORD *)(v2 + 16) = v4;
  return result;
}

void sub_21F24A2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,long long a25,long long a26,uint64_t a27)
{
  si_tracing_restore_current_span((uint64_t)&a19);
  long long v29 = a26;
  *(_OWORD *)uint64_t v27 = a25;
  *(_OWORD *)(v27 + 16) = v29;
  *(void *)(v27 + 32) = a27;
  _Unwind_Resume(a1);
}

void sub_21F24A428(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F24A9C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  objc_destroyWeak(a12);
  objc_destroyWeak((id *)(v31 - 200));
  _Block_object_dispose((const void *)(v31 - 192), 8);
  si_tracing_restore_current_span(v31 - 160);
  _Unwind_Resume(a1);
}

void sub_21F24AB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  si_tracing_restore_current_span((uint64_t)&a11);
  long long v21 = a18;
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = v21;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(a1);
}

void sub_21F24AD2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

uint64_t __isInstantAnswerAllowed_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  isInstantAnswerAllowed_isSearchToolDebugMode = result;
  return result;
}

void OUTLINED_FUNCTION_4_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_6_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x280], 8) = a1;
}

void updateStorageUsageIgnoreLinks(void *a1, void *a2, uint64_t a3, int a4, char a5)
{
  id v19 = a1;
  id v9 = a2;
  incrementIndexStorageSize(v19, @"total", a3);
  if (a4)
  {
    incrementIndexStorageSize(v19, @"purgeable", a3);
    if (isEmbedding(v9)) {
      incrementIndexStorageSize(v19, @"embeddingPurgeable", a3);
    }
  }
  if ([v9 hasPrefix:@"SpotlightKnowledge"])
  {
    incrementIndexStorageSize(v19, @"knowledgeGraph", a3);
    uint64_t v10 = [v9 lastPathComponent];
    char v11 = [v10 hasPrefix:@"evt_journalAttr"];

    if ((v11 & 1) == 0) {
      goto LABEL_17;
    }
    long long v12 = @"transient";
    goto LABEL_16;
  }
  if (a5) {
    goto LABEL_17;
  }
  incrementIndexStorageSize(v19, @"other", a3);
  id v13 = v9;
  int v14 = [v13 lastPathComponent];
  int v15 = [v13 pathExtension];

  if ([v14 isEqualToString:@"store.db"])
  {

LABEL_11:
    incrementIndexStorageSize(v19, @"clone", a3);
    goto LABEL_12;
  }
  int v16 = [v15 hasPrefix:@"shadow"];

  if (v16) {
    goto LABEL_11;
  }
LABEL_12:
  unsigned int v17 = [v13 lastPathComponent];
  if ([v17 hasPrefix:@"activityJournal"])
  {
  }
  else
  {
    int v18 = [v17 isEqualToString:@"SKGActivityJournal.log"];

    if (!v18) {
      goto LABEL_17;
    }
  }
  long long v12 = @"activityJournal";
LABEL_16:
  incrementIndexStorageSize(v19, v12, a3);
LABEL_17:
}

void incrementIndexStorageSize(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = a1;
  char v7 = [v6 objectForKey:v5];

  uint64_t v8 = NSNumber;
  if (v7)
  {
    id v10 = [v6 objectForKeyedSubscript:v5];
    uint64_t v9 = objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v10, "unsignedLongLongValue") + a3);
    [v6 setObject:v9 forKeyedSubscript:v5];

    id v5 = v6;
    id v6 = (id)v9;
  }
  else
  {
    id v10 = [NSNumber numberWithUnsignedLongLong:a3];
    objc_msgSend(v6, "setObject:forKeyedSubscript:");
  }
}

BOOL isEmbedding(void *a1)
{
  uint64_t v1 = [a1 lastPathComponent];
  BOOL v2 = [v1 rangeOfString:@".ivf-"] != 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

uint64_t isTermIndex(void *a1)
{
  id v1 = a1;
  if (([v1 hasSuffix:@".indexDirectory"] & 1) != 0
    || ([v1 hasSuffix:@".indexCompactDirectory"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 hasSuffix:@".indexArrays"];
  }

  return v2;
}

uint64_t isJournal(void *a1)
{
  id v1 = [a1 lastPathComponent];
  uint64_t v2 = [v1 hasPrefix:@"journalAttr."];

  return v2;
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_21F24D098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21F24D78C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

void sub_21F250FE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F251E44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F2521FC(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 144);
  _Unwind_Resume(a1);
}

void sub_21F252348(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F2526E0(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_21F25282C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F252DD0(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 144);
  _Unwind_Resume(a1);
}

void sub_21F252F34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F2532D0(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_21F25341C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F2537F0(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 144);
  _Unwind_Resume(a1);
}

void sub_21F25393C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F253D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_21F2540A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F2545D4(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 144);
  _Unwind_Resume(a1);
}

void sub_21F25473C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F254B68(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_21F254CB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F2550B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  si_tracing_restore_current_span((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21F2552C8(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_21F255400(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F255660(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21F2557CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F255A10(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_21F255B48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F255DFC(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 144);
  _Unwind_Resume(a1);
}

void sub_21F255F50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F256170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_21F2562A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F2564E4(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_21F25661C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F256A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_21F256F50(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_21F25709C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F2571E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F257580(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_21F2576CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F257920(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_21F257A58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F257E08(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_21F257F64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_21F2581B0(_Unwind_Exception *a1)
{
  si_tracing_restore_current_span(v1 - 128);
  _Unwind_Resume(a1);
}

void sub_21F258348(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_11_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

id getSystemVersionString()
{
  if (getSystemVersionString_once != -1) {
    dispatch_once(&getSystemVersionString_once, &__block_literal_global_12);
  }
  uint64_t v0 = (void *)getSystemVersionString_systemVersionStr;
  return v0;
}

void __getSystemVersionString_block_invoke()
{
  CFDictionaryRef v0 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    CFDictionaryRef v1 = v0;
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v0, (const void *)*MEMORY[0x263EFFAB0]);
    if (Value)
    {
      CFStringRef Copy = CFStringCreateCopy(0, Value);
      uint64_t v4 = (void *)getSystemVersionString_systemVersionStr;
      getSystemVersionString_systemVersionStr = (uint64_t)Copy;
    }
    CFRelease(v1);
  }
  if (!getSystemVersionString_systemVersionStr)
  {
    getSystemVersionString_systemVersionStr = (uint64_t)&stru_26D0BD940;
  }
}

uint64_t signalHandler(uint64_t result)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (result == 15)
  {
    if ((signalHandler_didHandleSIGTERM & 1) == 0)
    {
      signalHandler_didHandleSIGTERM = 1;
      CFDictionaryRef v1 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        LOWORD(v5) = 0;
        _os_log_impl(&dword_21F1CE000, v1, OS_LOG_TYPE_INFO, "Received SIGTERM", (uint8_t *)&v5, 2u);
      }

      [(id)sSignalHandlerDelegate didReceiveSignal:15];
      uint64_t v2 = logForCSLogCategoryDefault();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        LOWORD(v5) = 0;
        _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_INFO, "Exiting", (uint8_t *)&v5, 2u);
      }

      exit(0);
    }
  }
  else
  {
    uint64_t v3 = result;
    uint64_t v4 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      uint64_t v6 = v3;
      _os_log_impl(&dword_21F1CE000, v4, OS_LOG_TYPE_INFO, "Received signal %lu", (uint8_t *)&v5, 0xCu);
    }

    return [(id)sSignalHandlerDelegate didReceiveSignal:v3];
  }
  return result;
}

void sub_21F25AFF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t releaseCallback()
{
  return SICorrectionDestory();
}

void sub_21F25B5FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F25B9E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_21F25BDD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void *__si_process_corrections_block_invoke(void *result, int a2, long long *a3)
{
  uint64_t v3 = result;
  switch(a2)
  {
    case 1:
      uint64_t v4 = *(void *)(result[7] + 8);
      int v5 = *(_DWORD *)(v4 + 24) + 1;
      goto LABEL_25;
    case 2:
      int v7 = *(_DWORD *)(*(void *)(result[7] + 8) + 24);
      if (v7 == 1)
      {
        *(void *)(result[11] + _Block_object_dispose(&STACK[0x280], 8) = result[12];
        if (*(void *)(result[11] + 8 * *(int *)(*(void *)(result[7] + 8) + 24) - 8) == result[14])
        {
          uint64_t v13 = *(void *)(result[8] + 8);
          unint64_t v14 = *(void *)(v13 + 24);
          if (v14 <= 0x3FF)
          {
            uint64_t v15 = *(void *)(*(void *)(result[10] + 8) + 24);
            *(void *)(v13 + 24) = v14 + 1;
            uint64_t v16 = v15 + 24 * v14;
            long long v17 = *a3;
            *(void *)(v16 + 16) = *((void *)a3 + 2);
            *(_OWORD *)uint64_t v16 = v17;
          }
        }
      }
      else
      {
        if (v7) {
          return result;
        }
        *(void *)result[11] = result[12];
        uint64_t v8 = *((void *)a3 + 2);
        switch(v8)
        {
          case 8:
            if (**((void **)a3 + 1) != 0x65676175676E616CLL) {
              return result;
            }
            uint64_t v10 = result[16];
            goto LABEL_40;
          case 7:
            long long v21 = (int *)*((void *)a3 + 1);
            int v22 = *v21;
            int v23 = *(int *)((char *)v21 + 3);
            if (v22 == 1936876918 && v23 == 1852795251)
            {
              uint64_t v10 = result[15];
              goto LABEL_40;
            }
            break;
          case 1:
            int v9 = **((unsigned __int8 **)a3 + 1);
            if (v9 == 113)
            {
              *(void *)(result[11] + 8 * *(int *)(*(void *)(result[7] + 8) + 24)) = result[13];
              int v9 = **((unsigned __int8 **)a3 + 1);
            }
            if (v9 == 99)
            {
              uint64_t v10 = result[14];
LABEL_40:
              *(void *)(result[11] + 8 * *(int *)(*(void *)(result[7] + 8) + 24)) = v10;
            }
            break;
        }
      }
      return result;
    case 3:
      uint64_t v4 = *(void *)(result[7] + 8);
      int v6 = *(_DWORD *)(v4 + 24);
      if (v6 == 1)
      {
        if (*(void *)(*(void *)(result[8] + 8) + 24))
        {
          uint64_t result = (void *)(*(uint64_t (**)(void))(result[4] + 16))();
          *(void *)(*(void *)(v3[8] + 8) + 24) = 0;
          uint64_t v4 = *(void *)(v3[7] + 8);
          int v6 = *(_DWORD *)(v4 + 24);
        }
        else
        {
          int v6 = 1;
        }
      }
      int v5 = v6 - 1;
LABEL_25:
      *(_DWORD *)(v4 + 24) = v5;
      return result;
    case 6:
      if (*(_DWORD *)(*(void *)(result[7] + 8) + 24)) {
        return result;
      }
      uint64_t v11 = *(void *)result[11];
      if (v11 == result[13])
      {
        uint64_t v18 = *(void *)(result[9] + 8);
        long long v19 = *a3;
        *(void *)(v18 + 4_Block_object_dispose(&STACK[0x280], 8) = *((void *)a3 + 2);
        *(_OWORD *)(v18 + 32) = v19;
        *(void *)(*(void *)(result[8] + 8) + 24) = 0;
      }
      else
      {
        if (v11 == result[16])
        {
          uint64_t v12 = result[5];
        }
        else
        {
          if (v11 != result[15]) {
            return result;
          }
          uint64_t v12 = result[6];
        }
        uint64_t v20 = *(uint64_t (**)(void))(v12 + 16);
        return (void *)v20();
      }
      return result;
    default:
      return result;
  }
}

void newHeartbeatDict_cold_1()
{
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11(&dword_21F1CE000, v0, v1, "Error getting parent directory age: %d", v2, v3, v4, v5, v6);
}

void protectionClassForAnalytics_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [a1 UTF8String];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_1(&dword_21F1CE000, a2, v3, "Invalid dataclass %s", v4);
}

void setClientStateForIndexing_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_21F1CE000, v0, v1, "No client state to save for bundleID:%@", v2, v3, v4, v5, v6);
}

void wait_for_apfs_kb_state_cold_1()
{
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_22(&dword_21F1CE000, v0, v1, "APFSIOC_VOLUME_CLASSKB_OP error %d for %s", v2, v3);
}

void createResetTouchFileDirectoryForUUID_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_10_0(&dword_21F1CE000, v0, (uint64_t)v0, "[IndexLoss] Error creating reset touch file directory at %@ : %@", v1);
}

void ___setup_block_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10();
  os_log_t v1 = (void *)MEMORY[0x223C48320](*(void *)(v0 + 32));
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_21(&dword_21F1CE000, v2, v3, "operation canceled %p from line %d", v4, v5, v6, v7, v8);
}

void __updatedFrom2024Seed_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "Failed to get previous build", v2, v3, v4, v5, v6);
}

void __updatedFrom2024Seed_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "Error creating build format %@", v2, v3, v4, v5, v6);
}

void is2024Seed_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_21F1CE000, v0, v1, "Error creating seed build format %@", v2, v3, v4, v5, v6);
}

void __processItemsForImport_block_invoke_cold_1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v6 = lastTimeOnPower_block_invoke_5_counter;
  uint64_t v7 = *(void *)(a1 + 32);
  uint8_t v8 = [*(id *)(a1 + 40) fileType];
  uint64_t v9 = [*(id *)(a1 + 48) count];
  uint64_t v10 = *(void *)(a1 + 48);
  v11[0] = 67110402;
  v11[1] = v6;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  __int16 v14 = 2112;
  uint64_t v15 = v8;
  __int16 v16 = 2048;
  double v17 = a3;
  __int16 v18 = 2048;
  uint64_t v19 = v9;
  __int16 v20 = 2112;
  uint64_t v21 = v10;
  _os_log_error_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_ERROR, "==== SENDING WORK %d %@ for type:%@ (timeout:%g) count:%ld unique:%@", (uint8_t *)v11, 0x3Au);
}

void __processItemsForImportInner_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_21F1CE000, v0, v1, "Index ref nil when trying to process items for import", v2, v3, v4, v5, v6);
}

void SDTransactionCreate_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_DEBUG, "SDTransactionCreate, %@", (uint8_t *)&v2, 0xCu);
}

void SDTransactionDone_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21F1CE000, a2, OS_LOG_TYPE_DEBUG, "SDTransactionDone, %s", (uint8_t *)&v2, 0xCu);
}

uint64_t AKSEventsRegister()
{
  return MEMORY[0x270F0E370]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFURLRef CFCopyHomeDirectoryURL(void)
{
  return (CFURLRef)MEMORY[0x270EE4790]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B90]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B98]();
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x270EE4CB0](applicationID, userName, hostName);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x270EE4CB8](keysToFetch, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x270EE5108](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE51B8](string, buffer, maxBufLen);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

uint64_t CPCopyBundleIdentifierAndTeamFromApplicationIdentifier()
{
  return MEMORY[0x270F0CD08]();
}

uint64_t CSSanitizeProtectionClass()
{
  return MEMORY[0x270EE8600]();
}

uint64_t CacheDeleteRegisterInfoCallbacks()
{
  return MEMORY[0x270F130B0]();
}

uint64_t CacheDeleteRegisterInfoCallbacksForProcess()
{
  return MEMORY[0x270F130B8]();
}

CFTypeRef IOPSCopyPowerSourcesInfo(void)
{
  return (CFTypeRef)MEMORY[0x270EF4910]();
}

CFStringRef IOPSGetProvidingPowerSourceType(CFTypeRef snapshot)
{
  return (CFStringRef)MEMORY[0x270EF4958](snapshot);
}

CFRunLoopSourceRef IOPSNotificationCreateRunLoopSource(IOPowerSourceCallbackType callback, void *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EF4988](callback, context);
}

uint64_t MKBDeviceLockAssertion()
{
  return MEMORY[0x270F4AE08]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PRPommesStemWordWithCString()
{
  return MEMORY[0x270F4AF68]();
}

uint64_t SIAddCorrection()
{
  return MEMORY[0x270F4AF70]();
}

uint64_t SICancel()
{
  return MEMORY[0x270F4AF78]();
}

uint64_t SICloseCache()
{
  return MEMORY[0x270F4AF80]();
}

uint64_t SICloseIndex()
{
  return MEMORY[0x270F4AF88]();
}

uint64_t SICloseJWLIndex()
{
  return MEMORY[0x270F4AF90]();
}

uint64_t SICopyCSClientStateCache()
{
  return MEMORY[0x270F4AF98]();
}

uint64_t SICopyCachedCSClientState()
{
  return MEMORY[0x270F4AFA0]();
}

uint64_t SICopyCorrections()
{
  return MEMORY[0x270F4AFA8]();
}

uint64_t SICopyProperties()
{
  return MEMORY[0x270F4AFB0]();
}

uint64_t SICopyProperty()
{
  return MEMORY[0x270F4AFB8]();
}

uint64_t SICopyRoundedDate()
{
  return MEMORY[0x270F4AFC0]();
}

uint64_t SICorrectionCommit()
{
  return MEMORY[0x270F4AFC8]();
}

uint64_t SICorrectionCreate()
{
  return MEMORY[0x270F4AFD0]();
}

uint64_t SICorrectionDestory()
{
  return MEMORY[0x270F4AFD8]();
}

uint64_t SIDeleteAttributes()
{
  return MEMORY[0x270F4AFE8]();
}

uint64_t SIDeleteBgAssertionFile()
{
  return MEMORY[0x270F4AFF0]();
}

uint64_t SIDeleteCSAttributes()
{
  return MEMORY[0x270F4AFF8]();
}

uint64_t SIDeleteCSClientStateCache()
{
  return MEMORY[0x270F4B000]();
}

uint64_t SIDeleteCSItems()
{
  return MEMORY[0x270F4B008]();
}

uint64_t SIDeleteCacheEntry()
{
  return MEMORY[0x270F4B010]();
}

uint64_t SIDropAssertion()
{
  return MEMORY[0x270F4B018]();
}

uint64_t SIExecuteQueryWithResultsCallbackForTags()
{
  return MEMORY[0x270F4B020]();
}

uint64_t SIExecuteResumeActivityCallback()
{
  return MEMORY[0x270F4B028]();
}

uint64_t SIFetchCSClientState()
{
  return MEMORY[0x270F4B030]();
}

uint64_t SIFetchTopKTerms()
{
  return MEMORY[0x270F4B038]();
}

uint64_t SIFixupPaths()
{
  return MEMORY[0x270F4B040]();
}

uint64_t SIFlushAndSuspendIndex()
{
  return MEMORY[0x270F4B048]();
}

uint64_t SIGetAccumulatedSizeForGroup()
{
  return MEMORY[0x270F4B050]();
}

uint64_t SIGetAccumulatedStorageSizeForBundleId()
{
  return MEMORY[0x270F4B058]();
}

uint64_t SIGetAccumulatedWorkTimeSinceLastSync()
{
  return MEMORY[0x270F4B060]();
}

uint64_t SIGetCSAttributes()
{
  return MEMORY[0x270F4B068]();
}

uint64_t SIGetCacheEntry()
{
  return MEMORY[0x270F4B070]();
}

uint64_t SIGetCacheFd()
{
  return MEMORY[0x270F4B078]();
}

uint64_t SIGetCacheFileDescriptors()
{
  return MEMORY[0x270F4B080]();
}

uint64_t SIGetLockedJournalingState()
{
  return MEMORY[0x270F4B090]();
}

uint64_t SIGetObjectCount()
{
  return MEMORY[0x270F4B098]();
}

uint64_t SIGetPreviousError()
{
  return MEMORY[0x270F4B0A0]();
}

uint64_t SIGetRebuildReason()
{
  return MEMORY[0x270F4B0A8]();
}

uint64_t SIIndexInactive()
{
  return MEMORY[0x270F4B0B0]();
}

uint64_t SIIndexIsInPlayback()
{
  return MEMORY[0x270F4B0B8]();
}

uint64_t SIIsLockedIndexingMode()
{
  return MEMORY[0x270F4B0C0]();
}

uint64_t SILogActivity()
{
  return MEMORY[0x270F4B0C8]();
}

uint64_t SIOpenIndexAtPathWithCallbacks()
{
  return MEMORY[0x270F4B0D0]();
}

uint64_t SIOpenJWLIndex()
{
  return MEMORY[0x270F4B0D8]();
}

uint64_t SIPreHeatIndex()
{
  return MEMORY[0x270F4B0E0]();
}

uint64_t SIPurgeVectorIndex()
{
  return MEMORY[0x270F4B0E8]();
}

uint64_t SIQueryCreateWithItems()
{
  return MEMORY[0x270F4B0F0]();
}

uint64_t SIQueryCreateWithParameters()
{
  return MEMORY[0x270F4B0F8]();
}

uint64_t SIQueryRelease()
{
  return MEMORY[0x270F4B100]();
}

uint64_t SIQueryRetain()
{
  return MEMORY[0x270F4B108]();
}

uint64_t SIQuerySetBatchingParameters()
{
  return MEMORY[0x270F4B110]();
}

uint64_t SIReleaseJournalAssertion()
{
  return MEMORY[0x270F4B118]();
}

uint64_t SIResultBatchFree()
{
  return MEMORY[0x270F4B120]();
}

uint64_t SIResultQueueCancel()
{
  return MEMORY[0x270F4B128]();
}

uint64_t SIResultQueueCreate()
{
  return MEMORY[0x270F4B130]();
}

uint64_t SIResultQueueDequeue()
{
  return MEMORY[0x270F4B138]();
}

uint64_t SIResultQueueNoWakeupTrigger()
{
  return MEMORY[0x270F4B140]();
}

uint64_t SIResultQueueRelease()
{
  return MEMORY[0x270F4B148]();
}

uint64_t SIResultQueueSetWakeupTrigger()
{
  return MEMORY[0x270F4B150]();
}

uint64_t SIResumeForUnlock()
{
  return MEMORY[0x270F4B158]();
}

uint64_t SIResumeIndex()
{
  return MEMORY[0x270F4B160]();
}

uint64_t SISetAccumulatedWorkBoundaryCrossCallback()
{
  return MEMORY[0x270F4B168]();
}

uint64_t SISetBgAssertionFlag()
{
  return MEMORY[0x270F4B170]();
}

uint64_t SISetCSAttributes()
{
  return MEMORY[0x270F4B178]();
}

uint64_t SISetCacheEntry()
{
  return MEMORY[0x270F4B180]();
}

uint64_t SISetCodedAttributes()
{
  return MEMORY[0x270F4B188]();
}

uint64_t SISetDefaultSchemaData()
{
  return MEMORY[0x270F4B198]();
}

uint64_t SISetFileProvidersCallbacks()
{
  return MEMORY[0x270F4B1A0]();
}

uint64_t SISetICUCacheFd()
{
  return MEMORY[0x270F4B1A8]();
}

uint64_t SISetLockedJournalingState()
{
  return MEMORY[0x270F4B1B0]();
}

uint64_t SISetLogging()
{
  return MEMORY[0x270F4B1B8]();
}

uint64_t SISetProperty()
{
  return MEMORY[0x270F4B1C0]();
}

uint64_t SISyncIndex()
{
  return MEMORY[0x270F4B1D0]();
}

uint64_t SISyncIndexForLikelyShutdown()
{
  return MEMORY[0x270F4B1D8]();
}

uint64_t SISynchedOp()
{
  return MEMORY[0x270F4B1E0]();
}

uint64_t SISynchedOpPropagatingPriority()
{
  return MEMORY[0x270F4B1E8]();
}

uint64_t SITransferDeletionJournals()
{
  return MEMORY[0x270F4B1F0]();
}

uint64_t SIUserCtxCreateWithLanguages()
{
  return MEMORY[0x270F4B1F8]();
}

uint64_t SIUserCtxSetEntitlements()
{
  return MEMORY[0x270F4B200]();
}

uint64_t SIValidIndex()
{
  return MEMORY[0x270F4B208]();
}

uint64_t SIVectorIndexStorageSize()
{
  return MEMORY[0x270F4B210]();
}

uint64_t SIWaitForAllIndexShutdown()
{
  return MEMORY[0x270F4B218]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x270EFDCA0](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x270EFDCE0](allocator, token);
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x270EE8548](inUTI, inConformsToUTI);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
}

uint64_t _CFURLGetVolumePropertyFlags()
{
  return MEMORY[0x270EE5760]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

uint64_t _MDItemDecrypt()
{
  return MEMORY[0x270F12FB0]();
}

uint64_t _MDPlainTextFromHTMLData()
{
  return MEMORY[0x270EE8608]();
}

uint64_t _MDPlistArrayGetCount()
{
  return MEMORY[0x270F4A6D8]();
}

uint64_t _MDPlistArrayGetPlistObjectAtIndex()
{
  return MEMORY[0x270F4A6E0]();
}

uint64_t _MDPlistBytesCopyPlistAtIndex()
{
  return MEMORY[0x270F4A6F0]();
}

uint64_t _MDPlistBytesGetByteVector()
{
  return MEMORY[0x270F4A6F8]();
}

uint64_t _MDPlistBytesGetByteVectorCount()
{
  return MEMORY[0x270F4A700]();
}

uint64_t _MDPlistContainerCopyObject()
{
  return MEMORY[0x270F4A730]();
}

uint64_t _MDPlistContainerCopyRootObject()
{
  return MEMORY[0x270F4A738]();
}

uint64_t _MDPlistContainerCreateWithBytes()
{
  return MEMORY[0x270F4A748]();
}

uint64_t _MDPlistContainerCreateWithObject()
{
  return MEMORY[0x270F4A750]();
}

uint64_t _MDPlistContainerGetBytes()
{
  return MEMORY[0x270F4A770]();
}

uint64_t _MDPlistContainerGetLength()
{
  return MEMORY[0x270F4A778]();
}

uint64_t _MDPlistDateGetValue()
{
  return MEMORY[0x270F4A788]();
}

uint64_t _MDPlistDictionaryGetPlistObjectForKey()
{
  return MEMORY[0x270F4A798]();
}

uint64_t _MDPlistDictionaryIterate()
{
  return MEMORY[0x270F4A7A0]();
}

uint64_t _MDPlistGetPlistObjectType()
{
  return MEMORY[0x270F4A7A8]();
}

uint64_t _MDPlistGetRootPlistObjectFromPlist()
{
  return MEMORY[0x270F4A7B8]();
}

uint64_t _MDPlistNumberGetIntValue()
{
  return MEMORY[0x270F4A7C0]();
}

uint64_t _MDStoreOIDArrayApplyBlock()
{
  return MEMORY[0x270F4A7D0]();
}

uint64_t _MDStoreOIDArrayGetVector()
{
  return MEMORY[0x270F4A7D8]();
}

uint64_t _MDStoreOIDArrayGetVectorCount()
{
  return MEMORY[0x270F4A7E0]();
}

uint64_t _SIChangeProtectionClassForFilesInDirectory()
{
  return MEMORY[0x270F4B248]();
}

uint64_t _SICrashStateDump()
{
  return MEMORY[0x270F4B270]();
}

uint64_t _SIDeleteBundles()
{
  return MEMORY[0x270F4B278]();
}

uint64_t _SIDirectoryStoreIterate()
{
  return MEMORY[0x270F4B280]();
}

uint64_t _SIFilterValidatedCSImports()
{
  return MEMORY[0x270F4B288]();
}

uint64_t _SIGetDocumentCount()
{
  return MEMORY[0x270F4B290]();
}

uint64_t _SIGetFieldNameForId()
{
  return MEMORY[0x270F4B298]();
}

uint64_t _SIGetIndexCount()
{
  return MEMORY[0x270F4B2A0]();
}

uint64_t _SIGetMissingParentOID()
{
  return MEMORY[0x270F4B2A8]();
}

uint64_t _SIIssueDefrag()
{
  return MEMORY[0x270F4B2B0]();
}

uint64_t _SIIssueFullMergeWithGroup()
{
  return MEMORY[0x270F4B2B8]();
}

uint64_t _SIOpenIndexFilesForMerge()
{
  return MEMORY[0x270F4B2D0]();
}

uint64_t _SIReverseStoreIterate()
{
  return MEMORY[0x270F4B2D8]();
}

uint64_t _SIScheduleBackgroundOperation()
{
  return MEMORY[0x270F4B2E0]();
}

uint64_t _SIScheduleOperationPostIndexUpdate()
{
  return MEMORY[0x270F4B2E8]();
}

uint64_t _SISchedulerCopyDump()
{
  return MEMORY[0x270F4B2F0]();
}

uint64_t _SISetAssertedJournalNum()
{
  return MEMORY[0x270F4B2F8]();
}

uint64_t _SISetContactsIndex()
{
  return MEMORY[0x270F4B300]();
}

uint64_t _SISetCoreSpotlightCopyBundleRemapCallback()
{
  return MEMORY[0x270F4B308]();
}

uint64_t _SISetCoreSpotlightRelatedItemCallback()
{
  return MEMORY[0x270F4B310]();
}

uint64_t _SISetMemoryPressureStatus()
{
  return MEMORY[0x270F4B320]();
}

uint64_t _SISetPriority()
{
  return MEMORY[0x270F4B328]();
}

uint64_t _SISetProtectionClass()
{
  return MEMORY[0x270F4B330]();
}

uint64_t _SISetQueryBehavior()
{
  return MEMORY[0x270F4B338]();
}

uint64_t _SISetTurboMode()
{
  return MEMORY[0x270F4B340]();
}

uint64_t _SISetVectorIndexDropCallback()
{
  return MEMORY[0x270F4B348]();
}

uint64_t _SIStartPreheatScheduler()
{
  return MEMORY[0x270F4B350]();
}

uint64_t _SITemporarilyChangeProtectionClass()
{
  return MEMORY[0x270F4B358]();
}

uint64_t _SITransferBundles()
{
  return MEMORY[0x270F4B360]();
}

uint64_t _SIValidateActivityJournal()
{
  return MEMORY[0x270F4B368]();
}

uint64_t _SIValidateVectors()
{
  return MEMORY[0x270F4B370]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x270ED7ED0]();
}

uint64_t _dyld_images_for_addresses()
{
  return MEMORY[0x270ED7FA0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t change_fdguard_np()
{
  return MEMORY[0x270ED8EB0]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x270ED8F30](a1);
}

uint64_t csindex_xpc_dictionary_decode_status_with_error()
{
  return MEMORY[0x270EE8610]();
}

uint64_t csindex_xpc_dictionary_encode_status_with_error()
{
  return MEMORY[0x270EE8618]();
}

uint64_t csquery_xpc_dictionary_encode_status()
{
  return MEMORY[0x270EE8620]();
}

uint64_t csquery_xpc_dictionary_encode_status_with_error()
{
  return MEMORY[0x270EE8628]();
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x270ED9188](dirp);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9280](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9440](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x270ED9518](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x270ED9668](*(void *)&a1, a2);
}

int dup(int a1)
{
  return MEMORY[0x270ED9678](*(void *)&a1);
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x270ED98E8](*(void *)&a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9940](*(void *)&a1, a2, a3, *(void *)&a4);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9AB8](a1, a2, a3, *(void *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x270ED9AF8](*(void *)&a1, a2, a3, *(void *)&a4);
}

uid_t geteuid(void)
{
  return MEMORY[0x270ED9BF0]();
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t guarded_close_np()
{
  return MEMORY[0x270ED9DF0]();
}

uint64_t humanize_number()
{
  return MEMORY[0x270F9BA18]();
}

uint64_t isAppleInternalInstall()
{
  return MEMORY[0x270EE8630]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x270EDA0A0](a1, a2);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA320](a1, a2, *(void *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x270EDA740](*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x270EDA840](*(void *)&a1, a2, *(void *)&a3);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x270EDA858](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

uint64_t os_transaction_copy_description()
{
  return MEMORY[0x270EDAA88]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x270EDB0B0]();
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

int raise(int a1)
{
  return MEMORY[0x270EDB0D0](*(void *)&a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x270EDB128](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x270EDB1E8](__p, __ec);
}

void rewind(FILE *a1)
{
}

uint64_t si_text_store_delete_by_predicate()
{
  return MEMORY[0x270F4B378]();
}

uint64_t si_tracing_calc_next_spanid()
{
  return MEMORY[0x270F4A820]();
}

uint64_t si_tracing_calc_traceid()
{
  return MEMORY[0x270F4A828]();
}

uint64_t si_tracing_log_span_begin()
{
  return MEMORY[0x270F4A830]();
}

uint64_t si_tracing_log_span_end()
{
  return MEMORY[0x270F4A838]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x270EDB4D0](*(void *)&a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x270EDB570](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x270EDB5C0](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB718](__str, __endptr, *(void *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

int system(const char *a1)
{
  return MEMORY[0x270EDB808](a1);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

uint64_t tracing_dispatch_async()
{
  return MEMORY[0x270F4A848]();
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCF0](activity);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

gid_t xpc_connection_get_egid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBE80](connection);
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBE88](connection);
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x270EDBE90](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
}

uint64_t xpc_connection_is_extension()
{
  return MEMORY[0x270EDBEA8]();
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC028](xdict, key);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x270EDC080](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x270EDC098](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x270EDC190](object1, object2);
}

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x270EDC1C8](*(void *)&fd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

size_t xpc_hash(xpc_object_t object)
{
  return MEMORY[0x270EDC208](object);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}