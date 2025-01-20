@interface BRCContainerMetadataSyncUpOperation
- (BOOL)shouldPerformAnotherBatch;
- (BOOL)shouldRetryForError:(id)a3;
- (BRCContainerMetadataSyncUpOperation)initWithSession:(id)a3;
- (id)createActivity;
- (void)main;
- (void)performAfterSavingRecords:(id)a3;
@end

@implementation BRCContainerMetadataSyncUpOperation

- (BRCContainerMetadataSyncUpOperation)initWithSession:(id)a3
{
  id v4 = a3;
  v5 = [v4 syncContextProvider];
  v6 = [v5 defaultSyncContext];
  v9.receiver = self;
  v9.super_class = (Class)BRCContainerMetadataSyncUpOperation;
  v7 = [(_BRCOperation *)&v9 initWithName:@"sync-up/container-metadata" syncContext:v6 sessionContext:v4];

  return v7;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sync-up/container-metadata", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)performAfterSavingRecords:(id)a3
{
  id v4 = a3;
  v5 = [(BRCSyncContext *)self->super._syncContext session];
  v6 = +[BRCUserDefaults defaultsForMangledID:0];
  unint64_t v7 = [v6 maxRecordCountInClientZoneModifyRecordsOperation];
  v8 = [v5 containerScheduler];
  objc_super v9 = [v8 containerMetadataPersistedState];

  uint64_t v29 = [v9 allocateNextRequestID];
  v10 = [v5 _containerMetadataRecordsToSaveWithBatchSize:v7 requestID:v29];
  v11 = v10;
  if (v10)
  {
    self->_shouldPerformAnotherBatch = [v10 count] >= v7;
    v12 = brc_bread_crumbs();
    v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[BRCContainerMetadataSyncUpOperation performAfterSavingRecords:](v11);
    }

    v14 = (void *)[objc_alloc(MEMORY[0x263EFD748]) initWithRecordsToSave:v11 recordIDsToDelete:0];
    [v14 setSavePolicy:0];
    [v14 setAtomic:1];
    v15 = objc_opt_new();
    [v14 setConfiguration:v15];

    uint64_t v16 = *MEMORY[0x263F324D8];
    v17 = [v14 configuration];
    [v17 setSourceApplicationBundleIdentifier:v16];

    v18 = [MEMORY[0x263EFF8F8] dataWithBytes:&v29 length:8];
    [v14 setClientChangeTokenData:v18];

    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __65__BRCContainerMetadataSyncUpOperation_performAfterSavingRecords___block_invoke;
    v27[3] = &unk_265082360;
    id v28 = v4;
    [v14 setModifyRecordsCompletionBlock:v27];
    v19 = [v5 clientTruthWorkloop];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__BRCContainerMetadataSyncUpOperation_performAfterSavingRecords___block_invoke_13;
    block[3] = &unk_26507EDC0;
    id v24 = v5;
    id v25 = v14;
    v26 = self;
    id v20 = v14;
    dispatch_async(v19, block);
  }
  else
  {
    v21 = brc_bread_crumbs();
    v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[BRCContainerMetadataSyncUpOperation performAfterSavingRecords:]((uint64_t)v21, v22);
    }

    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __65__BRCContainerMetadataSyncUpOperation_performAfterSavingRecords___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a2;
  unint64_t v7 = a4;
  v8 = brc_bread_crumbs();
  objc_super v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = [v6 count];
    v14 = @"success";
    int v15 = 134218498;
    uint64_t v16 = v13;
    if (v7) {
      v14 = v7;
    }
    __int16 v17 = 2112;
    v18 = v14;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] completed sync up for %lu records: %@%@", (uint8_t *)&v15, 0x20u);
  }

  brc_bread_crumbs();
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v6 count];
    int v15 = 134218242;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] saved %lu containers metadata in the cloud%@", (uint8_t *)&v15, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__BRCContainerMetadataSyncUpOperation_performAfterSavingRecords___block_invoke_13(uint64_t a1)
{
  os_activity_t v2 = [*(id *)(a1 + 32) clientDB];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__BRCContainerMetadataSyncUpOperation_performAfterSavingRecords___block_invoke_2;
  v5[3] = &unk_26507ED98;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 scheduleFlushWithCheckpoint:0 whenFlushed:v5];
}

uint64_t __65__BRCContainerMetadataSyncUpOperation_performAfterSavingRecords___block_invoke_2(uint64_t a1)
{
  os_activity_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __65__BRCContainerMetadataSyncUpOperation_performAfterSavingRecords___block_invoke_2_cold_1();
  }

  return [*(id *)(a1 + 40) addSubOperation:*(void *)(a1 + 32)];
}

- (BOOL)shouldRetryForError:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend(v4, "brc_isResetError") & 1) != 0
    || !objc_msgSend(v4, "brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown"))
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)BRCContainerMetadataSyncUpOperation;
    BOOL v5 = [(_BRCOperation *)&v7 shouldRetryForError:v4];
  }

  return v5;
}

- (void)main
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] ┏%llx Sync: syncing up container metadata%@");
}

uint64_t __43__BRCContainerMetadataSyncUpOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

- (BOOL)shouldPerformAnotherBatch
{
  return self->_shouldPerformAnotherBatch;
}

- (void)performAfterSavingRecords:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23FA42000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] no records to save%@", (uint8_t *)&v2, 0xCu);
}

- (void)performAfterSavingRecords:(void *)a1 .cold.2(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v1, v2, "[DEBUG] preparing to send %lu records%@", v3, v4, v5, v6, v7);
}

void __65__BRCContainerMetadataSyncUpOperation_performAfterSavingRecords___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] adding sub-operation to save the records: %@%@");
}

@end