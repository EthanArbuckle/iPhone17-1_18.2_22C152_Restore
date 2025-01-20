@interface BRCUploadBatchOperation
- (BRCUploadBatchOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4 clientZone:(id)a5;
- (id)actionPrettyName;
- (id)createActivity;
- (id)perUploadCompletionBlock;
- (void)_publishUploadProgress:(id)a3;
- (void)_uploadRecordsByID:(id)a3;
- (void)addItem:(id)a3 stageID:(id)a4 record:(id)a5 transferSize:(unint64_t)a6;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)mainWithTransfers:(id)a3;
- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4;
- (void)setPerUploadCompletionBlock:(id)a3;
@end

@implementation BRCUploadBatchOperation

- (BRCUploadBatchOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4 clientZone:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 contextIdentifier];
  v12 = [@"upload" stringByAppendingPathComponent:v11];

  v13 = [v8 session];
  v14 = [v13 fsUploader];
  v15 = [v14 hasWorkGroup];

  v23.receiver = self;
  v23.super_class = (Class)BRCUploadBatchOperation;
  v16 = [(BRCTransferBatchOperation *)&v23 initWithName:v12 syncContext:v8 sessionContext:v10 group:v15];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_clientZone, a5);
    v17 = [(_BRCOperation *)v16 callbackQueue];
    v18 = [v8 session];
    v19 = [v18 fsUploader];
    v20 = [v19 uploadsDeadlineScheduler];
    v21 = [v20 workloop];
    dispatch_set_target_queue(v17, v21);
  }
  return v16;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "upload", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)addItem:(id)a3 stageID:(id)a4 record:(id)a5 transferSize:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[BRCUpload alloc] initWithDocument:v12 stageID:v11 transferSize:a6];

  [(BRCUpload *)v13 setRecord:v10];
  [(BRCTransferBatchOperation *)self addTransfer:v13];
}

- (void)sendTransferCompletionCallBack:(id)a3 error:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BRCUploadBatchOperation *)self perUploadCompletionBlock];
  id v9 = [(BRCSyncContext *)self->super.super._syncContext session];
  id v10 = v9;
  if (v8)
  {
    id v11 = [v9 clientDB];
    id v12 = [v11 serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__BRCUploadBatchOperation_sendTransferCompletionCallBack_error___block_invoke;
    block[3] = &unk_265081C58;
    id v18 = v8;
    id v16 = v6;
    id v17 = v7;
    dispatch_sync(v12, block);

    v13 = v18;
  }
  else
  {
    v13 = brc_bread_crumbs();
    v14 = brc_default_log();
    if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      __int16 v23 = 2112;
      v24 = v13;
      _os_log_error_impl(&dword_23FA42000, v14, (os_log_type_t)0x90u, "[ERROR] No per upload completion block for %@, error %@%@", buf, 0x20u);
    }
  }
}

uint64_t __64__BRCUploadBatchOperation_sendTransferCompletionCallBack_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_publishUploadProgress:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 progress];
  id v6 = [v5 userInfo];
  id v7 = [v6 valueForKey:@"ICDProgressObjectID"];

  id v8 = objc_msgSend(MEMORY[0x263F054B8], "br_fpItemIDFromItemIdentifier:", v7);
  if (v8)
  {
    objc_initWeak((id *)location, v5);
    objc_initWeak(&from, v4);
    id v9 = [MEMORY[0x263F054C0] defaultManager];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__BRCUploadBatchOperation__publishUploadProgress___block_invoke;
    v12[3] = &unk_265081C80;
    id v13 = v7;
    objc_copyWeak(&v15, (id *)location);
    id v14 = v4;
    objc_copyWeak(&v16, &from);
    [v9 fetchURLForItemID:v8 completionHandler:v12];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&from);
    objc_destroyWeak((id *)location);
  }
  else
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 138412802;
      *(void *)&location[4] = self;
      __int16 v19 = 2112;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - Can't find a file provider item ID for %@%@", location, 0x20u);
    }
  }
}

void __50__BRCUploadBatchOperation__publishUploadProgress___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    WeakRetained = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v15 = 138412802;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = WeakRetained;
      _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Got an error while fetching the URL of %@ - %@%@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    if (!v5)
    {
      id v13 = brc_bread_crumbs();
      id v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __50__BRCUploadBatchOperation__publishUploadProgress___block_invoke_cold_1();
      }
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained setUserInfoObject:v5 forKey:*MEMORY[0x263F08498]];
    if (([WeakRetained isFinished] & 1) == 0)
    {
      id v10 = brc_bread_crumbs();
      id v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        int v15 = 138412802;
        uint64_t v16 = v12;
        __int16 v17 = 2112;
        id v18 = v5;
        __int16 v19 = 2112;
        id v20 = v10;
        _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Publishing upload progress for %@ at %@%@", (uint8_t *)&v15, 0x20u);
      }

      objc_msgSend(WeakRetained, "brc_publish");
    }
    id v8 = objc_loadWeakRetained((id *)(a1 + 56));
    -[NSObject setProgressPublished:](v8, "setProgressPublished:", [WeakRetained isPublished]);
  }
}

- (void)mainWithTransfers:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[BRCTransferBatchOperation itemsCount](self, "itemsCount"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v11 = [v10 record];
        uint64_t v12 = [v10 record];
        id v13 = [v12 recordID];
        [v5 setObject:v11 forKeyedSubscript:v13];

        [(BRCUploadBatchOperation *)self _publishUploadProgress:v10];
        id v14 = [(BRCClientZone *)self->_clientZone session];
        int v15 = [v14 analyticsReporter];
        uint64_t v16 = [v10 itemID];
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __45__BRCUploadBatchOperation_mainWithTransfers___block_invoke;
        v24[3] = &unk_265081CA8;
        v24[4] = self;
        [v15 lookupFSEventToSyncUpEventByItemID:v16 accessor:v24];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  [(BRCUploadBatchOperation *)self hash];
  kdebug_trace();
  __int16 v17 = [(BRCClientZone *)self->_clientZone serverZone];
  if ([v17 hasFetchedServerZoneState])
  {

LABEL_12:
    [(BRCUploadBatchOperation *)self _uploadRecordsByID:v5];
    goto LABEL_13;
  }
  BOOL v18 = [(BRCClientZone *)self->_clientZone isPrivateZone];

  if (!v18) {
    goto LABEL_12;
  }
  __int16 v19 = [(BRCClientZone *)self->_clientZone asPrivateClientZone];
  id v20 = [(_BRCOperation *)self group];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __45__BRCUploadBatchOperation_mainWithTransfers___block_invoke_2;
  v22[3] = &unk_26507F7B0;
  v22[4] = self;
  id v23 = v5;
  [v19 createCloudKitZoneWithGroup:v20 completion:v22];

LABEL_13:
}

uint64_t __45__BRCUploadBatchOperation_mainWithTransfers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) associateCKOperationsToEventMetric:a2];
}

uint64_t __45__BRCUploadBatchOperation_mainWithTransfers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 completedWithResult:0 error:a2];
  }
  else {
    return [v3 _uploadRecordsByID:*(void *)(a1 + 40)];
  }
}

- (void)_uploadRecordsByID:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCSyncContext *)self->super.super._syncContext session];
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__18;
  v24[4] = __Block_byref_object_dispose__18;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__18;
  v22[4] = __Block_byref_object_dispose__18;
  id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v6 = objc_alloc(MEMORY[0x263EFD748]);
  uint64_t v7 = [v4 allValues];
  uint64_t v8 = (void *)[v6 initWithRecordsToSave:v7 recordIDsToDelete:0];

  [v8 setShouldOnlySaveAssetContent:1];
  uint64_t v9 = [(_BRCOperation *)self callbackQueue];
  [v8 setCallbackQueue:v9];

  [v8 setSavePolicy:0];
  [v8 setAtomic:0];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke;
  v21[3] = &unk_265081CD0;
  v21[4] = self;
  [v8 setPerRecordProgressBlock:v21];
  id v10 = +[BRCUserDefaults defaultsForMangledID:0];
  int v11 = [v10 requestCKCacheAssetClone];

  if (v11) {
    [v8 setShouldCloneFileInAssetCache:1];
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_110;
  v15[3] = &unk_265081CF8;
  id v12 = v5;
  id v16 = v12;
  __int16 v19 = v24;
  id v20 = v22;
  id v13 = v4;
  id v17 = v13;
  BOOL v18 = self;
  [v8 setPerRecordCompletionBlock:v15];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_112;
  v14[3] = &unk_265081D20;
  v14[4] = self;
  v14[5] = v24;
  v14[6] = v22;
  [v8 setModifyRecordsCompletionBlock:v14];
  [(_BRCOperation *)self addSubOperation:v8];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke(uint64_t a1, void *a2, double a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a3 < 0.0)
  {
    id v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134218242;
      double v11 = a3;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Upload: Received negative progress from CK. progress [%f]%@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v5 recordID];
  [v8 setProgress:v9 forRecordID:a3];
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_110(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x2455D97F0]();
  uint64_t v8 = [v5 recordID];
  uint64_t v9 = [v8 zoneID];

  int v10 = (void *)a1[4];
  double v11 = [v9 zoneName];
  __int16 v12 = [v9 ownerName];
  id v13 = [v10 serverZoneByName:v11 ownerName:v12];

  if (v6 && [v13 shouldRecreateServerZoneAfterError:v6])
  {
    uint64_t v14 = brc_bread_crumbs();
    int v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_110_cold_1(v5, (uint64_t)v14, v15);
    }

    id v16 = [v5 recordID];
    uint64_t v17 = [v16 zoneID];
    uint64_t v18 = *(void *)(a1[7] + 8);
    __int16 v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    id v20 = (void *)a1[5];
    uint64_t v21 = [v5 recordID];
    id v22 = [v20 objectForKeyedSubscript:v21];
    id v23 = *(void **)(*(void *)(a1[8] + 8) + 40);
    v24 = [v5 recordID];
    [v23 setObject:v22 forKeyedSubscript:v24];
  }
  else
  {
    id v25 = (void *)a1[6];
    long long v26 = [v5 recordID];
    [v25 finishedTransferForRecord:v5 recordID:v26 error:v6];
  }
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_112(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int v10 = v9;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    if (!v9)
    {
      id v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_112_cold_1();
      }
    }
    objc_initWeak(&location, *(id *)(a1 + 32));
    double v11 = [*(id *)(*(void *)(a1 + 32) + 576) asPrivateClientZone];
    __int16 v12 = [*(id *)(a1 + 32) group];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_113;
    v15[3] = &unk_265080D40;
    objc_copyWeak(&v16, &location);
    void v15[4] = *(void *)(a1 + 48);
    [v11 createCloudKitZoneWithGroup:v12 completion:v15];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    [*(id *)(a1 + 32) completedWithResult:0 error:v9];
  }
  [*(id *)(a1 + 32) hash];
  kdebug_trace();
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_113(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (v3)
  {
    [WeakRetained completedWithResult:0 error:v3];
  }
  else
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_113_cold_1();
    }

    [v5 _uploadRecordsByID:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  }
}

- (id)actionPrettyName
{
  return @"uploading";
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BRCUploadBatchOperation;
  [(BRCTransferBatchOperation *)&v5 finishWithResult:a3 error:a4];
  [(BRCUploadBatchOperation *)self setPerUploadCompletionBlock:0];
}

- (id)perUploadCompletionBlock
{
  return objc_getProperty(self, a2, 584, 1);
}

- (void)setPerUploadCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_perUploadCompletionBlock, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

void __50__BRCUploadBatchOperation__publishUploadProgress___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: fpURL%@", v1, 0xCu);
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_110_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_super v5 = [a1 recordID];
  OUTLINED_FUNCTION_3();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring zone not found error for %@ - we'll create at the end of the operation%@", v6, 0x16u);
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_112_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_23FA42000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: modifyError%@", v1, 0xCu);
}

void __46__BRCUploadBatchOperation__uploadRecordsByID___block_invoke_113_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_23FA42000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] zone was recreated, reuploading records%@", v1, 0xCu);
}

@end