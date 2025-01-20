@interface BRCFileProvidingRequestOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCFileProvidingRequestOperation)initWithDocumentItem:(id)a3 client:(id)a4 session:(id)a5;
- (BRCFileProvidingRequestOperation)initWithDocumentItem:(id)a3 client:(id)a4 session:(id)a5 etagIfLoser:(id)a6 stageFileName:(id)a7 options:(unint64_t)a8;
- (BRCFileProvidingRequestOperation)initWithName:(id)a3 session:(id)a4;
- (NSSet)trackedFileObjects;
- (int)kind;
- (void)_detachAllTrackedDocID:(id)a3 error:(id)a4;
- (void)_finishAfterWaitingForDocumentsWithID:(id)a3 withEtagIfLoser:(id)a4 error:(id)a5;
- (void)_provideDocument:(id)a3;
- (void)_provideItem;
- (void)addCompletionCallback:(id)a3;
- (void)cancel;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)networkReachabilityChanged:(BOOL)a3;
@end

@implementation BRCFileProvidingRequestOperation

- (BRCFileProvidingRequestOperation)initWithDocumentItem:(id)a3 client:(id)a4 session:(id)a5 etagIfLoser:(id)a6 stageFileName:(id)a7 options:(unint64_t)a8
{
  id v15 = a6;
  id v16 = a7;
  v17 = [(BRCFileProvidingRequestOperation *)self initWithDocumentItem:a3 client:a4 session:a5];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_etagIfLoser, a6);
    objc_storeStrong((id *)&v18->_stageFileName, a7);
    v18->_options = a8;
  }

  return v18;
}

- (void)addCompletionCallback:(id)a3
{
  id v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  callbacks = v4->_callbacks;
  if (!callbacks)
  {
    uint64_t v6 = objc_opt_new();
    v7 = v4->_callbacks;
    v4->_callbacks = (NSMutableArray *)v6;

    callbacks = v4->_callbacks;
  }
  v8 = (void *)MEMORY[0x2455D9A50](v9);
  [(NSMutableArray *)callbacks addObject:v8];

  objc_sync_exit(v4);
}

- (NSSet)trackedFileObjects
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(NSMutableSet *)v2->_trackerFileObjects copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (BRCFileProvidingRequestOperation)initWithName:(id)a3 session:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BRCFileProvidingRequestOperation;
  v8 = [(_BRCOperation *)&v14 initWithName:a3];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_session, a4);
    if (initWithName_session__onceToken != -1) {
      dispatch_once(&initWithName_session__onceToken, &__block_literal_global_40);
    }
    v10 = [(_BRCOperation *)v9 callbackQueue];
    dispatch_set_target_queue(v10, (dispatch_queue_t)initWithName_session__queue);

    [(_BRCOperation *)v9 setNonDiscretionary:1];
    v11 = [(BRCAccountSessionFPFS *)v9->_session analyticsReporter];
    v12 = [(_BRCOperation *)v9 operationID];
    [v11 createUserDownloadEventForOperationID:v12 isRecursive:0 isForBackup:0];
  }
  return v9;
}

void __57__BRCFileProvidingRequestOperation_initWithName_session___block_invoke()
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("provide-request-queue", v0);

  v2 = (void *)initWithName_session__queue;
  initWithName_session__queue = (uint64_t)v1;
}

- (BRCFileProvidingRequestOperation)initWithDocumentItem:(id)a3 client:(id)a4 session:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(BRCFileProvidingRequestOperation *)self initWithName:@"document-download" session:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_documentItem, a3);
    objc_storeStrong((id *)&v12->_client, a4);
    uint64_t v13 = objc_opt_new();
    trackerFileObjects = v12->_trackerFileObjects;
    v12->_trackerFileObjects = (NSMutableSet *)v13;

    [(_BRCFrameworkOperation *)v12 setIgnoreMissingRemoteClientProxy:1];
  }

  return v12;
}

- (void)cancel
{
  v8.receiver = self;
  v8.super_class = (Class)BRCFileProvidingRequestOperation;
  [(_BRCOperation *)&v8 cancel];
  v3 = self;
  objc_sync_enter(v3);
  v4 = (NSSet *)[(NSMutableSet *)v3->_trackerFileObjects copy];
  trackedVersionsToCancel = v3->_trackedVersionsToCancel;
  v3->_trackedVersionsToCancel = v4;
  uint64_t v6 = v4;

  objc_sync_exit(v3);
  id v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3072 userInfo:0];
  [(BRCFileProvidingRequestOperation *)v3 _detachAllTrackedDocID:v6 error:v7];
}

- (void)_detachAllTrackedDocID:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_super v14 = objc_msgSend(v13, "fileObjectID", (void)v16);
          id v15 = [v13 etagIfLoser];
          [(BRCFileProvidingRequestOperation *)self downloadTrackedForFileObjectID:v14 withEtagIfLoser:v15 didFinishWithError:v7];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  else
  {
    [(BRCFileProvidingRequestOperation *)self downloadTrackedForFileObjectID:0 withEtagIfLoser:0 didFinishWithError:v7];
  }
}

- (void)_provideDocument:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 fileObjectID];
  if (self->_client)
  {
    id v6 = [v4 appLibrary];
    if (v6 && ([(NSMutableSet *)self->_appLibrariesMonitored containsObject:v6] & 1) == 0)
    {
      [(NSMutableSet *)self->_appLibrariesMonitored addObject:v6];
      [(BRCXPCClient *)self->_client addAppLibrary:v6];
    }
  }
  unint64_t options = self->_options;
  id v8 = self->_etagIfLoser;
  uint64_t v9 = self->_stageFileName;
  id v30 = 0;
  char v10 = [v4 startDownloadInTask:0 options:options etagIfLoser:v8 stageFileName:v9 error:&v30];
  id v11 = v30;
  if (v10)
  {
    v12 = self;
    objc_sync_enter(v12);
    char v13 = [(BRCFileProvidingRequestOperation *)v12 isCancelled];
    if (v13)
    {
      int v14 = 0;
    }
    else
    {
      long long v17 = +[BRCSystemResourcesManager manager];
      char v18 = [v17 isNetworkReachable];

      if (v18)
      {
        trackerFileObjects = v12->_trackerFileObjects;
        v20 = +[BRCTrackedVersion trackedVersionFor:v5 withEtagIfLoser:v8 kind:[(BRCFileProvidingRequestOperation *)v12 kind]];
        [(NSMutableSet *)trackerFileObjects addObject:v20];

        uint64_t v21 = [(BRCAccountSessionFPFS *)v12->_session analyticsReporter];
        v22 = [(_BRCOperation *)v12 operationID];
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __53__BRCFileProvidingRequestOperation__provideDocument___block_invoke;
        v27[3] = &unk_265083CE0;
        id v28 = v5;
        id v29 = v4;
        [v21 lookupUserDownloadEventByOperationID:v22 accessor:v27];

        v23 = v28;
      }
      else
      {
        uint64_t v24 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4355 userInfo:0];
        v23 = v11;
        id v11 = (id)v24;
      }

      int v14 = 0;
      if (!v12->_isMonitoringReachability && !v11)
      {
        int v14 = 1;
        v12->_isMonitoringReachability = 1;
      }
    }
    objc_sync_exit(v12);

    if (v11)
    {
      [(BRCFileProvidingRequestOperation *)v12 _finishAfterWaitingForDocumentsWithID:v5 withEtagIfLoser:v8 error:v11];
    }
    else
    {
      if ((v13 & 1) == 0)
      {
        v25 = [(BRCAccountSessionFPFS *)v12->_session downloadTrackers];
        [v25 addDownloadTracker:v12 forFileObjectID:v5 withEtagIfLoser:v8];

        if (v14)
        {
          v26 = +[BRCSystemResourcesManager manager];
          [v26 addReachabilityObserver:v12];
        }
      }
      id v11 = 0;
    }
  }
  else
  {
    id v15 = brc_bread_crumbs();
    long long v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v32 = v4;
      __int16 v33 = 2112;
      id v34 = v11;
      __int16 v35 = 2112;
      v36 = v15;
      _os_log_debug_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Failed to start downloading item %@: %@%@", buf, 0x20u);
    }

    [(BRCFileProvidingRequestOperation *)self _finishAfterWaitingForDocumentsWithID:0 withEtagIfLoser:0 error:v11];
  }
}

void __53__BRCFileProvidingRequestOperation__provideDocument___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 fileObjectIDs];
  [v4 addObject:*(void *)(a1 + 32)];

  objc_msgSend(v3, "setItemCount:", objc_msgSend(v3, "itemCount") + 1);
  id v5 = [*(id *)(a1 + 40) currentVersion];
  objc_msgSend(v3, "setTotalContentSize:", objc_msgSend(v3, "totalContentSize") + objc_msgSend(v5, "size"));
}

- (void)_provideItem
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _documentItem != nil%@", (uint8_t *)&v2, 0xCu);
}

- (void)main
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = *a1;
  int v3 = 138412546;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_23FA42000, v2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: clientDB queue is nil for session %@%@", (uint8_t *)&v3, 0x16u);
}

void __40__BRCFileProvidingRequestOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 32);
  if ([*(id *)(a1 + 32) finishIfCancelled])
  {
    os_log_t v2 = brc_bread_crumbs();
    int v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __40__BRCFileProvidingRequestOperation_main__block_invoke_cold_1(v1);
    }
  }
  else
  {
    uint64_t v4 = *v1;
    [v4 _provideItem];
  }
}

- (void)networkReachabilityChanged:(BOOL)a3
{
  if (!a3)
  {
    memset(v11, 0, sizeof(v11));
    __brc_create_section(0, (uint64_t)"-[BRCFileProvidingRequestOperation networkReachabilityChanged:]", 333, v11);
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[BRCFileProvidingRequestOperation networkReachabilityChanged:](v11);
    }

    id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4355 userInfo:0];
    id v7 = [(_BRCOperation *)self callbackQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__BRCFileProvidingRequestOperation_networkReachabilityChanged___block_invoke;
    v9[3] = &unk_26507ED98;
    v9[4] = self;
    id v8 = v6;
    id v10 = v8;
    dispatch_async_with_logs_7(v7, v9);

    __brc_leave_section(v11);
  }
}

void __63__BRCFileProvidingRequestOperation_networkReachabilityChanged___block_invoke(uint64_t a1)
{
  os_log_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 trackedFileObjects];
  [v2 _detachAllTrackedDocID:v3 error:*(void *)(a1 + 40)];
}

- (void)_finishAfterWaitingForDocumentsWithID:(id)a3 withEtagIfLoser:(id)a4 error:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = self;
  objc_sync_enter(v10);
  if (v10->_isFinished)
  {
    objc_sync_exit(v10);

LABEL_11:
    goto LABEL_12;
  }
  p_lastDownloadError = (id *)&v10->_lastDownloadError;
  if (v9) {
    objc_storeStrong(p_lastDownloadError, a5);
  }
  else {
    id v9 = *p_lastDownloadError;
  }
  objc_sync_exit(v10);

  v12 = v10;
  objc_sync_enter(v12);
  if (v16)
  {
    id v13 = v12[70];
    int v14 = +[BRCTrackedVersion trackedVersionFor:withEtagIfLoser:kind:](BRCTrackedVersion, "trackedVersionFor:withEtagIfLoser:kind:", v16, v8, [v12 kind]);
    [v13 removeObject:v14];
  }
  uint64_t v15 = [v12[70] count];
  objc_sync_exit(v12);

  if (!v15 || v9)
  {
    v10->_isFinished = 1;
    [v12 completedWithResult:0 error:v9];
    goto LABEL_11;
  }
LABEL_12:
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (int)kind
{
  return +[BRCFSDownloaderUtil downloadKindWithEtagIfLoser:self->_etagIfLoser options:self->_options];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCFileProvidingRequestOperation finishWithResult:error:]((uint64_t)v7);
    }
  }
  else
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCFileProvidingRequestOperation finishWithResult:error:]((uint64_t)v8, v9);
    }
  }

  id v10 = [(BRCAccountSessionFPFS *)self->_session analyticsReporter];
  id v11 = [(_BRCOperation *)self operationID];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke;
  v43[3] = &unk_265083CE0;
  id v12 = v7;
  id v44 = v12;
  v45 = self;
  [v10 lookupUserDownloadEventByOperationID:v11 accessor:v43];

  if (v7)
  {
    if (![(BRCFileProvidingRequestOperation *)self isCancelled]) {
      goto LABEL_11;
    }
    id v13 = brc_task_tracker_create("cancellation");
    int v14 = [(BRCAccountSessionFPFS *)self->_session clientDB];
    uint64_t v15 = [v14 serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2;
    block[3] = &unk_26507ED70;
    block[4] = self;
    dispatch_sync(v15, block);

    brc_task_tracker_wait((uint64_t)v13);
  }
  else
  {
    id v13 = [(BRCAccountSessionFPFS *)self->_session clientDB];
    id v16 = [v13 serialQueue];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2_14;
    v41[3] = &unk_26507ED70;
    v41[4] = self;
    dispatch_sync(v16, v41);
  }
LABEL_11:
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v17 = self->_appLibrariesMonitored;
  uint64_t v18 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v17);
        }
        [(BRCXPCClient *)self->_client removeAppLibrary:*(void *)(*((void *)&v37 + 1) + 8 * i)];
      }
      uint64_t v19 = [(NSMutableSet *)v17 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v19);
  }

  v22 = +[BRCSystemResourcesManager manager];
  [v22 removeReachabilityObserver:self];

  v23 = [(BRCAccountSessionFPFS *)self->_session downloadTrackers];
  [v23 removeDownloadTracker:self];

  uint64_t v24 = self;
  objc_sync_enter(v24);
  v25 = v24->_callbacks;
  callbacks = v24->_callbacks;
  v24->_callbacks = 0;

  objc_sync_exit(v24);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v27 = v25;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v34;
LABEL_20:
    uint64_t v31 = 0;
    while (1)
    {
      if (*(void *)v34 != v30) {
        objc_enumerationMutation(v27);
      }
      if (!(*(unsigned int (**)(void))(*(void *)(*((void *)&v33 + 1) + 8 * v31) + 16))()) {
        break;
      }
      if (v29 == ++v31)
      {
        uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v33 objects:v46 count:16];
        if (v29) {
          goto LABEL_20;
        }
        break;
      }
    }
  }

  v32.receiver = v24;
  v32.super_class = (Class)BRCFileProvidingRequestOperation;
  [(_BRCFrameworkOperation *)&v32 finishWithResult:v6 error:v12];
}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [MEMORY[0x263EFF910] date];
  [v7 setEndTime:v3];

  [v7 setDidSucceed:*(void *)(a1 + 32) == 0];
  uint64_t v4 = [v7 itemCount];
  uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 544) analyticsReporter];
  id v6 = v5;
  if (v4) {
    [v5 submitEventMetric:v7];
  }
  else {
    [v5 forgetEventMetric:v7];
  }
}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = *(id *)(*(void *)(a1 + 32) + 584);
  objc_sync_exit(v2);

  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2_cold_1((uint64_t)v3);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*(void *)(a1 + 32) + 544);
        id v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v10), "fileObjectID", (void)v16);
        id v13 = [v11 itemByFileObjectID:v12];

        int v14 = [v13 session];
        uint64_t v15 = [v14 fsDownloader];
        objc_msgSend(v15, "cancelAndCleanupItemDownload:kind:", v13, objc_msgSend(*(id *)(a1 + 32), "kind"));

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2_14(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 544) clientDB];
  [v1 flushToMakeEditsVisibleToIPCReaders];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDownloadError, 0);
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_trackedVersionsToCancel, 0);
  objc_storeStrong((id *)&self->_documentItem, 0);
  objc_storeStrong((id *)&self->_appLibrariesMonitored, 0);
  objc_storeStrong((id *)&self->_trackerFileObjects, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_stageFileName, 0);
  objc_storeStrong((id *)&self->_etagIfLoser, 0);
}

void __40__BRCFileProvidingRequestOperation_main__block_invoke_cold_1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] %@ was cancelled%@", (void)v3, DWORD2(v3));
}

- (void)networkReachabilityChanged:(void *)a1 .cold.1(void *a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] ┏%llx network becomes not reachable, finishing the providing request%@", (void)v3, DWORD2(v3));
}

- (void)finishWithResult:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23FA42000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] granting coordinated read%@", (uint8_t *)&v2, 0xCu);
}

- (void)finishWithResult:(uint64_t)a1 error:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] failing coordinated read with %@%@", (void)v3, DWORD2(v3));
}

void __59__BRCFileProvidingRequestOperation_finishWithResult_error___block_invoke_2_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] we were cancelled, cancelling docIDs %@%@", (void)v3, DWORD2(v3));
}

@end