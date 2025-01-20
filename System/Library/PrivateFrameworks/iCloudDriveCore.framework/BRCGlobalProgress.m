@interface BRCGlobalProgress
+ (id)_keyPathsToObserve;
- (BRCAccountSessionFPFS)session;
- (BRCGlobalProgress)initWithSession:(id)a3;
- (id)_buildGlobalProgressObjectsWihCompletedUnitCount:(int64_t)a3 totalUnitCount:(int64_t)a4;
- (void)_cancelUploadForObjectID:(id)a3 inState:(unsigned int)a4;
- (void)_cancelUploadForObjectID:(id)a3 inState:(unsigned int)a4 willRetryTransfer:(BOOL)a5;
- (void)_cancelUploadForObjectID:(id)a3 inState:(unsigned int)a4 willRetryTransfer:(BOOL)a5 pendingQuota:(BOOL)a6;
- (void)_createNewGlobalProgressInGroup:(id)a3 completedUnitCount:(int64_t)a4 totalUnitCount:(int64_t)a5;
- (void)_createNewIndeterminateGlobalProgress;
- (void)_createUploadMetadataWithCompletedUnitCount:(int64_t)a3 totalUnitCount:(int64_t)a4;
- (void)_deleteDocument:(id)a3 reason:(char)a4;
- (void)_deleteDocument:(id)a3 reason:(char)a4 sync:(BOOL)a5;
- (void)_destroyProgressInGroup:(id)a3 reason:(char)a4;
- (void)_destroyUploadWithReason:(char)a3;
- (void)_resumeProgressForAnotherOperationIfNeeded;
- (void)_resumeProgressForZone:(id)a3 startingRowID:(unint64_t)a4 whenDone:(id)a5;
- (void)_startObservingProgress:(id)a3;
- (void)_stopObservingProgress:(id)a3;
- (void)_updateDocument:(id)a3;
- (void)_updateGlobalProgress;
- (void)addProgress:(id)a3 forDocument:(id)a4 inGroup:(char)a5;
- (void)clearOutOfQuotaState;
- (void)dealloc;
- (void)didDeleteDocument:(id)a3;
- (void)didUpdateClientZone:(id)a3;
- (void)didUpdateDocument:(id)a3;
- (void)dumpDictionary:(id)a3 withMaxCount:(unint64_t)a4 toContext:(id)a5;
- (void)dumpToContext:(id)a3;
- (void)networkReachabilityChanged:(BOOL)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resumeProgressForZones:(id)a3;
- (void)stopPublishingProgress;
- (void)updateUploadThrottleForDocument:(id)a3 toState:(int)a4;
@end

@implementation BRCGlobalProgress

- (BRCGlobalProgress)initWithSession:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BRCGlobalProgress;
  v5 = [(BRCGlobalProgress *)&v15 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.bird.global-progress", v7);

    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = br_pacer_create();
    updatePacer = v5->_updatePacer;
    v5->_updatePacer = (br_pacer *)v10;

    objc_initWeak(&location, v5);
    objc_copyWeak(&v13, &location);
    br_pacer_set_event_handler();
    objc_storeWeak((id *)&v5->_session, v4);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __37__BRCGlobalProgress_initWithSession___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (WeakRetained[8])
    {
      id v4 = WeakRetained;
      [WeakRetained[9] updateUnitCount];
      [v4[10] updateUnitCount];
      [v4 _updateGlobalProgress];
      v2 = [v4[9] progress];
      int v3 = [v2 isFinished];

      WeakRetained = v4;
      if (v3)
      {
        [v4 _destroyUploadWithReason:0];
        WeakRetained = v4;
      }
    }
  }
}

- (void)dealloc
{
  operationTimer = self->_operationTimer;
  if (operationTimer)
  {
    dispatch_source_cancel(operationTimer);
    if (self->_operationTimerSuspendCount)
    {
      do
      {
        dispatch_resume((dispatch_object_t)self->_operationTimer);
        unsigned int v4 = self->_operationTimerSuspendCount - 1;
        self->_operationTimerSuspendCount = v4;
      }
      while (v4);
    }
    v5 = self->_operationTimer;
    self->_operationTimer = 0;
  }
  br_pacer_cancel();
  updatePacer = self->_updatePacer;
  self->_updatePacer = 0;

  v7.receiver = self;
  v7.super_class = (Class)BRCGlobalProgress;
  [(BRCGlobalProgress *)&v7 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v11;
    v14 = [v13 userInfo];
    objc_super v15 = [v14 objectForKeyedSubscript:@"_BRCObjectIDKey"];

    v16 = [MEMORY[0x263F325B8] fileObjectIDWithString:v15];
    if (v16)
    {
      v17 = [v13 userInfo];
      v18 = [v17 objectForKeyedSubscript:@"_BRCProgressGroupKey"];

      if (v18)
      {
        char v19 = [v13 isFinished];
        queue = self->_queue;
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __68__BRCGlobalProgress_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v24[3] = &unk_265083650;
        v18 = v18;
        v25 = v18;
        v26 = self;
        id v27 = v16;
        id v28 = v12;
        id v29 = v13;
        char v30 = v19;
        dispatch_async_with_logs_6(queue, v24);

        v21 = v25;
      }
      else
      {
        v21 = brc_bread_crumbs();
        v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v21;
          _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: observing a progress that doesn't have a progress group%@", buf, 0xCu);
        }
      }
    }
    else
    {
      v18 = brc_bread_crumbs();
      v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v18;
        _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: observing a progress that doesn't have an objectID%@", buf, 0xCu);
      }
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)BRCGlobalProgress;
    [(BRCGlobalProgress *)&v23 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

void __68__BRCGlobalProgress_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) shortValue];
  uint64_t v3 = 80;
  if (v2 == 1) {
    uint64_t v3 = 72;
  }
  id v4 = *(id *)(*(void *)(a1 + 40) + v3);
  v5 = [v4 childProgresses];
  v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 48)];

  if (!v6)
  {
    char v19 = brc_bread_crumbs();
    v20 = brc_notifications_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v34 = @"download";
      uint64_t v35 = *(void *)(a1 + 48);
      int v39 = 138412802;
      if (v2 == 1) {
        v34 = @"upload";
      }
      uint64_t v40 = (uint64_t)v34;
      __int16 v41 = 2112;
      uint64_t v42 = v35;
      __int16 v43 = 2112;
      uint64_t v44 = (uint64_t)v19;
      _os_log_debug_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: ignore delta update because %@ for doc with objectID %@ isn't tracked anymore%@", (uint8_t *)&v39, 0x20u);
    }

    goto LABEL_34;
  }
  objc_super v7 = [v4 previousUnitCounts];
  dispatch_queue_t v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 48)];
  uint64_t v9 = [v8 unsignedLongLongValue];

  uint64_t v10 = *MEMORY[0x263F081B8];
  id v11 = [*(id *)(a1 + 56) objectForKeyedSubscript:*MEMORY[0x263F081B8]];
  uint64_t v12 = [v11 unsignedLongLongValue];

  if (v9 > v12)
  {
    id v13 = brc_bread_crumbs();
    v14 = brc_notifications_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v36 = *(void *)(a1 + 48);
      int v39 = 138413058;
      uint64_t v40 = v36;
      __int16 v41 = 2048;
      uint64_t v42 = v9;
      __int16 v43 = 2048;
      uint64_t v44 = v12;
      __int16 v45 = 2112;
      v46 = v13;
      _os_log_debug_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: negative delta update for doc with objectID %@; [%lld -> %lld]%@",
        (uint8_t *)&v39,
        0x2Au);
    }

    uint64_t v9 = 0;
  }
  uint64_t v15 = *(void *)(a1 + 40);
  if (v2 == 1)
  {
    v16 = [*(id *)(v15 + 72) versionSizes];
    v17 = [v16 objectForKeyedSubscript:*(void *)(a1 + 48)];
    uint64_t v18 = _computeDelta(v9, v12, [v17 longLongValue], objc_msgSend(*(id *)(a1 + 64), "totalUnitCount"), *(unsigned __int8 *)(a1 + 72));

    goto LABEL_27;
  }
  v21 = [*(id *)(v15 + 80) resumeUnitCounts];
  v16 = [v21 objectForKeyedSubscript:*(void *)(a1 + 48)];

  if (v16)
  {
    if (v12 >= [v16 longLongValue])
    {
      if (v12 != [v16 longLongValue])
      {
        uint64_t v26 = [v16 longLongValue];
        if (v9 <= v26) {
          uint64_t v9 = v26;
        }
        v22 = [*(id *)(*(void *)(a1 + 40) + 80) resumeUnitCounts];
        [v22 removeObjectForKey:*(void *)(a1 + 48)];
        goto LABEL_25;
      }
      v24 = brc_bread_crumbs();
      v25 = brc_notifications_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v38 = *(void **)(a1 + 48);
        int v39 = 134219010;
        uint64_t v40 = v9;
        __int16 v41 = 2048;
        uint64_t v42 = v12;
        __int16 v43 = 2112;
        uint64_t v44 = (uint64_t)v16;
        __int16 v45 = 2112;
        v46 = v38;
        __int16 v47 = 2112;
        v48 = v24;
        _os_log_debug_impl(&dword_23FA42000, v25, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: ignore delta update ([%lld -> %lld] == %@) for doc with objectID %@ because it was counted as part of the resume operation%@", (uint8_t *)&v39, 0x34u);
      }

      v22 = [*(id *)(*(void *)(a1 + 40) + 80) resumeUnitCounts];
      [v22 removeObjectForKey:*(void *)(a1 + 48)];
    }
    else
    {
      v22 = brc_bread_crumbs();
      objc_super v23 = brc_notifications_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v37 = *(void **)(a1 + 48);
        int v39 = 134219010;
        uint64_t v40 = v9;
        __int16 v41 = 2048;
        uint64_t v42 = v12;
        __int16 v43 = 2112;
        uint64_t v44 = (uint64_t)v16;
        __int16 v45 = 2112;
        v46 = v37;
        __int16 v47 = 2112;
        v48 = v22;
        _os_log_debug_impl(&dword_23FA42000, v23, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: ignore delta update ([%lld -> %lld] < %@) for doc with objectID %@ because it was counted as part of the resume operation%@", (uint8_t *)&v39, 0x34u);
      }
    }
    uint64_t v12 = 0;
    uint64_t v9 = 0;
LABEL_25:
  }
  uint64_t v18 = v12 - v9;
LABEL_27:

  if (v18 >= 1)
  {
    objc_msgSend(v4, "setSumOfCompletedUnitCountDelta:", objc_msgSend(v4, "sumOfCompletedUnitCountDelta") + v18);
    id v27 = [*(id *)(a1 + 56) objectForKeyedSubscript:v10];
    id v28 = [v4 previousUnitCounts];
    [v28 setObject:v27 forKeyedSubscript:*(void *)(a1 + 48)];

    br_pacer_signal();
  }
  if (*(unsigned char *)(a1 + 72))
  {
    id v29 = brc_bread_crumbs();
    char v30 = brc_notifications_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(a1 + 32) intValue];
      uint64_t v32 = BRCPrettyPrintEnum();
      uint64_t v33 = *(void *)(a1 + 48);
      int v39 = 136315650;
      uint64_t v40 = v32;
      __int16 v41 = 2112;
      uint64_t v42 = v33;
      __int16 v43 = 2112;
      uint64_t v44 = (uint64_t)v29;
      _os_log_debug_impl(&dword_23FA42000, v30, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: %s finished for doc with objectID %@%@", (uint8_t *)&v39, 0x20u);
    }

    if (v2 != 1)
    {
      [*(id *)(a1 + 40) _stopObservingProgress:*(void *)(a1 + 64)];
      v31 = [*(id *)(*(void *)(a1 + 40) + 80) childProgresses];
      [v31 removeObjectForKey:*(void *)(a1 + 48)];

      char v19 = [*(id *)(*(void *)(a1 + 40) + 80) versionSizes];
      [v19 removeObjectForKey:*(void *)(a1 + 48)];
LABEL_34:
    }
  }
}

- (void)networkReachabilityChanged:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__BRCGlobalProgress_networkReachabilityChanged___block_invoke;
  v4[3] = &unk_2650806E8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async_with_logs_6(queue, v4);
}

uint64_t __48__BRCGlobalProgress_networkReachabilityChanged___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 61) != v2)
  {
    uint64_t v3 = result;
    *(unsigned char *)(v1 + 61) = v2;
    *(unsigned char *)(*(void *)(result + 32) + 60) = 0;
    uint64_t v4 = *(void *)(result + 32);
    if (*(void *)(v4 + 64))
    {
      if (*(unsigned char *)(v4 + 61))
      {
        BOOL v5 = +[BRCUserDefaults defaultsForMangledID:0];
        [v5 intervalToWaitBeforeShowingAdditionalDescription];
        objc_super v7 = *(NSObject **)(*(void *)(v3 + 32) + 48);
        dispatch_time_t v8 = dispatch_time(0, 1000000000 * (uint64_t)v6);
        dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
      return br_pacer_signal();
    }
  }
  return result;
}

- (void)didUpdateClientZone:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (([v3 isSharedZone] & 1) == 0)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = objc_msgSend(v3, "asPrivateClientZone", 0);
    BOOL v5 = [v4 appLibraries];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          id v11 = [v10 containerMetadata];
          if ([v11 isDocumentScopePublic]) {
            [v10 isiCloudDesktopAppLibrary];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)_resumeProgressForZone:(id)a3 startingRowID:(unint64_t)a4 whenDone:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 mangledID];
  id v11 = +[BRCUserDefaults defaultsForMangledID:v10];
  uint64_t v12 = [v11 resumeProgressBatchSize];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__BRCGlobalProgress__resumeProgressForZone_startingRowID_whenDone___block_invoke;
  block[3] = &unk_2650832E0;
  unint64_t v23 = a4;
  uint64_t v24 = v12;
  id v20 = v8;
  v21 = self;
  id v22 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
  resumeTracker = self->_resumeTracker;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  uint64_t v18 = [WeakRetained clientTruthWorkloop];
  brc_task_tracker_async_with_logs(resumeTracker, v18, v15, 0);
}

uint64_t __67__BRCGlobalProgress__resumeProgressForZone_startingRowID_whenDone___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v1 = [*(id *)(a1 + 32) documentsNotIdleEnumeratorWithStartingRowID:*(void *)(a1 + 56) batchSize:*(void *)(a1 + 64)];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v19;
    v16 = v1;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v7 = (void *)MEMORY[0x2455D97F0]();
        uint64_t v8 = [v6 dbRowID];
        if (v6 && [v6 isVisibleIniCloudDrive])
        {
          if ([v6 isDead])
          {
            id v9 = [v6 st];
            int v10 = [v9 state];
            id v11 = [v6 orig];
            uint64_t v12 = [v11 st];
            if (v10 == [v12 state])
            {

              uint64_t v1 = v16;
            }
            else
            {
              id v13 = [v6 orig];
              int v15 = [v13 syncUpState];

              uint64_t v1 = v16;
              if (v15) {
                [*(id *)(a1 + 40) didDeleteDocument:v6];
              }
            }
          }
          else
          {
            [*(id *)(a1 + 40) _updateDocument:v6];
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v3);

    if (v8 != -1) {
      return [*(id *)(a1 + 40) _resumeProgressForZone:*(void *)(a1 + 32) startingRowID:v8 whenDone:*(void *)(a1 + 48)];
    }
  }
  else
  {
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)resumeProgressForZones:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __44__BRCGlobalProgress_resumeProgressForZones___block_invoke;
    v6[3] = &unk_26507ED98;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
}

void __44__BRCGlobalProgress_resumeProgressForZones___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    id v28 = brc_bread_crumbs();
    id v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_cold_2();
    }
  }
  uint64_t v2 = brc_task_tracker_create("resume-progress-tracker");
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  BOOL v5 = dispatch_group_create();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v31 = a1;
  id obj = *(id *)(a1 + 40);
  uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v35 + 1) + 8 * v9);
        id v11 = (void *)MEMORY[0x2455D97F0]();
        if ([v10 isSharedZone])
        {
LABEL_8:
          uint64_t v12 = brc_bread_crumbs();
          id v13 = brc_notifications_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            long long v21 = [v10 zoneName];
            *(_DWORD *)buf = 138412546;
            uint64_t v40 = v21;
            __int16 v41 = 2112;
            uint64_t v42 = v12;
            _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: resuming global progress for '%@'%@", buf, 0x16u);
          }
          dispatch_group_enter(v5);
          id v14 = *(void **)(v31 + 32);
          v33[0] = MEMORY[0x263EF8330];
          v33[1] = 3221225472;
          v33[2] = __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_140;
          v33[3] = &unk_26507ED70;
          v34 = v5;
          [v14 _resumeProgressForZone:v10 startingRowID:0 whenDone:v33];
          int v15 = v34;
          goto LABEL_17;
        }
        v16 = [v10 asPrivateClientZone];
        uint64_t v17 = [v16 defaultAppLibrary];

        long long v18 = [v17 containerMetadata];
        if ([v18 isDocumentScopePublic]
          && ([v18 isCloudSyncTCCDisabled] & 1) == 0)
        {
          char v20 = [v17 isiCloudDesktopAppLibrary];

          if ((v20 & 1) == 0) {
            goto LABEL_8;
          }
        }
        else
        {
        }
        int v15 = brc_bread_crumbs();
        long long v19 = brc_notifications_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          id v22 = [v10 zoneName];
          *(_DWORD *)buf = 138412546;
          uint64_t v40 = v22;
          __int16 v41 = 2112;
          uint64_t v42 = v15;
          _os_log_debug_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: nothing to resume for '%@'%@", buf, 0x16u);
        }
LABEL_17:

        ++v9;
      }
      while (v7 != v9);
      uint64_t v23 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
      uint64_t v7 = v23;
    }
    while (v23);
  }

  uint64_t v24 = brc_bread_crumbs();
  v25 = brc_notifications_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_cold_1();
  }

  uint64_t v26 = *(void *)(v31 + 32);
  id v27 = *(NSObject **)(v26 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_142;
  block[3] = &unk_26507ED70;
  void block[4] = v26;
  dispatch_group_notify(v5, v27, block);
}

void __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_140(uint64_t a1)
{
}

void __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_142(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_notifications_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_142_cold_1();
  }

  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0;
}

- (void)didUpdateDocument:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4 || ([v4 isVisibleIniCloudDrive] & 1) == 0)
  {
    int v10 = [v5 orig];
    id v11 = [v10 asDocument];
    int v12 = [v11 isVisibleIniCloudDrive];

    if (!v12) {
      goto LABEL_18;
    }
    id v13 = brc_bread_crumbs();
    id v14 = brc_notifications_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCGlobalProgress didUpdateDocument:]();
    }

    int v15 = self;
    v16 = v5;
    uint64_t v17 = 1;
LABEL_10:
    [(BRCGlobalProgress *)v15 _deleteDocument:v16 reason:v17];
    goto LABEL_19;
  }
  if ([v5 isDead])
  {
    uint64_t v6 = [v5 st];
    int v7 = [v6 state];
    uint64_t v8 = [v5 orig];
    uint64_t v9 = [v8 st];
    if (v7 == [v9 state])
    {

LABEL_18:
      [(BRCGlobalProgress *)self _deleteDocument:v5 reason:1 sync:0];
      goto LABEL_19;
    }
    long long v21 = [v5 orig];
    int v22 = [v21 syncUpState];

    if (!v22) {
      goto LABEL_18;
    }
    uint64_t v23 = brc_bread_crumbs();
    uint64_t v24 = brc_notifications_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[BRCGlobalProgress didUpdateDocument:]();
    }

    int v15 = self;
    v16 = v5;
    uint64_t v17 = 0;
    goto LABEL_10;
  }
  int v18 = [v5 syncUpState];
  long long v19 = [v5 orig];
  int v20 = [v19 syncUpState];

  if (v18 != v20 && ([v5 isDocumentBeingCopiedToNewZone] & 1) == 0) {
    [(BRCGlobalProgress *)self _updateDocument:v5];
  }
LABEL_19:
}

- (void)didDeleteDocument:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    BOOL v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCGlobalProgress didDeleteDocument:]();
    }
  }
  [(BRCGlobalProgress *)self _deleteDocument:v4 reason:0];
}

- (void)clearOutOfQuotaState
{
  queue = self->_queue;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__BRCGlobalProgress_clearOutOfQuotaState__block_invoke;
  v3[3] = &unk_26507ED70;
  v3[4] = self;
  dispatch_async_with_logs_6(queue, v3);
}

uint64_t __41__BRCGlobalProgress_clearOutOfQuotaState__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 72) outOfQuotaObjIDs];
  [v1 removeAllObjects];

  return br_pacer_signal();
}

- (void)stopPublishingProgress
{
  queue = self->_queue;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __43__BRCGlobalProgress_stopPublishingProgress__block_invoke;
  v3[3] = &unk_26507ED70;
  v3[4] = self;
  dispatch_async_with_logs_6(queue, v3);
}

uint64_t __43__BRCGlobalProgress_stopPublishingProgress__block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  if (v3)
  {
    brc_task_tracker_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v6 = [*(id *)(v2 + 72) versionSizes];
  [v6 removeAllObjects];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  int v7 = [*(id *)(*(void *)(a1 + 32) + 72) childProgresses];
  uint64_t v8 = [v7 allValues];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v33;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(a1 + 32) _stopObservingProgress:*(void *)(*((void *)&v32 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v10);
  }

  id v13 = [*(id *)(*(void *)(a1 + 32) + 72) childProgresses];
  [v13 removeAllObjects];

  id v14 = [*(id *)(*(void *)(a1 + 32) + 72) previousUnitCounts];
  [v14 removeAllObjects];

  int v15 = [*(id *)(*(void *)(a1 + 32) + 80) versionSizes];
  [v15 removeAllObjects];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v16 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "childProgresses", 0);
  uint64_t v17 = [v16 allValues];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(a1 + 32) _stopObservingProgress:*(void *)(*((void *)&v28 + 1) + 8 * v21++)];
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v19);
  }

  int v22 = [*(id *)(*(void *)(a1 + 32) + 80) childProgresses];
  [v22 removeAllObjects];

  uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 80) previousUnitCounts];
  [v23 removeAllObjects];

  uint64_t v24 = [*(id *)(*(void *)(a1 + 32) + 80) resumeUnitCounts];
  [v24 removeAllObjects];

  v25 = brc_bread_crumbs();
  uint64_t v26 = brc_notifications_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    __43__BRCGlobalProgress_stopPublishingProgress__block_invoke_cold_1();
  }

  return [*(id *)(a1 + 32) _destroyUploadWithReason:3];
}

- (void)addProgress:(id)a3 forDocument:(id)a4 inGroup:(char)a5
{
  int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5 == 1)
  {
    if (v8) {
      goto LABEL_3;
    }
    goto LABEL_13;
  }
  v16 = brc_bread_crumbs();
  uint64_t v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[BRCGlobalProgress addProgress:forDocument:inGroup:].cold.4();
  }

  if (!v8)
  {
LABEL_13:
    uint64_t v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCGlobalProgress addProgress:forDocument:inGroup:]();
    }
  }
LABEL_3:
  int v10 = v5;
  if (!v9)
  {
    uint64_t v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCGlobalProgress didDeleteDocument:]();
    }
  }
  if ((v10 - 3) <= 0xFFFFFFFD)
  {
    int v22 = brc_bread_crumbs();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[BRCGlobalProgress addProgress:forDocument:inGroup:]();
    }
  }
  char v11 = [v8 isIndeterminate];
  if (v9 && (v11 & 1) == 0 && [v9 isVisibleIniCloudDrive])
  {
    int v12 = [v9 syncUpState];
    id v13 = [v9 fileObjectID];
    queue = self->_queue;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __53__BRCGlobalProgress_addProgress_forDocument_inGroup___block_invoke;
    v24[3] = &unk_265083678;
    char v28 = v10;
    void v24[4] = self;
    id v25 = v13;
    int v27 = v12;
    id v26 = v8;
    id v15 = v13;
    dispatch_async_with_logs_6(queue, v24);
  }
}

void __53__BRCGlobalProgress_addProgress_forDocument_inGroup___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 60) != 1)
  {
LABEL_11:
    id v14 = *(void **)(a1 + 48);
    id v15 = [*(id *)(a1 + 40) asString];
    [v14 setUserInfoObject:v15 forKey:@"_BRCObjectIDKey"];

    v16 = *(void **)(a1 + 48);
    uint64_t v17 = [NSNumber numberWithChar:*(char *)(a1 + 60)];
    [v16 setUserInfoObject:v17 forKey:@"_BRCProgressGroupKey"];

    [*(id *)(a1 + 32) _startObservingProgress:*(void *)(a1 + 48)];
    return;
  }
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v2)
  {
    uint64_t v3 = [v2 versionSizes];
    uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

    if (v4)
    {
      int v5 = [*(id *)(*(void *)(a1 + 32) + 72) childProgresses];
      uint64_t v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];

      if (v6)
      {
        int v7 = brc_bread_crumbs();
        id v8 = brc_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(a1 + 40);
          int v23 = 138412546;
          uint64_t v24 = v9;
          __int16 v25 = 2112;
          uint64_t v26 = (uint64_t)v7;
          _os_log_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: attempt to add an upload progress more than once for doc with objectID %@%@", (uint8_t *)&v23, 0x16u);
        }

        [*(id *)(a1 + 32) _cancelUploadForObjectID:*(void *)(a1 + 40) inState:*(unsigned int *)(a1 + 56) willRetryTransfer:1];
      }
      uint64_t v10 = *(void *)(a1 + 48);
      char v11 = [*(id *)(*(void *)(a1 + 32) + 72) childProgresses];
      [v11 setObject:v10 forKeyedSubscript:*(void *)(a1 + 40)];

      int v12 = brc_bread_crumbs();
      id v13 = brc_notifications_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = *(void *)(a1 + 40);
        uint64_t v22 = [*(id *)(a1 + 48) totalUnitCount];
        int v23 = 138412802;
        uint64_t v24 = v21;
        __int16 v25 = 2048;
        uint64_t v26 = v22;
        __int16 v27 = 2112;
        char v28 = v12;
        _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: start tracking upload progress for doc with objectID %@ (progressSize: %lld)%@", (uint8_t *)&v23, 0x20u);
      }

      goto LABEL_11;
    }
  }
  uint64_t v18 = brc_bread_crumbs();
  uint64_t v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(a1 + 40);
    int v23 = 138412546;
    uint64_t v24 = v20;
    __int16 v25 = 2112;
    uint64_t v26 = (uint64_t)v18;
    _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: attempt to add an upload progress for doc with objectID %@ without a version size%@", (uint8_t *)&v23, 0x16u);
  }
}

- (void)updateUploadThrottleForDocument:(id)a3 toState:(int)a4
{
  id v6 = a3;
  int v7 = v6;
  if (v6 && [v6 isVisibleIniCloudDrive] && (objc_msgSend(v7, "isDead") & 1) == 0)
  {
    id v8 = [v7 fileObjectID];
    int v9 = [v7 syncUpState];
    if (v8)
    {
      int v10 = v9;
      queue = self->_queue;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __61__BRCGlobalProgress_updateUploadThrottleForDocument_toState___block_invoke;
      v14[3] = &unk_265080808;
      v14[4] = self;
      id v15 = v8;
      int v16 = a4;
      int v17 = v10;
      dispatch_async_with_logs_6(queue, v14);
    }
    else
    {
      int v12 = brc_bread_crumbs();
      id v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[BRCGlobalProgress updateUploadThrottleForDocument:toState:]((uint64_t)v12, v13);
      }
    }
  }
}

void __61__BRCGlobalProgress_updateUploadThrottleForDocument_toState___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) versionSizes];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    int v5 = brc_notifications_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 138412802;
      uint64_t v12 = v10;
      __int16 v13 = 2080;
      *(void *)id v14 = BRCPrettyPrintEnum();
      *(_WORD *)&v14[8] = 2112;
      *(void *)&v14[10] = v4;
      _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: stop tracking upload for doc with objectID %@ because transfer failed (toState: %s)%@", (uint8_t *)&v11, 0x20u);
    }

    [*(id *)(a1 + 32) _cancelUploadForObjectID:*(void *)(a1 + 40) inState:*(unsigned int *)(a1 + 52) willRetryTransfer:*(_DWORD *)(a1 + 48) > 0 pendingQuota:*(_DWORD *)(a1 + 48) == 32];
  }
  else
  {
    id v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = *(_DWORD *)(a1 + 52);
      int v11 = 138413058;
      uint64_t v12 = v8;
      __int16 v13 = 1024;
      *(_DWORD *)id v14 = v9;
      *(_WORD *)&v14[4] = 2080;
      *(void *)&v14[6] = BRCPrettyPrintEnum();
      *(_WORD *)&v14[14] = 2112;
      *(void *)&v14[16] = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: upload failed for doc with objectID %@ without being tracked (syncUpState: %d, toState: %s)%@", (uint8_t *)&v11, 0x26u);
    }
  }
}

- (void)dumpDictionary:(id)a3 withMaxCount:(unint64_t)a4 toContext:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  if ([v7 count])
  {
    [v8 writeLineWithFormat:@"{"];
    [v8 pushIndentation];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __59__BRCGlobalProgress_dumpDictionary_withMaxCount_toContext___block_invoke;
    v10[3] = &unk_2650836A0;
    id v9 = v8;
    id v11 = v9;
    uint64_t v12 = v14;
    unint64_t v13 = a4;
    [v7 enumerateKeysAndObjectsUsingBlock:v10];
    [v9 popIndentation];
    [v9 writeLineWithFormat:@"}"];
  }
  else
  {
    [v8 writeLineWithFormat:@"{}"];
  }
  _Block_object_dispose(v14, 8);
}

uint64_t __59__BRCGlobalProgress_dumpDictionary_withMaxCount_toContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) writeLineWithFormat:@"%@ = %@;", a2, a3];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v8 = *(void *)(v7 + 24);
  *(void *)(v7 + 24) = v8 + 1;
  if (v8 > *(void *)(a1 + 48))
  {
    uint64_t result = [*(id *)(a1 + 32) writeLineWithFormat:@".. truncated .."];
    *a4 = 1;
  }
  return result;
}

- (void)dumpToContext:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __35__BRCGlobalProgress_dumpToContext___block_invoke;
  uint64_t v10 = &unk_26507ED98;
  id v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_sync(queue, &v7);
  objc_msgSend(v6, "popIndentation", v7, v8, v9, v10, v11);
}

uint64_t __35__BRCGlobalProgress_dumpToContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v3)
  {
    id v4 = objc_msgSend(v3, "brc_dumpDescription");
    int v5 = [*(id *)(*(void *)(a1 + 32) + 64) localizedDescription];
    id v6 = [*(id *)(*(void *)(a1 + 32) + 64) localizedAdditionalDescription];
    if ([v6 length])
    {
      uint64_t v7 = NSString;
      uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 64) localizedAdditionalDescription];
      id v9 = [v7 stringWithFormat:@" (%@)", v8];
      [v2 writeLineWithFormat:@"global progress {%@ d:'%@%@'}", v4, v5, v9];
    }
    else
    {
      [v2 writeLineWithFormat:@"global progress {%@ d:'%@%@'}", v4, v5, &stru_26F3822F0];
    }
  }
  else
  {
    [v2 writeLineWithFormat:@"global progress {none}"];
  }
  [*(id *)(a1 + 40) writeLineWithFormat:@"-----------------------------------------------------"];
  [*(id *)(a1 + 40) pushIndentation];
  uint64_t v10 = *(void **)(a1 + 40);
  if (*(void *)(*(void *)(a1 + 32) + 72)) {
    [v10 writeLineWithFormat:@"upload %@", *(void *)(*(void *)(a1 + 32) + 72)];
  }
  else {
    objc_msgSend(v10, "writeLineWithFormat:", @"upload {none}", v44);
  }
  id v11 = *(void **)(a1 + 40);
  id v12 = [*(id *)(*(void *)(a1 + 32) + 72) versionSizes];
  objc_msgSend(v11, "writeLineWithFormat:", @"upload version sizes (%lu):", objc_msgSend(v12, "count"));

  unint64_t v13 = *(id **)(a1 + 32);
  id v14 = [v13[9] versionSizes];
  [v13 dumpDictionary:v14 withMaxCount:1000 toContext:*(void *)(a1 + 40)];

  uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 72) childProgresses];
  uint64_t v16 = [v15 count];

  int v17 = *(void **)(a1 + 40);
  if (v16)
  {
    uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 72) childProgresses];
    objc_msgSend(v17, "writeLineWithFormat:", @"upload progresses (%lu): {", objc_msgSend(v18, "count"));

    [*(id *)(a1 + 40) pushIndentation];
    uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 72) childProgresses];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __35__BRCGlobalProgress_dumpToContext___block_invoke_2;
    v48[3] = &unk_2650836C8;
    id v49 = *(id *)(a1 + 40);
    [v19 enumerateKeysAndObjectsUsingBlock:v48];

    [*(id *)(a1 + 40) popIndentation];
    [*(id *)(a1 + 40) writeLineWithFormat:@"}"];
  }
  else
  {
    [*(id *)(a1 + 40) writeLineWithFormat:@"upload progresses (0): {}"];
  }
  uint64_t v20 = [*(id *)(*(void *)(a1 + 32) + 72) outOfQuotaObjIDs];
  uint64_t v21 = [v20 count];

  uint64_t v22 = *(void **)(a1 + 40);
  if (v21)
  {
    int v23 = [*(id *)(*(void *)(a1 + 32) + 72) outOfQuotaObjIDs];
    uint64_t v24 = [v23 count];
    __int16 v25 = [*(id *)(*(void *)(a1 + 32) + 72) outOfQuotaObjIDs];
    uint64_t v26 = [v25 allObjects];
    __int16 v27 = [v26 componentsJoinedByString:@", "];
    [v22 writeLineWithFormat:@"upload pending quota (%lu): {%@}", v24, v27];
  }
  else
  {
    [*(id *)(a1 + 40) writeLineWithFormat:@"upload pending quota (0): {}"];
  }
  [*(id *)(a1 + 40) writeLineWithFormat:&stru_26F3822F0];
  char v28 = *(void **)(a1 + 40);
  if (*(void *)(*(void *)(a1 + 32) + 80)) {
    [v28 writeLineWithFormat:@"download %@", *(void *)(*(void *)(a1 + 32) + 80)];
  }
  else {
    objc_msgSend(v28, "writeLineWithFormat:", @"download {none}", v45);
  }
  uint64_t v29 = *(void **)(a1 + 40);
  long long v30 = [*(id *)(*(void *)(a1 + 32) + 80) versionSizes];
  objc_msgSend(v29, "writeLineWithFormat:", @"download version sizes (%lu):", objc_msgSend(v30, "count"));

  long long v31 = *(id **)(a1 + 32);
  long long v32 = [v31[10] versionSizes];
  [v31 dumpDictionary:v32 withMaxCount:1000 toContext:*(void *)(a1 + 40)];

  long long v33 = [*(id *)(*(void *)(a1 + 32) + 80) childProgresses];
  uint64_t v34 = [v33 count];

  long long v35 = *(void **)(a1 + 40);
  if (v34)
  {
    long long v36 = [*(id *)(*(void *)(a1 + 32) + 80) childProgresses];
    objc_msgSend(v35, "writeLineWithFormat:", @"download progresses (%lu): {", objc_msgSend(v36, "count"));

    [*(id *)(a1 + 40) pushIndentation];
    long long v37 = [*(id *)(*(void *)(a1 + 32) + 80) childProgresses];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __35__BRCGlobalProgress_dumpToContext___block_invoke_3;
    v46[3] = &unk_2650836C8;
    id v47 = *(id *)(a1 + 40);
    [v37 enumerateKeysAndObjectsUsingBlock:v46];

    [*(id *)(a1 + 40) popIndentation];
    [*(id *)(a1 + 40) writeLineWithFormat:@"}"];
  }
  else
  {
    [*(id *)(a1 + 40) writeLineWithFormat:@"download progresses (0): {}"];
  }
  uint64_t v38 = *(void **)(a1 + 40);
  int v39 = [*(id *)(*(void *)(a1 + 32) + 80) resumeUnitCounts];
  uint64_t v40 = [v39 count];
  __int16 v41 = [*(id *)(*(void *)(a1 + 32) + 80) resumeUnitCounts];
  if ([v41 count])
  {
    uint64_t v42 = [*(id *)(*(void *)(a1 + 32) + 80) resumeUnitCounts];
    [v38 writeLineWithFormat:@"download resume unit count (%lu): %@", v40, v42];
  }
  else
  {
    [v38 writeLineWithFormat:@"download resume unit count (%lu): %@", v40, @"{}"];
  }

  return [*(id *)(a1 + 40) writeLineWithFormat:&stru_26F3822F0];
}

void __35__BRCGlobalProgress_dumpToContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  objc_msgSend(a3, "brc_dumpDescription");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 writeLineWithFormat:@"%@ = %@;", v5, v6];
}

void __35__BRCGlobalProgress_dumpToContext___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  objc_msgSend(a3, "brc_dumpDescription");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 writeLineWithFormat:@"%@ = %@;", v5, v6];
}

+ (id)_keyPathsToObserve
{
  if (_keyPathsToObserve_onceToken != -1) {
    dispatch_once(&_keyPathsToObserve_onceToken, &__block_literal_global_33);
  }
  uint64_t v2 = (void *)_keyPathsToObserve_keyPaths;
  return v2;
}

void __39__BRCGlobalProgress__keyPathsToObserve__block_invoke()
{
  v3[1] = *MEMORY[0x263EF8340];
  v0 = NSStringFromSelector(sel_completedUnitCount);
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
  uint64_t v2 = (void *)_keyPathsToObserve_keyPaths;
  _keyPathsToObserve_keyPaths = v1;
}

- (void)_startObservingProgress:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = objc_msgSend((id)objc_opt_class(), "_keyPathsToObserve", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = (void *)MEMORY[0x2455D97F0]();
        [v4 addObserver:self forKeyPath:v10 options:5 context:0];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_stopObservingProgress:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = objc_msgSend((id)objc_opt_class(), "_keyPathsToObserve", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v11 = (void *)MEMORY[0x2455D97F0]();
        [v4 removeObserver:self forKeyPath:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v7);
  }

  long long v12 = [v4 userInfo];
  long long v13 = [v12 objectForKeyedSubscript:@"_BRCObjectIDKey"];

  long long v14 = [MEMORY[0x263F325B8] fileObjectIDWithString:v13];
  if (!v14)
  {
    uint64_t v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCGlobalProgress _stopObservingProgress:]();
    }
  }
  long long v15 = [v4 userInfo];
  uint64_t v16 = [v15 objectForKeyedSubscript:@"_BRCProgressGroupKey"];

  if (!v16)
  {
    uint64_t v22 = brc_bread_crumbs();
    int v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[BRCGlobalProgress _stopObservingProgress:]();
    }
  }
  int v17 = [v16 shortValue];
  if (v14)
  {
    if (v17 == 1)
    {
      [(_BRCTransferInfo *)self->_uploads previousUnitCounts];
    }
    else
    {
      uint64_t v18 = [(_BRCTransferInfo *)self->_downloads previousUnitCounts];
      [v18 removeObjectForKey:v14];

      [(_BRCDownloadInfo *)self->_downloads resumeUnitCounts];
    uint64_t v19 = };
    [v19 removeObjectForKey:v14];
  }
}

- (id)_buildGlobalProgressObjectsWihCompletedUnitCount:(int64_t)a3 totalUnitCount:(int64_t)a4
{
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __85__BRCGlobalProgress__buildGlobalProgressObjectsWihCompletedUnitCount_totalUnitCount___block_invoke;
  v11[3] = &__block_descriptor_48_e28___BRCProgress_16__0__NSURL_8l;
  v11[4] = a3;
  v11[5] = a4;
  uint64_t v7 = (void (**)(void, void))MEMORY[0x2455D9A50](v11);
  uint64_t v8 = [MEMORY[0x263F325A0] mobileDocumentsURL];
  uint64_t v9 = ((void (**)(void, void *))v7)[2](v7, v8);
  [v9 setUserInfoObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F32470]];
  [v9 setUserInfoObject:*MEMORY[0x263F08488] forKey:*MEMORY[0x263F08480]];
  [v9 setKind:*MEMORY[0x263F084A0]];
  [v6 addObject:v9];

  return v6;
}

BRCProgress *__85__BRCGlobalProgress__buildGlobalProgressObjectsWihCompletedUnitCount_totalUnitCount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(BRCProgress);
  [(BRCProgress *)v4 setUserInfoObject:v3 forKey:*MEMORY[0x263F08498]];

  [(BRCProgress *)v4 setCompletedUnitCount:*(void *)(a1 + 32)];
  [(BRCProgress *)v4 setTotalUnitCount:*(void *)(a1 + 40)];
  [(BRCProgress *)v4 setCancellable:0];
  return v4;
}

- (void)_createNewIndeterminateGlobalProgress
{
}

- (void)_createNewGlobalProgressInGroup:(id)a3 completedUnitCount:(int64_t)a4 totalUnitCount:(int64_t)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_globalProgressMultiplex)
  {
    uint64_t v34 = brc_bread_crumbs();
    long long v35 = brc_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
      -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:].cold.6();
    }
  }
  if (a4 < 0)
  {
    long long v36 = brc_bread_crumbs();
    long long v37 = brc_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
      -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:].cold.5();
    }
  }
  BOOL v9 = a5 >= 0 && v8 == 0;
  if (a5 <= 0 && !v9)
  {
    uint64_t v38 = brc_bread_crumbs();
    int v39 = brc_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
      -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:].cold.4();
    }
  }
  if (v8)
  {
    [v8 intValue];
    if (!BRCPrettyPrintEnum())
    {
      uint64_t v42 = brc_bread_crumbs();
      __int16 v43 = brc_default_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
        -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:]();
      }
    }
  }
  if (!self->_lazyInitDone)
  {
    self->_lazyInitDone = 1;
    br_pacer_resume();
    uint64_t v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
    operationTimer = self->_operationTimer;
    self->_operationTimer = v10;

    self->_operationTimerSuspendCount = 1;
    objc_initWeak((id *)location, self);
    long long v12 = self->_operationTimer;
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __87__BRCGlobalProgress__createNewGlobalProgressInGroup_completedUnitCount_totalUnitCount___block_invoke;
    v44[3] = &unk_26507ED20;
    objc_copyWeak(&v45, (id *)location);
    long long v13 = v12;
    long long v14 = v44;
    long long v15 = v13;
    uint64_t v16 = v14;
    int v17 = v16;
    uint64_t v18 = v16;
    if (*MEMORY[0x263F32768])
    {
      uint64_t v18 = ((void (*)(void *))*MEMORY[0x263F32768])(v16);
    }
    dispatch_block_t v19 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v18);
    dispatch_source_set_event_handler(v15, v19);

    uint64_t v20 = +[BRCSystemResourcesManager manager];
    self->_networkReachable = [v20 isNetworkReachable];
    [v20 addReachabilityObserver:self];

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)location);
  }
  self->_showExtendedInfo = 0;
  uint64_t v21 = [(BRCGlobalProgress *)self _buildGlobalProgressObjectsWihCompletedUnitCount:a4 totalUnitCount:a5];
  uint64_t v22 = [[BRCProgressMultiplex alloc] initWithUnderlineProgressObjects:v21];
  globalProgressMultiplex = self->_globalProgressMultiplex;
  self->_globalProgressMultiplex = v22;

  [(BRCGlobalProgress *)self _updateGlobalProgress];
  long long v24 = brc_bread_crumbs();
  long long v25 = brc_notifications_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    if (v8)
    {
      [v8 intValue];
      long long v33 = (const char *)BRCPrettyPrintEnum();
    }
    else
    {
      long long v33 = "initial sync-down";
    }
    *(_DWORD *)id location = 136315394;
    *(void *)&location[4] = v33;
    __int16 v47 = 2112;
    v48 = v24;
    _os_log_debug_impl(&dword_23FA42000, v25, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: new global progress to track %s%@", location, 0x16u);
  }

  [(BRCProgressMultiplex *)self->_globalProgressMultiplex brc_publish];
  long long v26 = +[BRCUserDefaults defaultsForMangledID:0];
  [v26 intervalToWaitBeforeShowingAdditionalDescription];
  double v28 = v27;
  uint64_t v29 = self->_operationTimer;
  if (!v29)
  {
    uint64_t v40 = brc_bread_crumbs();
    __int16 v41 = brc_default_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
      -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:]();
    }

    uint64_t v29 = self->_operationTimer;
  }
  dispatch_time_t v30 = dispatch_time(0, 1000000000 * (uint64_t)v28);
  dispatch_source_set_timer(v29, v30, 0xFFFFFFFFFFFFFFFFLL, 0);
  if (self->_operationTimerSuspendCount == 1)
  {
    dispatch_resume((dispatch_object_t)self->_operationTimer);
    --self->_operationTimerSuspendCount;
  }
  else
  {
    long long v31 = brc_bread_crumbs();
    long long v32 = brc_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:]();
    }
  }
}

void __87__BRCGlobalProgress__createNewGlobalProgressInGroup_completedUnitCount_totalUnitCount___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[61] && (*((void *)WeakRetained + 9) || *((void *)WeakRetained + 10)))
  {
    WeakRetained[60] = 1;
    uint64_t v2 = WeakRetained;
    br_pacer_signal();
    id WeakRetained = v2;
  }
}

- (void)_createUploadMetadataWithCompletedUnitCount:(int64_t)a3 totalUnitCount:(int64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_uploads)
  {
    if ((a3 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
    goto LABEL_17;
  }
  uint64_t v16 = brc_bread_crumbs();
  int v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[BRCGlobalProgress _createUploadMetadataWithCompletedUnitCount:totalUnitCount:].cold.4();
  }

  if (a3 < 0)
  {
LABEL_17:
    uint64_t v18 = brc_bread_crumbs();
    dispatch_block_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:].cold.5();
    }
  }
LABEL_3:
  if (a4 < a3)
  {
    uint64_t v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCGlobalProgress _createUploadMetadataWithCompletedUnitCount:totalUnitCount:]();
    }
  }
  if (self->_globalProgressMultiplex)
  {
    uint64_t v7 = brc_bread_crumbs();
    id v8 = brc_notifications_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCGlobalProgress _createUploadMetadataWithCompletedUnitCount:totalUnitCount:]();
    }

    if (self->_downloads) {
      BOOL v9 = &unk_26F3DD2B0;
    }
    else {
      BOOL v9 = 0;
    }
    [(BRCGlobalProgress *)self _destroyProgressInGroup:v9 reason:2];
  }
  uint64_t v10 = objc_alloc_init(_BRCUploadInfo);
  uploads = self->_uploads;
  self->_uploads = v10;

  long long v12 = [(_BRCTransferInfo *)self->_uploads progress];
  [v12 setCompletedUnitCount:a3];

  long long v13 = [(_BRCTransferInfo *)self->_uploads progress];
  [v13 setTotalUnitCount:a4];

  long long v14 = [(_BRCTransferInfo *)self->_uploads progress];
  [v14 setCancellable:0];

  [(BRCGlobalProgress *)self _createNewGlobalProgressInGroup:&unk_26F3DD2C8 completedUnitCount:a3 totalUnitCount:a4];
  if ([(BRCProgressMultiplex *)self->_globalProgressMultiplex isPublished])
  {
    long long v15 = [(_BRCTransferInfo *)self->_uploads progress];
    objc_msgSend(v15, "brc_publish");
  }
  br_pacer_signal();
}

- (void)_updateGlobalProgress
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _globalProgressMultiplex.indeterminate%@", v2, v3, v4, v5, v6);
}

- (void)_cancelUploadForObjectID:(id)a3 inState:(unsigned int)a4
{
}

- (void)_cancelUploadForObjectID:(id)a3 inState:(unsigned int)a4 willRetryTransfer:(BOOL)a5
{
}

- (void)_cancelUploadForObjectID:(id)a3 inState:(unsigned int)a4 willRetryTransfer:(BOOL)a5 pendingQuota:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v10)
  {
    id v11 = [(_BRCTransferInfo *)self->_uploads versionSizes];
    long long v12 = [v11 objectForKeyedSubscript:v10];

    if (!v12)
    {
      uint64_t v34 = brc_bread_crumbs();
      long long v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        -[BRCGlobalProgress _cancelUploadForObjectID:inState:willRetryTransfer:pendingQuota:]();
      }
    }
    long long v13 = [(_BRCTransferInfo *)self->_uploads childProgresses];
    long long v14 = [v13 objectForKeyedSubscript:v10];

    long long v15 = [(_BRCTransferInfo *)self->_uploads previousUnitCounts];
    uint64_t v16 = [v15 objectForKeyedSubscript:v10];

    int v17 = brc_bread_crumbs();
    uint64_t v18 = brc_notifications_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v36 = 138413570;
      id v37 = v10;
      __int16 v38 = 1024;
      *(_DWORD *)int v39 = a4;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = v7;
      __int16 v40 = 1024;
      BOOL v41 = v6;
      __int16 v42 = 1024;
      BOOL v43 = v14 != 0;
      __int16 v44 = 2112;
      id v45 = v17;
      _os_log_debug_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: cancelling upload for doc with objectID %@ (syncUpState: %d, willRetry: %d, pendingQuota:%d, hasProgress: %d)%@", (uint8_t *)&v36, 0x2Eu);
    }

    if (v14) {
      [(BRCGlobalProgress *)self _stopObservingProgress:v14];
    }
    if (v7)
    {
      if (v6)
      {
        dispatch_block_t v19 = [(_BRCUploadInfo *)self->_uploads outOfQuotaObjIDs];
        [v19 addObject:v10];
LABEL_15:

        int v23 = [(_BRCTransferInfo *)self->_uploads versionSizes];
        uint64_t v24 = [v23 count];

        if (v24)
        {
          if (v14)
          {
            if (!v16)
            {
              long long v25 = brc_bread_crumbs();
              long long v26 = brc_notifications_log();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
                -[BRCGlobalProgress _cancelUploadForObjectID:inState:willRetryTransfer:pendingQuota:]();
              }
            }
            uint64_t v27 = _computeDelta(0, [v16 longLongValue], objc_msgSend(v12, "longLongValue"), -[NSObject totalUnitCount](v14, "totalUnitCount"), -[NSObject isFinished](v14, "isFinished"));
            double v28 = [(_BRCTransferInfo *)self->_uploads childProgresses];
            [v28 removeObjectForKey:v10];
          }
          else if (a4 == 4)
          {
            uint64_t v27 = [v12 longLongValue];
          }
          else
          {
            uint64_t v27 = 0;
          }
          [(_BRCTransferInfo *)self->_uploads setSumOfCompletedUnitCountDelta:[(_BRCTransferInfo *)self->_uploads sumOfCompletedUnitCountDelta] - v27];
          if (!v7)
          {
            uploads = self->_uploads;
            uint64_t v31 = [v12 longLongValue];
            [(_BRCTransferInfo *)uploads setSumOfTotalUnitCountDelta:[(_BRCTransferInfo *)uploads sumOfTotalUnitCountDelta]- 105 * v31 / 100- (105 * v31 / 100 == v31)];
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
              [(_BRCTransferInfo *)self->_uploads verifyFutureProgressIsNotFinished];
            }
          }
          br_pacer_signal();
        }
        else
        {
          uint64_t v29 = [(_BRCTransferInfo *)self->_uploads childProgresses];
          [v29 removeObjectForKey:v10];

          [(BRCGlobalProgress *)self _destroyUploadWithReason:1];
        }

        goto LABEL_31;
      }
    }
    else
    {
      uint64_t v20 = [(_BRCTransferInfo *)self->_uploads versionSizes];
      [v20 removeObjectForKey:v10];

      if (v6)
      {
        uint64_t v21 = brc_bread_crumbs();
        uint64_t v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          int v36 = 138412546;
          id v37 = v10;
          __int16 v38 = 2112;
          *(void *)int v39 = v21;
          _os_log_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: forcing pending quota to NO for doc with objectID %@ because transfer isn't retryable%@", (uint8_t *)&v36, 0x16u);
        }
      }
    }
    dispatch_block_t v19 = [(_BRCUploadInfo *)self->_uploads outOfQuotaObjIDs];
    [v19 removeObject:v10];
    goto LABEL_15;
  }
  long long v32 = brc_bread_crumbs();
  long long v33 = brc_default_log();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
    -[BRCGlobalProgress _cancelUploadForObjectID:inState:willRetryTransfer:pendingQuota:]();
  }

  long long v12 = brc_bread_crumbs();
  long long v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 138412290;
    id v37 = v12;
    _os_log_impl(&dword_23FA42000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: can't proceed to upload cancelation without objectID%@", (uint8_t *)&v36, 0xCu);
  }
LABEL_31:
}

- (void)_destroyProgressInGroup:(id)a3 reason:(char)a4
{
  unsigned int v4 = a4;
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v7 = [v6 shortValue];
  int v8 = [v6 shortValue];
  int v9 = v8;
  BOOL v10 = v7 == 1 || v8 == 2 && !self->_uploads || v6 == 0;
  id v11 = brc_bread_crumbs();
  long long v12 = brc_notifications_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (v6)
    {
      [v6 integerValue];
      v61 = (const char *)BRCPrettyPrintEnum();
    }
    else
    {
      v61 = "none";
    }
    *(_DWORD *)buf = 136315906;
    v94 = v61;
    __int16 v95 = 2080;
    uint64_t v96 = BRCPrettyPrintEnum();
    __int16 v97 = 1024;
    BOOL v98 = v10;
    __int16 v99 = 2112;
    v100 = v11;
    _os_log_debug_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: did finish global progress (group: %s, reason: %s, userVisible: %d)%@", buf, 0x26u);
  }

  if (v7 == 1 || v9 == 2)
  {
    uint64_t v14 = 80;
    if (v7 == 1) {
      uint64_t v14 = 72;
    }
    id v13 = *(id *)((char *)&self->super.isa + v14);
  }
  else
  {
    id v13 = 0;
  }
  if (v4 != 1)
  {
    if (v4) {
      goto LABEL_45;
    }
    if ([v13 sumOfCompletedUnitCountDelta])
    {
      v62 = brc_bread_crumbs();
      v63 = brc_default_log();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT)) {
        -[BRCGlobalProgress _destroyProgressInGroup:reason:]1();
      }
    }
    if ([v13 sumOfTotalUnitCountDelta])
    {
      v64 = brc_bread_crumbs();
      v65 = brc_default_log();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT)) {
        -[BRCGlobalProgress _destroyProgressInGroup:reason:]0();
      }
    }
    [v13 setSumOfCompletedUnitCountDelta:0];
    [v13 setSumOfTotalUnitCountDelta:0];
  }
  if ([v6 integerValue] == 1)
  {
    long long v15 = [(_BRCTransferInfo *)self->_uploads versionSizes];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      v66 = brc_bread_crumbs();
      v67 = brc_default_log();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT)) {
        -[BRCGlobalProgress _destroyProgressInGroup:reason:].cold.5();
      }
    }
    int v17 = [(_BRCTransferInfo *)self->_uploads childProgresses];
    uint64_t v18 = [v17 count];

    if (v18)
    {
      v68 = brc_bread_crumbs();
      v69 = brc_default_log();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT)) {
        -[BRCGlobalProgress _destroyProgressInGroup:reason:].cold.4();
      }
    }
    dispatch_block_t v19 = [(_BRCTransferInfo *)self->_uploads previousUnitCounts];
    uint64_t v20 = [v19 count];

    if (v20)
    {
      v70 = brc_bread_crumbs();
      v71 = brc_default_log();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT)) {
        -[BRCGlobalProgress _destroyProgressInGroup:reason:]();
      }
    }
    BOOL v82 = v10;
    uint64_t v21 = [(_BRCUploadInfo *)self->_uploads outOfQuotaObjIDs];
    uint64_t v22 = [v21 count];

    if (v22)
    {
      v72 = brc_bread_crumbs();
      v73 = brc_default_log();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT)) {
        -[BRCGlobalProgress _destroyProgressInGroup:reason:]();
      }
    }
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    int v23 = [(_BRCTransferInfo *)self->_uploads childProgresses];
    uint64_t v24 = [v23 allValues];

    uint64_t v25 = [v24 countByEnumeratingWithState:&v87 objects:v92 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v88;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v88 != v27) {
            objc_enumerationMutation(v24);
          }
          [(BRCGlobalProgress *)self _stopObservingProgress:*(void *)(*((void *)&v87 + 1) + 8 * i)];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v87 objects:v92 count:16];
      }
      while (v26);
    }

    uint64_t v29 = [(_BRCTransferInfo *)self->_uploads childProgresses];
    [v29 removeAllObjects];

    dispatch_time_t v30 = [(_BRCTransferInfo *)self->_uploads versionSizes];
    [v30 removeAllObjects];

    uint64_t v31 = [(_BRCTransferInfo *)self->_uploads previousUnitCounts];
    [v31 removeAllObjects];

    long long v32 = [(_BRCUploadInfo *)self->_uploads outOfQuotaObjIDs];
  }
  else
  {
    if ([v6 integerValue] != 2) {
      goto LABEL_45;
    }
    long long v33 = [(_BRCTransferInfo *)self->_downloads versionSizes];
    uint64_t v34 = [v33 count];

    if (v34)
    {
      v74 = brc_bread_crumbs();
      v75 = brc_default_log();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT)) {
        -[BRCGlobalProgress _destroyProgressInGroup:reason:].cold.9();
      }
    }
    long long v35 = [(_BRCTransferInfo *)self->_downloads childProgresses];
    uint64_t v36 = [v35 count];

    if (v36)
    {
      v76 = brc_bread_crumbs();
      v77 = brc_default_log();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
        -[BRCGlobalProgress _destroyProgressInGroup:reason:].cold.8();
      }
    }
    id v37 = [(_BRCTransferInfo *)self->_downloads previousUnitCounts];
    uint64_t v38 = [v37 count];

    if (v38)
    {
      v78 = brc_bread_crumbs();
      v79 = brc_default_log();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT)) {
        -[BRCGlobalProgress _destroyProgressInGroup:reason:].cold.7();
      }
    }
    BOOL v82 = v10;
    int v39 = [(_BRCDownloadInfo *)self->_downloads resumeUnitCounts];
    uint64_t v40 = [v39 count];

    if (v40)
    {
      v80 = brc_bread_crumbs();
      v81 = brc_default_log();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_FAULT)) {
        -[BRCGlobalProgress _destroyProgressInGroup:reason:].cold.6();
      }
    }
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    BOOL v41 = [(_BRCTransferInfo *)self->_downloads childProgresses];
    __int16 v42 = [v41 allValues];

    uint64_t v43 = [v42 countByEnumeratingWithState:&v83 objects:v91 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v84;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v84 != v45) {
            objc_enumerationMutation(v42);
          }
          [(BRCGlobalProgress *)self _stopObservingProgress:*(void *)(*((void *)&v83 + 1) + 8 * j)];
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v83 objects:v91 count:16];
      }
      while (v44);
    }

    __int16 v47 = [(_BRCTransferInfo *)self->_downloads childProgresses];
    [v47 removeAllObjects];

    v48 = [(_BRCTransferInfo *)self->_downloads versionSizes];
    [v48 removeAllObjects];

    uint64_t v49 = [(_BRCTransferInfo *)self->_downloads previousUnitCounts];
    [v49 removeAllObjects];

    long long v32 = [(_BRCDownloadInfo *)self->_downloads resumeUnitCounts];
  }
  v50 = v32;
  [v32 removeAllObjects];

  BOOL v10 = v82;
LABEL_45:
  if (v7 == 1)
  {
    p_uploads = (id *)&self->_uploads;
    v52 = [(_BRCTransferInfo *)self->_uploads progress];
    char v53 = [v52 isPublished];

    if ((v53 & 1) == 0)
    {
LABEL_48:
      id v55 = *p_uploads;
      id *p_uploads = 0;

      goto LABEL_49;
    }
LABEL_47:
    v54 = [*p_uploads progress];
    objc_msgSend(v54, "brc_unpublish");

    goto LABEL_48;
  }
  if (v4 != 2 && v9 == 2)
  {
    p_uploads = (id *)&self->_downloads;
    v58 = [(_BRCTransferInfo *)self->_downloads progress];
    int v59 = [v58 isPublished];

    if (!v59) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
LABEL_49:
  if (v10)
  {
    if (self->_operationTimerSuspendCount)
    {
      v56 = brc_bread_crumbs();
      v57 = brc_default_log();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT)) {
        -[BRCGlobalProgress _createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:]();
      }
    }
    else
    {
      dispatch_suspend((dispatch_object_t)self->_operationTimer);
      ++self->_operationTimerSuspendCount;
    }
    if ([(BRCProgressMultiplex *)self->_globalProgressMultiplex isPublished]) {
      [(BRCProgressMultiplex *)self->_globalProgressMultiplex brc_unpublish];
    }
    globalProgressMultiplex = self->_globalProgressMultiplex;
    self->_globalProgressMultiplex = 0;

    if (v4 <= 1) {
      [(BRCGlobalProgress *)self _resumeProgressForAnotherOperationIfNeeded];
    }
  }
}

- (void)_destroyUploadWithReason:(char)a3
{
  uint64_t v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_uploads)
  {
    [(BRCGlobalProgress *)self _destroyProgressInGroup:&unk_26F3DD2C8 reason:v3];
  }
}

- (void)_resumeProgressForAnotherOperationIfNeeded
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [*v0 versionSizes];
  [v1 count];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[NOTIF] Progress: resume download progress (%lu item downloading)%@", v4, v5, v6, v7, v8);
}

- (void)_updateDocument:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 fileObjectID];
  uint64_t v6 = [v4 orig];
  int v7 = [v6 syncUpState];

  int v8 = [v4 syncUpState];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  BOOL v10 = [WeakRetained fsUploader];
  char v11 = [v10 isDefaultOwnerOutOfQuota];

  long long v12 = [v4 currentVersion];
  uint64_t v13 = [v12 size];

  if (!v13)
  {
    long long v15 = brc_bread_crumbs();
    uint64_t v16 = brc_notifications_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[BRCGlobalProgress _updateDocument:]();
    }
    goto LABEL_8;
  }
  if (!v5)
  {
    long long v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCGlobalProgress _updateDocument:]();
    }
LABEL_8:

    goto LABEL_9;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__BRCGlobalProgress__updateDocument___block_invoke;
  block[3] = &unk_265083710;
  int v20 = v8;
  void block[4] = self;
  int v21 = v7;
  id v18 = v5;
  uint64_t v19 = v13;
  char v22 = v11;
  dispatch_sync(queue, block);

LABEL_9:
}

void __37__BRCGlobalProgress__updateDocument___block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  switch(*(_DWORD *)(a1 + 56))
  {
    case 2:
      int v8 = [*(id *)(*(void *)(a1 + 32) + 72) versionSizes];
      int v9 = [v8 objectForKeyedSubscript:*(void *)(a1 + 40)];

      if (v9)
      {
        BOOL v10 = brc_bread_crumbs();
        char v11 = brc_notifications_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __37__BRCGlobalProgress__updateDocument___block_invoke_cold_3((void *)(a1 + 40));
        }

        [*(id *)(a1 + 32) _cancelUploadForObjectID:*(void *)(a1 + 40) inState:*(unsigned int *)(a1 + 60)];
      }
      break;
    case 3:
    case 7:
      uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) versionSizes];
      uint64_t v3 = (uint64_t *)(a1 + 40);
      id v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

      if (v4)
      {
        int v5 = *(_DWORD *)(a1 + 60);
        if (v5 == 4 || v5 == 7)
        {
          uint64_t v6 = brc_bread_crumbs();
          int v7 = brc_notifications_log();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
            __37__BRCGlobalProgress__updateDocument___block_invoke_cold_4((void *)(a1 + 40));
          }

          [*(id *)(a1 + 32) _cancelUploadForObjectID:*(void *)(a1 + 40) inState:*(unsigned int *)(a1 + 60) willRetryTransfer:0];
        }
        else
        {
          dispatch_time_t v30 = brc_bread_crumbs();
          uint64_t v31 = brc_default_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v32 = *v3;
            *(_DWORD *)buf = 138412546;
            uint64_t v57 = v32;
            __int16 v58 = 2112;
            uint64_t v59 = (uint64_t)v30;
            _os_log_impl(&dword_23FA42000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: doc with objectID %@ shouldn't be uploading before its status is set to needs-upload%@", buf, 0x16u);
          }
        }
      }
      else
      {
        uint64_t v25 = *(void *)(a1 + 48);
        uint64_t v26 = 105 * v25 / 100;
        if (v26 == v25) {
          uint64_t v27 = v26 + 1;
        }
        else {
          uint64_t v27 = 105 * v25 / 100;
        }
        double v28 = *(id **)(a1 + 32);
        id v29 = v28[9];
        if (v29)
        {
          objc_msgSend(v29, "setSumOfTotalUnitCountDelta:", objc_msgSend(v28[9], "sumOfTotalUnitCountDelta") + v27);
          br_pacer_signal();
        }
        else
        {
          [v28 _createUploadMetadataWithCompletedUnitCount:0 totalUnitCount:v27];
        }
        uint64_t v40 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
        BOOL v41 = [*(id *)(*(void *)(a1 + 32) + 72) versionSizes];
        [v41 setObject:v40 forKeyedSubscript:*(void *)(a1 + 40)];

        __int16 v42 = brc_bread_crumbs();
        uint64_t v43 = brc_notifications_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v48 = *(void *)(a1 + 40);
          uint64_t v49 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138413058;
          uint64_t v57 = v48;
          __int16 v58 = 2048;
          uint64_t v59 = v49;
          __int16 v60 = 2048;
          uint64_t v61 = v27;
          __int16 v62 = 2112;
          v63 = v42;
          _os_log_debug_impl(&dword_23FA42000, v43, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: start tracking upload for doc with objectID %@ because document is needs-upload (versionSize: %lld, transferSize: %lld)%@", buf, 0x2Au);
        }

        if (*(unsigned char *)(a1 + 64))
        {
          id v18 = [*(id *)(*(void *)(a1 + 32) + 72) outOfQuotaObjIDs];
          [v18 addObject:*(void *)(a1 + 40)];
          goto LABEL_48;
        }
      }
      break;
    case 4:
      long long v12 = [*(id *)(*(void *)(a1 + 32) + 72) versionSizes];
      uint64_t v13 = [v12 objectForKeyedSubscript:*(void *)(a1 + 40)];

      if (v13)
      {
        uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 72) childProgresses];
        id v55 = [v14 objectForKeyedSubscript:*(void *)(a1 + 40)];

        long long v15 = v55;
        if (v55)
        {
          [*(id *)(a1 + 32) _stopObservingProgress:v55];
          uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 72) childProgresses];
          [v16 removeObjectForKey:*(void *)(a1 + 40)];

          long long v15 = v55;
        }
      }
      else
      {
        uint64_t v33 = *(void *)(a1 + 48);
        uint64_t v34 = 105 * v33 / 100;
        if (v34 == v33) {
          uint64_t v35 = v34 + 1;
        }
        else {
          uint64_t v35 = 105 * v33 / 100;
        }
        uint64_t v36 = *(id **)(a1 + 32);
        id v37 = v36[9];
        if (v37)
        {
          objc_msgSend(v37, "setSumOfCompletedUnitCountDelta:", *(void *)(a1 + 48) + objc_msgSend(v36[9], "sumOfCompletedUnitCountDelta"));
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "setSumOfTotalUnitCountDelta:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "sumOfTotalUnitCountDelta") + v35);
          br_pacer_signal();
        }
        else
        {
          objc_msgSend(v36, "_createUploadMetadataWithCompletedUnitCount:totalUnitCount:");
        }
        uint64_t v44 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
        uint64_t v45 = [*(id *)(*(void *)(a1 + 32) + 72) versionSizes];
        [v45 setObject:v44 forKeyedSubscript:*(void *)(a1 + 40)];

        uint64_t v46 = brc_bread_crumbs();
        __int16 v47 = brc_notifications_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v50 = *(void *)(a1 + 40);
          uint64_t v51 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 138413058;
          uint64_t v57 = v50;
          __int16 v58 = 2048;
          uint64_t v59 = v51;
          __int16 v60 = 2048;
          uint64_t v61 = v35;
          __int16 v62 = 2112;
          v63 = v46;
          _os_log_debug_impl(&dword_23FA42000, v47, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: resume upload for doc with objectID %@ because document is needs-sync-up but not tracked yet (versionSize: %lld, transferSize: %lld)%@", buf, 0x2Au);
        }
      }
      break;
    default:
      int v17 = [*(id *)(*(void *)(a1 + 32) + 72) versionSizes];
      id v18 = [v17 objectForKeyedSubscript:*(void *)(a1 + 40)];

      if (v18)
      {
        if (*(_DWORD *)(a1 + 60) == 4)
        {
          uint64_t v19 = [v18 longLongValue];
          if (105 * v19 / 100 == v19) {
            uint64_t v20 = 1;
          }
          else {
            uint64_t v20 = 105 * v19 / 100 - v19;
          }
          if (v20 <= 0)
          {
            char v53 = brc_bread_crumbs();
            v54 = brc_default_log();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT)) {
              __37__BRCGlobalProgress__updateDocument___block_invoke_cold_1();
            }
          }
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "setSumOfCompletedUnitCountDelta:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "sumOfCompletedUnitCountDelta") + v20);
          int v21 = brc_bread_crumbs();
          char v22 = brc_notifications_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v52 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138412802;
            uint64_t v57 = v52;
            __int16 v58 = 2048;
            uint64_t v59 = v20;
            __int16 v60 = 2112;
            uint64_t v61 = (uint64_t)v21;
            _os_log_debug_impl(&dword_23FA42000, v22, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: stop tracking upload for doc with objectID %@ because document is idle (syncUpSize: %lld)%@", buf, 0x20u);
          }

          int v23 = [*(id *)(*(void *)(a1 + 32) + 72) versionSizes];
          [v23 removeObjectForKey:*(void *)(a1 + 40)];

          uint64_t v24 = [*(id *)(*(void *)(a1 + 32) + 72) outOfQuotaObjIDs];
          [v24 removeObject:*(void *)(a1 + 40)];

          br_pacer_signal();
        }
        else
        {
          uint64_t v38 = brc_bread_crumbs();
          int v39 = brc_notifications_log();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
            __37__BRCGlobalProgress__updateDocument___block_invoke_cold_2((void *)(a1 + 40));
          }

          [*(id *)(a1 + 32) _cancelUploadForObjectID:*(void *)(a1 + 40) inState:*(unsigned int *)(a1 + 60) willRetryTransfer:0];
        }
      }
LABEL_48:

      break;
  }
}

- (void)_deleteDocument:(id)a3 reason:(char)a4
{
}

- (void)_deleteDocument:(id)a3 reason:(char)a4 sync:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = [v8 orig];
  BOOL v10 = [v9 fileObjectID];

  char v11 = [v8 orig];

  int v12 = [v11 syncUpState];
  if ([v10 rawID])
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __49__BRCGlobalProgress__deleteDocument_reason_sync___block_invoke;
    v17[3] = &unk_265083738;
    v17[4] = self;
    id v18 = v10;
    char v20 = a4;
    int v19 = v12;
    uint64_t v13 = (void *)MEMORY[0x2455D9A50](v17);
    queue = self->_queue;
    if (v5) {
      dispatch_sync(queue, v13);
    }
    else {
      dispatch_async(queue, v13);
    }
  }
  else
  {
    long long v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      char v22 = v10;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Progress: can't delete document from progress without an objectID %@%@", buf, 0x16u);
    }
  }
}

void __49__BRCGlobalProgress__deleteDocument_reason_sync___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) versionSizes];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = brc_bread_crumbs();
    BOOL v5 = brc_notifications_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138412802;
      uint64_t v8 = v6;
      __int16 v9 = 2080;
      uint64_t v10 = BRCPrettyPrintEnum();
      __int16 v11 = 2112;
      int v12 = v4;
      _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[NOTIF] Progress: stop tracking upload progress of doc with objectID %@ (reason: %s)%@", (uint8_t *)&v7, 0x20u);
    }

    [*(id *)(a1 + 32) _cancelUploadForObjectID:*(void *)(a1 + 40) inState:*(unsigned int *)(a1 + 48)];
  }
}

- (BRCAccountSessionFPFS)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (BRCAccountSessionFPFS *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloads, 0);
  objc_storeStrong((id *)&self->_uploads, 0);
  objc_storeStrong((id *)&self->_globalProgressMultiplex, 0);
  objc_storeStrong((id *)&self->_operationTimer, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_resumeTracker, 0);
  objc_storeStrong((id *)&self->_updatePacer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  [*v0 count];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v1, v2, "[NOTIF] Progress: started resuming progress for %lu zones%@", v3, v4, v5, v6, v7);
}

void __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !self->_resumeTracker%@", v2, v3, v4, v5, v6);
}

void __44__BRCGlobalProgress_resumeProgressForZones___block_invoke_142_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[NOTIF] Progress: finished resuming progresses%@", v2, v3, v4, v5, v6);
}

- (void)didUpdateDocument:.cold.1()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 fileObjectID];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[NOTIF] Progress: doc %@ was reparented outside the visible scope of iCloud Drive, force deletion%@", v4, v5, v6, v7, v8);
}

- (void)didUpdateDocument:.cold.2()
{
  OUTLINED_FUNCTION_12();
  uint64_t v1 = [v0 fileObjectID];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[NOTIF] Progress: doc %@ is now dead, force deletion%@", v4, v5, v6, v7, v8);
}

- (void)didDeleteDocument:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: item%@", v2, v3, v4, v5, v6);
}

void __43__BRCGlobalProgress_stopPublishingProgress__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[NOTIF] Progress: stop publishing global progress%@", v2, v3, v4, v5, v6);
}

- (void)addProgress:forDocument:inGroup:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: group == BRCProgressUploadGroup || group == BRCProgressDownloadGroup%@", v2, v3, v4, v5, v6);
}

- (void)addProgress:forDocument:inGroup:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: progress%@", v2, v3, v4, v5, v6);
}

- (void)addProgress:forDocument:inGroup:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: group == BRCProgressUploadGroup%@", v2, v3, v4, v5, v6);
}

- (void)updateUploadThrottleForDocument:(uint64_t)a1 toState:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = 0;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't update progress for document without an objectID %@%@", (uint8_t *)&v2, 0x16u);
}

- (void)_stopObservingProgress:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: progressGroup%@", v2, v3, v4, v5, v6);
}

- (void)_stopObservingProgress:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: objID%@", v2, v3, v4, v5, v6);
}

- (void)_createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:.cold.1()
{
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_11_1(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Invalid suspend count (_operationTimerSuspendCount: %u)%@");
}

- (void)_createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _operationTimer%@", v2, v3, v4, v5, v6);
}

- (void)_createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !group || BRCProgressGroupPrettyPrint(group.intValue)%@", v2, v3, v4, v5, v6);
}

- (void)_createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: (!group && totalUnitCount >= 0) || totalUnitCount > 0%@", v2, v3, v4, v5, v6);
}

- (void)_createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: completedUnitCount >= 0%@", v2, v3, v4, v5, v6);
}

- (void)_createNewGlobalProgressInGroup:completedUnitCount:totalUnitCount:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _globalProgressMultiplex == nil%@", v2, v3, v4, v5, v6);
}

- (void)_createUploadMetadataWithCompletedUnitCount:totalUnitCount:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[NOTIF] Progress: take over current progress because uploads have priority%@", v2, v3, v4, v5, v6);
}

- (void)_createUploadMetadataWithCompletedUnitCount:totalUnitCount:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: totalUnitCount >= completedUnitCount%@", v2, v3, v4, v5, v6);
}

- (void)_createUploadMetadataWithCompletedUnitCount:totalUnitCount:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _uploads == nil%@", v2, v3, v4, v5, v6);
}

- (void)_cancelUploadForObjectID:inState:willRetryTransfer:pendingQuota:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: objectID%@", v2, v3, v4, v5, v6);
}

- (void)_cancelUploadForObjectID:inState:willRetryTransfer:pendingQuota:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[NOTIF] Progress: upload progress for doc with objectID %@ has no previous completed unit count%@");
}

- (void)_cancelUploadForObjectID:inState:willRetryTransfer:pendingQuota:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: versionSize%@", v2, v3, v4, v5, v6);
}

- (void)_destroyProgressInGroup:reason:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _uploads.outOfQuotaObjIDs.count == 0%@", v2, v3, v4, v5, v6);
}

- (void)_destroyProgressInGroup:reason:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _uploads.previousUnitCounts.count == 0%@", v2, v3, v4, v5, v6);
}

- (void)_destroyProgressInGroup:reason:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _uploads.childProgresses.count == 0%@", v2, v3, v4, v5, v6);
}

- (void)_destroyProgressInGroup:reason:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _uploads.versionSizes.count == 0%@", v2, v3, v4, v5, v6);
}

- (void)_destroyProgressInGroup:reason:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _downloads.resumeUnitCounts.count == 0%@", v2, v3, v4, v5, v6);
}

- (void)_destroyProgressInGroup:reason:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _downloads.previousUnitCounts.count == 0%@", v2, v3, v4, v5, v6);
}

- (void)_destroyProgressInGroup:reason:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _downloads.childProgresses.count == 0%@", v2, v3, v4, v5, v6);
}

- (void)_destroyProgressInGroup:reason:.cold.9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: _downloads.versionSizes.count == 0%@", v2, v3, v4, v5, v6);
}

- (void)_destroyProgressInGroup:reason:.cold.10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: transferInfo.sumOfTotalUnitCountDelta == 0%@", v2, v3, v4, v5, v6);
}

- (void)_destroyProgressInGroup:reason:.cold.11()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: transferInfo.sumOfCompletedUnitCountDelta == 0%@", v2, v3, v4, v5, v6);
}

- (void)_updateDocument:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[NOTIF] Progress: ignore upload for doc with objectID %@ because its version size is equal to zero.%@");
}

- (void)_updateDocument:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: can't register progress for item without an objectID %@%@");
}

void __37__BRCGlobalProgress__updateDocument___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: syncUpSize > 0%@", v2, v3, v4, v5, v6);
}

void __37__BRCGlobalProgress__updateDocument___block_invoke_cold_2(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[NOTIF] Progress: cancelling upload for doc with objectID %@ because its wasn't uploaded%@", (void)v3, DWORD2(v3));
}

void __37__BRCGlobalProgress__updateDocument___block_invoke_cold_3(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[NOTIF] Progress: stop tracking upload for doc with objectID %@ because document is in needs-read%@", (void)v3, DWORD2(v3));
}

void __37__BRCGlobalProgress__updateDocument___block_invoke_cold_4(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[NOTIF] Progress: cancelling upload for doc with objectID %@ because its needs to be uploaded again%@", (void)v3, DWORD2(v3));
}

@end