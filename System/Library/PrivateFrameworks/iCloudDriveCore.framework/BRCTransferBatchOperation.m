@interface BRCTransferBatchOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCTransferBatchOperation)initWithName:(id)a3 syncContext:(id)a4 sessionContext:(id)a5;
- (BRCTransferBatchOperation)initWithName:(id)a3 syncContext:(id)a4 sessionContext:(id)a5 group:(id)a6;
- (NSString)description;
- (OS_dispatch_group)pendingGroup;
- (double)progressForTransferID:(id)a3;
- (id)_finishedTransferForRecord:(id)a3 recordID:(id)a4 error:(id)a5;
- (id)actionPrettyName;
- (id)createActivity;
- (id)didProgressBlock;
- (id)fetchOperationForTransfers:(id)a3 traceCode:(int)a4;
- (id)subclassableDescriptionWithContext:(id)a3;
- (id)transferredObjectsPrettyName;
- (unint64_t)doneSize;
- (unint64_t)itemsCount;
- (unint64_t)totalSize;
- (void)_addTransfer:(id)a3;
- (void)_cancelTransferID:(id)a3;
- (void)_finishedTransfer:(id)a3 error:(id)a4;
- (void)_setProgress:(double)a3 forTransfer:(id)a4;
- (void)addAliasItem:(id)a3 toTransferWithID:(id)a4;
- (void)addTransfer:(id)a3;
- (void)cancelTransferID:(id)a3;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)finishedTransferForRecord:(id)a3 recordID:(id)a4 error:(id)a5;
- (void)main;
- (void)mainWithTransfers:(id)a3;
- (void)sendBatchProgressedCallback;
- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4;
- (void)setDidProgressBlock:(id)a3;
- (void)setDoneSize:(unint64_t)a3;
- (void)setProgress:(double)a3 forRecordID:(id)a4;
- (void)setTotalSize:(unint64_t)a3;
@end

@implementation BRCTransferBatchOperation

- (BRCTransferBatchOperation)initWithName:(id)a3 syncContext:(id)a4 sessionContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [v8 session];
  v12 = [v11 fsDownloader];
  v13 = [v12 hasWorkGroup];

  v14 = [v8 contextIdentifier];
  v15 = [v10 stringByAppendingPathComponent:v14];

  v16 = [(BRCTransferBatchOperation *)self initWithName:v15 syncContext:v8 sessionContext:v9 group:v13];
  if (v16)
  {
    v17 = [(_BRCOperation *)v16 callbackQueue];
    v18 = [v8 session];
    v19 = [v18 fsDownloader];
    v20 = [v19 downloadsDeadlineScheduler];
    v21 = [v20 workloop];
    dispatch_set_target_queue(v17, v21);
  }
  return v16;
}

- (id)fetchOperationForTransfers:(id)a3 traceCode:(int)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[BRCAccountsManager sharedManager];
  int v6 = [v5 isInSyncBubble];

  if (v6)
  {
    v34 = brc_bread_crumbs();
    v35 = brc_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
      -[BRCTransferBatchOperation(Downloads) fetchOperationForTransfers:traceCode:]((uint64_t)v34, v35);
    }
  }
  v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[BRCTransferBatchOperation itemsCount](self, "itemsCount"));
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[BRCTransferBatchOperation itemsCount](self, "itemsCount"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v14 = [v13 recordID];
        v15 = [v8 objectForKey:v14];
        BOOL v16 = v15 == 0;

        if (v16)
        {
          v20 = [v13 secondaryRecordID];

          if (v20)
          {
            v21 = [v13 secondaryRecordID];
            [v7 addObject:v21];
          }
          v22 = [v13 recordID];
          [v7 addObject:v22];

          if (([v13 progressPublished] & 1) == 0)
          {
            brc_bread_crumbs();
            v23 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
            v24 = brc_default_log();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              *(void *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v13;
              *(_WORD *)&buf[22] = 2112;
              v48 = v23;
              _os_log_debug_impl(&dword_23FA42000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Publishing download progress for %@%@", buf, 0x20u);
            }

            v25 = [v13 progress];
            objc_msgSend(v25, "brc_publish");

            [v13 setProgressPublished:1];
          }
          v17 = [v13 etag];
          v18 = [v13 recordID];
          [v8 setObject:v17 forKeyedSubscript:v18];
        }
        else
        {
          v17 = brc_bread_crumbs();
          v18 = brc_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            v19 = [v13 recordID];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v19;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v17;
            _os_log_fault_impl(&dword_23FA42000, v18, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: We got two downloads for the same record ID: %@%@", buf, 0x16u);
          }
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v10);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v48 = __Block_byref_object_copy__33;
  v49 = __Block_byref_object_dispose__33;
  id v50 = 0;
  v26 = [(BRCTransferBatchOperation *)self pendingGroup];
  dispatch_group_enter(v26);

  v27 = [(BRCTransferBatchOperation *)self pendingGroup];
  v28 = [(_BRCOperation *)self callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke;
  block[3] = &unk_265084330;
  block[4] = self;
  block[5] = buf;
  int v42 = a4;
  dispatch_group_notify(v27, v28, block);

  [(BRCTransferBatchOperation *)self hash];
  kdebug_trace();
  v29 = [[BRFetchRecordsOperation alloc] initWithRecordIDs:v7];
  [(BRFetchRecordsOperation *)v29 setShouldFetchAssetContent:1];
  v30 = [(_BRCOperation *)self callbackQueue];
  [(BRFetchRecordsOperation *)v29 setCallbackQueue:v30];

  [(BRFetchRecordsOperation *)v29 setRecordIDsToVersionETags:v8];
  v31 = +[BRCUserDefaults defaultsForMangledID:0];
  int v32 = [v31 requestCKCacheAssetClone];

  if (v32) {
    [(BRFetchRecordsOperation *)v29 setShouldCloneFileInAssetCache:1];
  }
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke_2;
  v40[3] = &unk_265084358;
  v40[4] = self;
  [(BRFetchRecordsOperation *)v29 setPerRecordProgressBlock:v40];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke_102;
  v39[3] = &unk_265083DF0;
  v39[4] = self;
  [(BRFetchRecordsOperation *)v29 setPerRecordCompletionBlock:v39];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke_106;
  v38[3] = &unk_265084380;
  v38[4] = self;
  v38[5] = buf;
  [(BRFetchRecordsOperation *)v29 setFetchRecordsCompletionBlock:v38];
  _Block_object_dispose(buf, 8);

  return v29;
}

uint64_t __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [*(id *)(a1 + 32) hash];
  return kdebug_trace();
}

void __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a3 < 0.0)
  {
    int v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      uint64_t v10 = v8;
      __int16 v11 = 2048;
      double v12 = a3;
      __int16 v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Download: Received negative progress from CK. progress [%f]%@", (uint8_t *)&v9, 0x20u);
    }
  }
  [*(id *)(a1 + 32) setProgress:v5 forRecordID:a3];
}

void __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke_102(uint64_t a1, void *a2, void *a3, void *a4)
{
  unint64_t v7 = a2;
  id v8 = a3;
  uint64_t v9 = a4;
  if (!(v7 | v9))
  {
    uint64_t v10 = brc_bread_crumbs();
    __int16 v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke_102_cold_1((uint64_t)v10, v11);
    }

    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: no record and no error");
  }
  double v12 = (void *)MEMORY[0x2455D97F0]();
  [*(id *)(a1 + 32) finishedTransferForRecord:v7 recordID:v8 error:v9];
}

void __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke_106(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138413058;
    uint64_t v15 = v13;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    v21 = v7;
    _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Finished records: %@, Error: %@%@", (uint8_t *)&v14, 0x2Au);
  }

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  double v12 = [*(id *)(a1 + 32) pendingGroup];

  dispatch_group_leave(v12);
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(_BRCOperation *)self operationID];
  id v6 = [v5 UUIDString];
  unint64_t v7 = [v3 stringWithFormat:@"%@(%@)", v4, v6];

  return (NSString *)v7;
}

- (unint64_t)itemsCount
{
  return self->_itemsCount;
}

- (BRCTransferBatchOperation)initWithName:(id)a3 syncContext:(id)a4 sessionContext:(id)a5 group:(id)a6
{
  v17.receiver = self;
  v17.super_class = (Class)BRCTransferBatchOperation;
  id v6 = [(_BRCOperation *)&v17 initWithName:a3 syncContext:a4 sessionContext:a5 group:a6];
  if (v6)
  {
    unint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    entriesByRecordID = v6->_entriesByRecordID;
    v6->_entriesByRecordID = v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    entriesByTransferID = v6->_entriesByTransferID;
    v6->_entriesByTransferID = v9;

    dispatch_group_t v11 = dispatch_group_create();
    pendingGroup = v6->_pendingGroup;
    v6->_pendingGroup = (OS_dispatch_group *)v11;

    uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("transfer-queue", v13);

    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v14;
  }
  return v6;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "BRCTransferBatchOperation/? (subclass activity missing)", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)mainWithTransfers:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_fault_impl(&dword_23FA42000, v4, OS_LOG_TYPE_FAULT, "[CRIT] API MISUSE: should be subclassed%@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)main
{
  queue = self->_queue;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __33__BRCTransferBatchOperation_main__block_invoke;
  v3[3] = &unk_26507ED70;
  v3[4] = self;
  dispatch_async_with_logs_11(queue, v3);
}

void __33__BRCTransferBatchOperation_main__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) finishIfCancelled] & 1) == 0)
  {
    os_activity_t v2 = *(id **)(a1 + 32);
    id v3 = [v2[65] objectEnumerator];
    [v2 mainWithTransfers:v3];
  }
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (id)subclassableDescriptionWithContext:(id)a3
{
  id v4 = a3;
  double v5 = (double)[(BRCTransferBatchOperation *)self doneSize] * 100.0;
  double v6 = v5 / (double)[(BRCTransferBatchOperation *)self totalSize];
  uint64_t v7 = NSString;
  unint64_t v8 = [(BRCTransferBatchOperation *)self itemsCount];
  uint64_t v9 = +[BRCDumpContext stringFromByteCount:self->_totalSize context:v4];

  uint64_t v10 = [v7 stringWithFormat:@"records-left:%ld progress:%.1f%% size:%@", v8, *(void *)&v6, v9];

  return v10;
}

- (void)_addTransfer:(id)a3
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_totalSize += [v13 totalSize];
  entriesByRecordID = self->_entriesByRecordID;
  double v5 = [v13 recordID];
  [(NSMutableDictionary *)entriesByRecordID setObject:v13 forKeyedSubscript:v5];

  entriesByTransferID = self->_entriesByTransferID;
  uint64_t v7 = [v13 transferID];
  [(NSMutableDictionary *)entriesByTransferID setObject:v13 forKeyedSubscript:v7];

  ++self->_itemsCount;
  unint64_t v8 = [v13 secondaryRecordID];

  if (v8)
  {
    entriesBySecondaryRecordID = self->_entriesBySecondaryRecordID;
    if (!entriesBySecondaryRecordID)
    {
      uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      dispatch_group_t v11 = self->_entriesBySecondaryRecordID;
      self->_entriesBySecondaryRecordID = v10;

      entriesBySecondaryRecordID = self->_entriesBySecondaryRecordID;
    }
    double v12 = [v13 secondaryRecordID];
    [(NSMutableDictionary *)entriesBySecondaryRecordID setObject:v13 forKeyedSubscript:v12];
  }
}

- (void)addTransfer:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__BRCTransferBatchOperation_addTransfer___block_invoke;
  v7[3] = &unk_26507ED98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __41__BRCTransferBatchOperation_addTransfer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addTransfer:*(void *)(a1 + 40)];
}

- (void)_cancelTransferID:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = (BRCTransferBatchOperation *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v5 = [(NSMutableDictionary *)self->_entriesByTransferID objectForKeyedSubscript:v4];
  if (v5)
  {
    brc_bread_crumbs();
    id v6 = (BRCTransferBatchOperation *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v13 = self;
      __int16 v14 = 2112;
      uint64_t v15 = v4;
      __int16 v16 = 2112;
      objc_super v17 = v6;
      _os_log_debug_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - cancelling %@%@", buf, 0x20u);
    }

    id v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFD498] code:20 userInfo:0];
    [(BRCTransferBatchOperation *)self _finishedTransfer:v5 error:v8];
    if (![(NSMutableDictionary *)self->_entriesByRecordID count])
    {
      memset(v11, 0, sizeof(v11));
      __brc_create_section(0, (uint64_t)"-[BRCTransferBatchOperation _cancelTransferID:]", 128, v11);
      uint64_t v9 = brc_bread_crumbs();
      uint64_t v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218754;
        id v13 = (BRCTransferBatchOperation *)v11[0];
        __int16 v14 = 2112;
        uint64_t v15 = self;
        __int16 v16 = 2112;
        objc_super v17 = self;
        __int16 v18 = 2112;
        id v19 = v9;
        _os_log_debug_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@ - operation is now empty, cancelling %@%@", buf, 0x2Au);
      }

      [(_BRCOperation *)self cancel];
      __brc_leave_section(v11);
    }
  }
}

- (void)cancelTransferID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__BRCTransferBatchOperation_cancelTransferID___block_invoke;
  v7[3] = &unk_26507ED98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_with_logs_11(queue, v7);
}

uint64_t __46__BRCTransferBatchOperation_cancelTransferID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelTransferID:*(void *)(a1 + 40)];
}

- (void)addAliasItem:(id)a3 toTransferWithID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__BRCTransferBatchOperation_addAliasItem_toTransferWithID___block_invoke;
  uint64_t v11[3] = &unk_26507EDC0;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async_with_logs_11(queue, v11);
}

void __59__BRCTransferBatchOperation_addAliasItem_toTransferWithID___block_invoke(void *a1)
{
  id v3 = [*(id *)(a1[4] + 520) objectForKeyedSubscript:a1[5]];
  os_activity_t v2 = [v3 progress];
  [v2 addAliasItem:a1[6]];
}

- (double)progressForTransferID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  queue = self->_queue;
  uint64_t v15 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__BRCTransferBatchOperation_progressForTransferID___block_invoke;
  block[3] = &unk_265081E88;
  block[4] = self;
  id v10 = v4;
  dispatch_group_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(queue, block);
  double v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __51__BRCTransferBatchOperation_progressForTransferID___block_invoke(void *a1)
{
  os_activity_t v2 = [*(id *)(a1[4] + 520) objectForKeyedSubscript:a1[5]];
  if (v2)
  {
    id v6 = v2;
    double v3 = (double)(unint64_t)[v2 doneSize];
    double v4 = (double)(unint64_t)[v6 totalSize];
    os_activity_t v2 = v6;
    double v5 = v3 / v4;
  }
  else
  {
    double v5 = -1.0;
  }
  *(double *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (void)_setProgress:(double)a3 forTransfer:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unint64_t v7 = [v6 totalSize] * (unint64_t)(a3 * 1000.0) / 0x3E8;
  unint64_t v8 = [v6 doneSize];
  unint64_t v9 = v7 - v8;
  if (v7 > v8)
  {
    unint64_t v10 = v8;
    [v6 setDoneSize:v7];
    [(BRCTransferBatchOperation *)self setDoneSize:v9 + [(BRCTransferBatchOperation *)self doneSize]];
    dispatch_group_t v11 = [v6 progress];
    uint64_t v12 = (uint64_t)((double)[v11 totalUnitCount] * a3);

    id v13 = [v6 progress];
    uint64_t v14 = [v13 completedUnitCount];

    if (v14 < v12)
    {
      uint64_t v15 = [v6 progress];
      [v15 setCompletedUnitCount:v12];
    }
    if ((a3 < 0.0 || os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
      && round((double)v7 / (double)(unint64_t)[v6 totalSize] * 1000.0) != round((double)v10/ (double)(unint64_t)objc_msgSend(v6, "totalSize")* 1000.0))
    {
      __int16 v16 = brc_bread_crumbs();
      objc_super v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        int v18 = 138413058;
        id v19 = self;
        __int16 v20 = 2112;
        id v21 = v6;
        __int16 v22 = 2048;
        double v23 = a3 * 100.0;
        __int16 v24 = 2112;
        v25 = v16;
        _os_log_debug_impl(&dword_23FA42000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - %@ progress %.1f%%%@", (uint8_t *)&v18, 0x2Au);
      }
    }
  }
}

- (void)setProgress:(double)a3 forRecordID:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(_BRCOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v7);

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__BRCTransferBatchOperation_setProgress_forRecordID___block_invoke;
  block[3] = &unk_265080808;
  block[4] = self;
  id v11 = v6;
  double v12 = a3;
  id v9 = v6;
  dispatch_sync(queue, block);
  [(BRCTransferBatchOperation *)self sendBatchProgressedCallback];
}

void __53__BRCTransferBatchOperation_setProgress_forRecordID___block_invoke(uint64_t a1)
{
  os_activity_t v2 = [*(id *)(*(void *)(a1 + 32) + 504) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    double v3 = v2;
    [*(id *)(a1 + 32) _setProgress:v2 forTransfer:*(double *)(a1 + 48)];
    os_activity_t v2 = v3;
  }
}

- (void)_finishedTransfer:(id)a3 error:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  unint64_t v7 = (__CFString *)a4;
  if (!v7) {
    [(BRCTransferBatchOperation *)self _setProgress:v6 forTransfer:1.0];
  }
  entriesByRecordID = self->_entriesByRecordID;
  id v9 = [v6 recordID];
  [(NSMutableDictionary *)entriesByRecordID removeObjectForKey:v9];

  entriesByTransferID = self->_entriesByTransferID;
  id v11 = [v6 transferID];
  [(NSMutableDictionary *)entriesByTransferID removeObjectForKey:v11];

  entriesBySecondaryRecordID = self->_entriesBySecondaryRecordID;
  id v13 = [v6 secondaryRecordID];
  [(NSMutableDictionary *)entriesBySecondaryRecordID removeObjectForKey:v13];

  uint64_t v14 = brc_bread_crumbs();
  uint64_t v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    __int16 v16 = @"success";
    int v17 = 138413058;
    if (v7) {
      __int16 v16 = v7;
    }
    int v18 = self;
    __int16 v19 = 2112;
    id v20 = v6;
    __int16 v21 = 2112;
    __int16 v22 = v16;
    __int16 v23 = 2112;
    __int16 v24 = v14;
    _os_log_debug_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - done with %@: %@%@", (uint8_t *)&v17, 0x2Au);
  }
}

- (void)sendBatchProgressedCallback
{
  double v3 = [(_BRCOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v3);

  id didProgressBlock = self->_didProgressBlock;
  if (didProgressBlock)
  {
    double v5 = (void (*)(void))*((void *)didProgressBlock + 2);
    v5();
  }
}

- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4
{
  double v4 = brc_bread_crumbs();
  double v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    -[BRCTransferBatchOperation sendTransferCompletionCallBack:error:]((uint64_t)v4, v5);
  }
}

- (id)_finishedTransferForRecord:(id)a3 recordID:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = [(NSMutableDictionary *)self->_entriesByRecordID objectForKeyedSubscript:v9];
  if (v11)
  {
    id v12 = (id)v11;
    [(NSMutableDictionary *)self->_entriesByRecordID removeObjectForKey:v9];
    [v12 setRecord:v8];
    id v13 = [v12 secondaryRecordID];
    if (!v13)
    {
      BOOL v18 = 1;
      goto LABEL_8;
    }
    entriesBySecondaryRecordID = self->_entriesBySecondaryRecordID;
    uint64_t v15 = [v12 secondaryRecordID];
    __int16 v16 = [(NSMutableDictionary *)entriesBySecondaryRecordID objectForKeyedSubscript:v15];
  }
  else
  {
    id v12 = [(NSMutableDictionary *)self->_entriesBySecondaryRecordID objectForKeyedSubscript:v9];
    if (!v12)
    {
LABEL_10:
      __int16 v19 = 0;
      goto LABEL_12;
    }
    [(NSMutableDictionary *)self->_entriesBySecondaryRecordID removeObjectForKey:v9];
    [v12 setSecondaryRecord:v8];
    entriesByRecordID = self->_entriesByRecordID;
    id v13 = [v12 recordID];
    uint64_t v15 = [(NSMutableDictionary *)entriesByRecordID objectForKeyedSubscript:v13];
    __int16 v16 = v15;
  }
  BOOL v18 = v16 == 0;

LABEL_8:
  if (!v10 && !v18) {
    goto LABEL_10;
  }
  [(BRCTransferBatchOperation *)self _finishedTransfer:v12 error:v10];
  id v12 = v12;
  __int16 v19 = v12;
LABEL_12:

  return v19;
}

- (void)finishedTransferForRecord:(id)a3 recordID:(id)a4 error:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (uint64_t (*)(uint64_t, uint64_t))a5;
  uint64_t v11 = [(_BRCOperation *)self callbackQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = brc_bread_crumbs();
  id v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v27 = v10;
    LOWORD(v28) = 2112;
    *(void *)((char *)&v28 + 2) = v12;
    _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - Finished transfer for recordID: %@ with error: %@%@", buf, 0x2Au);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v27 = __Block_byref_object_copy__41;
  *(void *)&long long v28 = __Block_byref_object_dispose__41;
  *((void *)&v28 + 1) = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__BRCTransferBatchOperation_finishedTransferForRecord_recordID_error___block_invoke;
  block[3] = &unk_265081A80;
  uint64_t v25 = buf;
  block[4] = self;
  id v15 = v8;
  id v22 = v15;
  id v16 = v9;
  id v23 = v16;
  int v17 = v10;
  __int16 v24 = v17;
  dispatch_sync(queue, block);
  uint64_t v18 = *(void *)(*(void *)&buf[8] + 40);
  if (v18)
  {
    [(BRCTransferBatchOperation *)self sendTransferCompletionCallBack:v18 error:v17];
    [(BRCTransferBatchOperation *)self sendBatchProgressedCallback];
    __int16 v19 = *(void **)(*(void *)&buf[8] + 40);
  }
  else
  {
    __int16 v19 = 0;
  }
  if ([v19 progressPublished])
  {
    id v20 = [*(id *)(*(void *)&buf[8] + 40) progress];
    objc_msgSend(v20, "brc_unpublish");

    [*(id *)(*(void *)&buf[8] + 40) setProgressPublished:0];
  }

  _Block_object_dispose(buf, 8);
}

void __70__BRCTransferBatchOperation_finishedTransferForRecord_recordID_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _finishedTransferForRecord:*(void *)(a1 + 40) recordID:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)actionPrettyName
{
  return @"transferring";
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v6 = a4;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__41;
  uint64_t v52 = __Block_byref_object_dispose__41;
  id v53 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__BRCTransferBatchOperation_finishWithResult_error___block_invoke;
  block[3] = &unk_265080510;
  v47 = &v48;
  block[4] = self;
  id v29 = v6;
  id v46 = v29;
  dispatch_sync(queue, block);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v8 = [(id)v49[5] objectEnumerator];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v60 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v42;
    uint64_t v27 = *MEMORY[0x263F32430];
    id obj = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
        id v13 = (void *)MEMORY[0x2455D97F0]();
        uint64_t v14 = [v12 recordID];
        id v15 = objc_msgSend(v29, "brc_cloudKitErrorForRecordID:", v14);

        if (!v15)
        {
          brc_bread_crumbs();
          id v16 = (BRCTransferBatchOperation *)objc_claimAutoreleasedReturnValue();
          int v17 = brc_default_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            v55 = v12;
            __int16 v56 = 2112;
            v57 = v16;
            _os_log_fault_impl(&dword_23FA42000, v17, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Missing transfer error for record %@%@", buf, 0x16u);
          }

          id v15 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", v27, 15, @"unreachable: Missing transfer error for record %@", v12);
        }
        uint64_t v18 = self->_queue;
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __52__BRCTransferBatchOperation_finishWithResult_error___block_invoke_24;
        v39[3] = &unk_26507EDC0;
        v39[4] = self;
        void v39[5] = v12;
        id v19 = v15;
        id v40 = v19;
        dispatch_sync(v18, v39);
        [(BRCTransferBatchOperation *)self sendTransferCompletionCallBack:v12 error:v19];

        ++v11;
      }
      while (v9 != v11);
      id v8 = obj;
      uint64_t v9 = [obj countByEnumeratingWithState:&v41 objects:v60 count:16];
    }
    while (v9);
  }

  [(BRCTransferBatchOperation *)self sendBatchProgressedCallback];
  long long v35 = 0uLL;
  uint64_t v36 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCTransferBatchOperation finishWithResult:error:]", 322, &v35);
  id v20 = brc_bread_crumbs();
  __int16 v21 = brc_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v55 = (void *)v35;
    __int16 v56 = 2112;
    v57 = self;
    __int16 v58 = 2112;
    v59 = v20;
    _os_log_debug_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx %@ - waiting for callback...%@", buf, 0x20u);
  }

  long long v37 = v35;
  uint64_t v38 = v36;
  pendingGroup = self->_pendingGroup;
  id v23 = [(_BRCOperation *)self callbackQueue];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __52__BRCTransferBatchOperation_finishWithResult_error___block_invoke_25;
  v30[3] = &unk_265085190;
  long long v33 = v37;
  uint64_t v34 = v38;
  v30[4] = self;
  id v31 = v26;
  id v32 = v29;
  id v24 = v29;
  id v25 = v26;
  dispatch_group_notify(pendingGroup, v23, v30);

  _Block_object_dispose(&v48, 8);
}

void __52__BRCTransferBatchOperation_finishWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 504) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  double v5 = *(void **)(a1 + 40);
  if (v5 && (objc_msgSend(v5, "brc_isCloudKitCancellationError") & 1) == 0)
  {
    id v6 = brc_bread_crumbs();
    unint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = *(void **)(a1 + 32);
      uint64_t v30 = [v17 actionPrettyName];
      uint64_t v18 = [*(id *)(a1 + 32) itemsCount];
      uint64_t v11 = [*(id *)(a1 + 32) transferredObjectsPrettyName];
      id v12 = +[BRCDumpContext stringFromByteCount:*(void *)(*(void *)(a1 + 32) + 528) showActualByteCount:0 suffix:0 context:0];
      id v13 = [*(id *)(a1 + 32) syncContext];
      uint64_t v14 = [v13 contextIdentifier];
      id v19 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138414082;
      id v32 = v17;
      __int16 v33 = 2112;
      id v15 = (void *)v30;
      uint64_t v34 = v30;
      __int16 v35 = 2048;
      uint64_t v36 = v18;
      __int16 v37 = 2112;
      uint64_t v38 = (uint64_t)v11;
      __int16 v39 = 2112;
      id v40 = v12;
      __int16 v41 = 2112;
      long long v42 = v14;
      __int16 v43 = 2112;
      long long v44 = v19;
      __int16 v45 = 2112;
      id v46 = v6;
      id v16 = "[WARNING] %@ - failed %@ %ld %@ (%@) in %@: %@%@";
LABEL_10:
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEFAULT, v16, buf, 0x52u);
    }
  }
  else
  {
    id v6 = brc_bread_crumbs();
    unint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(void **)(a1 + 32);
      uint64_t v28 = [v8 actionPrettyName];
      id v29 = v6;
      if (objc_msgSend(*(id *)(a1 + 40), "brc_isCloudKitCancellationError")) {
        uint64_t v9 = @" (cancelled)";
      }
      else {
        uint64_t v9 = &stru_26F3822F0;
      }
      uint64_t v10 = [*(id *)(a1 + 32) itemsCount];
      uint64_t v11 = [*(id *)(a1 + 32) transferredObjectsPrettyName];
      id v12 = +[BRCDumpContext stringFromByteCount:*(void *)(*(void *)(a1 + 32) + 528) showActualByteCount:0 suffix:0 context:0];
      id v13 = [*(id *)(a1 + 32) syncContext];
      uint64_t v14 = [v13 contextIdentifier];
      *(_DWORD *)buf = 138414082;
      id v32 = v8;
      __int16 v33 = 2112;
      id v15 = (void *)v28;
      uint64_t v34 = v28;
      __int16 v35 = 2112;
      uint64_t v36 = (uint64_t)v9;
      id v6 = v29;
      __int16 v37 = 2048;
      uint64_t v38 = v10;
      __int16 v39 = 2112;
      id v40 = v11;
      __int16 v41 = 2112;
      long long v42 = v12;
      __int16 v43 = 2112;
      long long v44 = v14;
      __int16 v45 = 2112;
      id v46 = v29;
      id v16 = "[NOTICE] %@ - finished %@%@ %ld %@ (%@) in %@%@";
      goto LABEL_10;
    }
  }

  uint64_t v20 = *(void *)(a1 + 32);
  __int16 v21 = *(void **)(v20 + 504);
  *(void *)(v20 + 504) = 0;

  uint64_t v22 = *(void *)(a1 + 32);
  id v23 = *(void **)(v22 + 520);
  *(void *)(v22 + 520) = 0;

  uint64_t v24 = *(void *)(a1 + 32);
  id v25 = *(void **)(v24 + 512);
  *(void *)(v24 + 512) = 0;

  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count] && !*(void *)(a1 + 40))
  {
    id v26 = brc_bread_crumbs();
    uint64_t v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      __52__BRCTransferBatchOperation_finishWithResult_error___block_invoke_cold_1((uint64_t)v26, v27);
    }
  }
}

uint64_t __52__BRCTransferBatchOperation_finishWithResult_error___block_invoke_24(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedTransfer:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

void __52__BRCTransferBatchOperation_finishWithResult_error___block_invoke_25(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v8 = *(_OWORD *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    id v15 = v2;
    _os_log_debug_impl(&dword_23FA42000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@ - callbacks finished%@", buf, 0x20u);
  }

  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)BRCTransferBatchOperation;
  objc_msgSendSuper2(&v7, sel_finishWithResult_error_, v4, v5);
  __brc_leave_section((uint64_t *)&v8);
}

- (id)transferredObjectsPrettyName
{
  return @"items";
}

- (unint64_t)doneSize
{
  return self->_doneSize;
}

- (void)setDoneSize:(unint64_t)a3
{
  self->_doneSize = a3;
}

- (unint64_t)totalSize
{
  return self->_totalSize;
}

- (void)setTotalSize:(unint64_t)a3
{
  self->_totalSize = a3;
}

- (id)didProgressBlock
{
  return objc_getProperty(self, a2, 560, 1);
}

- (void)setDidProgressBlock:(id)a3
{
}

- (OS_dispatch_group)pendingGroup
{
  return self->_pendingGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingGroup, 0);
  objc_storeStrong(&self->_didProgressBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_entriesByTransferID, 0);
  objc_storeStrong((id *)&self->_entriesBySecondaryRecordID, 0);
  objc_storeStrong((id *)&self->_entriesByRecordID, 0);
}

void __77__BRCTransferBatchOperation_Downloads__fetchOperationForTransfers_traceCode___block_invoke_102_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: no record and no error%@", (uint8_t *)&v2, 0xCu);
}

- (void)sendTransferCompletionCallBack:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] API MISUSE: implement in subclass%@", (uint8_t *)&v2, 0xCu);
}

void __52__BRCTransferBatchOperation_finishWithResult_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: entries.count == 0 || error%@", (uint8_t *)&v2, 0xCu);
}

@end