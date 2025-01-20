@interface BRCSharingDestroyShareOperation
- (BRCSharingDestroyShareOperation)initWithShare:(id)a3 zone:(id)a4 sessionContext:(id)a5;
- (id)createActivity;
- (id)shareID;
- (void)main;
@end

@implementation BRCSharingDestroyShareOperation

- (id)shareID
{
  return (id)[(CKShare *)self->super._share recordID];
}

- (BRCSharingDestroyShareOperation)initWithShare:(id)a3 zone:(id)a4 sessionContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 recordID];
  v12 = [v11 recordName];
  v13 = [@"sharing/destroy-share" stringByAppendingPathComponent:v12];

  v17.receiver = self;
  v17.super_class = (Class)BRCSharingDestroyShareOperation;
  v14 = [(BRCSharingModifyShareOperation *)&v17 initWithName:v13 zone:v9 share:v10 sessionContext:v8];

  v15 = objc_msgSend(MEMORY[0x263EFD780], "br_sharingMisc");
  [(_BRCOperation *)v14 setGroup:v15];

  return v14;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sharing/destroy-share", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)main
{
  v3 = [(BRCServerZone *)self->super._serverZone session];
  v4 = [v3 clientDB];
  v5 = [v4 serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__BRCSharingDestroyShareOperation_main__block_invoke;
  block[3] = &unk_26507ED70;
  block[4] = self;
  dispatch_async(v5, block);
}

void __39__BRCSharingDestroyShareOperation_main__block_invoke(uint64_t a1)
{
  v27[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 32;
  v3 = [*(id *)(*(void *)(a1 + 32) + 528) recordID];
  v4 = objc_msgSend(v3, "brc_shareItemID");

  v5 = [*(id *)(*(void *)v2 + 520) clientZone];
  v6 = [v5 itemByItemID:v4];

  if ([*(id *)(*(void *)v2 + 520) isPrivateZone])
  {
    if ([v6 isDocument])
    {
      v7 = [v6 asDocument];
      id v8 = [v7 baseRecord];

      id v9 = [v6 asDocument];
      id v10 = [v9 currentVersion];
      v11 = [v10 ckInfo];
      [v8 serializeSystemFields:v11];
    }
    else
    {
      v13 = [v6 asDirectory];
      id v8 = [v13 folderRootStructureRecord];

      id v9 = [v6 st];
      id v10 = [v9 ckInfo];
      [v8 serializeSystemFields:v10];
    }

    id v12 = objc_alloc(MEMORY[0x263EFD748]);
    if (v8)
    {
      v27[0] = v8;
      v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
      char v15 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x263EFD748]);
    id v8 = 0;
  }
  v14 = 0;
  char v15 = 1;
LABEL_9:
  v16 = [*(id *)(a1 + 32) shareID];
  v26 = v16;
  objc_super v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  v18 = (void *)[v12 initWithRecordsToSave:v14 recordIDsToDelete:v17];

  if ((v15 & 1) == 0) {
  objc_initWeak(&location, v18);
  }
  [v18 setAtomic:1];
  [v18 setSavePolicy:0];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __39__BRCSharingDestroyShareOperation_main__block_invoke_2;
  v22[3] = &unk_265083D50;
  objc_copyWeak(&v24, &location);
  v22[4] = *(void *)(a1 + 32);
  id v19 = v6;
  id v23 = v19;
  [v18 setModifyRecordsCompletionBlock:v22];
  v20 = [v18 callbackQueue];
  v21 = [*(id *)(a1 + 32) callbackQueue];
  dispatch_set_target_queue(v20, v21);

  [*(id *)(a1 + 32) addSubOperation:v18];
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __39__BRCSharingDestroyShareOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v11 = [v9 count];

  if (!v8 && !v11)
  {
    id v12 = brc_bread_crumbs();
    v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __39__BRCSharingDestroyShareOperation_main__block_invoke_2_cold_1();
    }

    objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: got an unexpected number of shares deleted");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v8)
  {
    v14 = brc_bread_crumbs();
    char v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      v28 = [*(id *)(a1 + 32) shareID];
      *(_DWORD *)buf = 138413058;
      v34 = v28;
      __int16 v35 = 2112;
      id v36 = v8;
      __int16 v37 = 2112;
      id v38 = WeakRetained;
      __int16 v39 = 2112;
      v40 = v14;
      _os_log_error_impl(&dword_23FA42000, v15, (os_log_type_t)0x90u, "[ERROR] failed to destroy share %@: %@ in %@%@", buf, 0x2Au);
    }
    v16 = *(void **)(a1 + 32);
    objc_super v17 = [v16 shareID];
    v18 = objc_msgSend(v8, "brc_cloudKitErrorForRecordID:", v17);
    [v16 completedWithResult:0 error:v18];
  }
  else
  {
    id v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v29 = [*(id *)(a1 + 32) shareID];
      *(_DWORD *)buf = 138412802;
      v34 = v29;
      __int16 v35 = 2112;
      id v36 = WeakRetained;
      __int16 v37 = 2112;
      id v38 = v19;
      _os_log_debug_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] destroyed share %@ in %@%@", buf, 0x20u);
    }
    uint64_t v21 = *(void *)(a1 + 32);
    v22 = *(void **)(v21 + 528);
    *(void *)(v21 + 528) = 0;

    [*(id *)(a1 + 32) _updateDBAndSyncDownIfNeededWithShare:0 recordsToLearnCKInfo:v7];
    id v23 = *(void **)(a1 + 40);
    if (v23)
    {
      id v24 = [v23 fileObjectID];
      v25 = [v24 asString];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __39__BRCSharingDestroyShareOperation_main__block_invoke_166;
      v30[3] = &unk_26507F7B0;
      uint64_t v26 = *(void *)(a1 + 32);
      id v31 = v24;
      uint64_t v32 = v26;
      id v27 = v24;
      +[BRCImportUtil forceIngestionForItemID:v25 completionHandler:v30];
    }
    else
    {
      [*(id *)(a1 + 32) completedWithResult:MEMORY[0x263EFFA88] error:0];
    }
  }
}

void __39__BRCSharingDestroyShareOperation_main__block_invoke_166(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Done forceIngestionForItemID %@ with error - %@%@", (uint8_t *)&v7, 0x20u);
  }

  [*(id *)(a1 + 40) completedWithResult:MEMORY[0x263EFFA88] error:0];
}

void __39__BRCSharingDestroyShareOperation_main__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: got an unexpected number of shares deleted%@", v2, v3, v4, v5, v6);
}

@end