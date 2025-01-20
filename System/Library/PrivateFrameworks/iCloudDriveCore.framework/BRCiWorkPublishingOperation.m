@interface BRCiWorkPublishingOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCiWorkPublishingOperation)initWithDocumentItem:(id)a3 sessionContext:(id)a4 forPublish:(BOOL)a5 readonly:(BOOL)a6;
- (id)createActivity;
- (void)_updateItemAfterShareCompleted;
- (void)main;
@end

@implementation BRCiWorkPublishingOperation

- (BRCiWorkPublishingOperation)initWithDocumentItem:(id)a3 sessionContext:(id)a4 forPublish:(BOOL)a5 readonly:(BOOL)a6
{
  v29[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = [v10 serverZone];
  v13 = [v12 metadataSyncContext];
  v28.receiver = self;
  v28.super_class = (Class)BRCiWorkPublishingOperation;
  v14 = [(_BRCOperation *)&v28 initWithName:@"sharing/iWork-publishing" syncContext:v13 sessionContext:v11];

  if (v14)
  {
    uint64_t v15 = [v10 itemID];
    itemID = v14->_itemID;
    v14->_itemID = (BRCItemID *)v15;

    v17 = [v10 structureRecordID];
    v29[0] = v17;
    v18 = [v10 documentRecordID];
    v29[1] = v18;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
    recordIDs = v14->_recordIDs;
    v14->_recordIDs = (NSArray *)v19;

    v14->_forPublish = a5;
    v14->_readonly = a6;
    uint64_t v21 = [v10 serverZone];
    serverZone = v14->_serverZone;
    v14->_serverZone = (BRCServerZone *)v21;

    [(_BRCOperation *)v14 setNonDiscretionary:1];
    v23 = [v10 st];
    char v24 = [v23 iWorkShareable];

    if ((v24 & 1) == 0)
    {
      v26 = brc_bread_crumbs();
      v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        -[BRCiWorkPublishingOperation initWithDocumentItem:sessionContext:forPublish:readonly:]();
      }
    }
  }

  return v14;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sharing/iWork-publishing", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (void)_updateItemAfterShareCompleted
{
  v3 = [(BRCServerZone *)self->_serverZone clientZone];
  id v7 = [v3 itemByItemID:self->_itemID];

  if (v7)
  {
    objc_msgSend(v7, "setSharingOptions:", objc_msgSend(v7, "sharingOptions") & 0xFFFFFFFFFFFFFFFCLL | -[NSNumber unsignedCharValue](self->_sharingInfo, "unsignedCharValue"));
    [v7 saveToDB];
    [(_BRCOperation *)self completedWithResult:0 error:0];
  }
  else
  {
    v4 = (void *)MEMORY[0x263F087E8];
    v5 = [(BRCItemID *)self->_itemID itemIDString];
    v6 = objc_msgSend(v4, "brc_errorItemNotFound:", v5);
    [(_BRCOperation *)self completedWithResult:0 error:v6];
  }
}

- (void)main
{
  BOOL forPublish = self->_forPublish;
  v4 = self->_recordIDs;
  if (forPublish) {
    v5 = 0;
  }
  else {
    v5 = v4;
  }
  if (forPublish) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x263EFD758]) initWithRecordIDsToWebShare:v6 recordIDsToUnshare:v5];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __35__BRCiWorkPublishingOperation_main__block_invoke;
  v10[3] = &unk_265081D48;
  v10[4] = self;
  [v7 setWebShareRecordsCompletionBlock:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__BRCiWorkPublishingOperation_main__block_invoke_2;
  v9[3] = &unk_265085570;
  v9[4] = self;
  [v7 setRecordSharedBlock:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__BRCiWorkPublishingOperation_main__block_invoke_11;
  v8[3] = &unk_265084AF8;
  v8[4] = self;
  [v7 setRecordUnsharedBlock:v8];
  if (self->_forPublish && !self->_readonly) {
    [v7 setRecordIDsToShareReadWrite:self->_recordIDs];
  }
  [(_BRCOperation *)self addSubOperation:v7];
}

void __35__BRCiWorkPublishingOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v10 + 520) && !*(void *)(v10 + 528))
    {
      v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __35__BRCiWorkPublishingOperation_main__block_invoke_cold_1();
      }

      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: No sharing info and no error");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9) {
        goto LABEL_2;
      }
      uint64_t v10 = *(void *)(a1 + 32);
    }
    id v9 = [*(id *)(v10 + 248) session];
    id v11 = [v9 clientDB];
    v12 = [v11 serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__BRCiWorkPublishingOperation_main__block_invoke_6;
    block[3] = &unk_26507ED70;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v12, block);

    goto LABEL_6;
  }
LABEL_2:
  [*(id *)(a1 + 32) completedWithResult:0 error:v9];
LABEL_6:
}

uint64_t __35__BRCiWorkPublishingOperation_main__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateItemAfterShareCompleted];
}

void __35__BRCiWorkPublishingOperation_main__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a5;
  uint64_t v10 = v9;
  if (!a4 || v9)
  {
    uint64_t v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
    {
      int v19 = 138412802;
      id v20 = v8;
      __int16 v21 = 2112;
      v22 = v10;
      __int16 v23 = 2112;
      char v24 = v15;
      _os_log_error_impl(&dword_23FA42000, v16, (os_log_type_t)0x90u, "[ERROR] Failed sharing %@ - %@%@", (uint8_t *)&v19, 0x20u);
    }
  }
  else
  {
    id v11 = brc_bread_crumbs();
    v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __35__BRCiWorkPublishingOperation_main__block_invoke_2_cold_2();
    }

    if (!*(unsigned char *)(*(void *)(a1 + 32) + 520))
    {
      v17 = brc_bread_crumbs();
      v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        __35__BRCiWorkPublishingOperation_main__block_invoke_2_cold_1();
      }
    }
    uint64_t v13 = [NSNumber numberWithChar:BRMakeiWorkSharingOptions()];
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(v14 + 528);
    *(void *)(v14 + 528) = v13;
  }
}

void __35__BRCiWorkPublishingOperation_main__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      int v15 = 138412802;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_error_impl(&dword_23FA42000, v8, (os_log_type_t)0x90u, "[ERROR] Failed unsharing %@ - %@%@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    id v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __35__BRCiWorkPublishingOperation_main__block_invoke_11_cold_2();
    }

    if (*(unsigned char *)(*(void *)(a1 + 32) + 520))
    {
      uint64_t v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __35__BRCiWorkPublishingOperation_main__block_invoke_11_cold_1();
      }
    }
    uint64_t v11 = [NSNumber numberWithChar:BRMakeiWorkSharingOptions()];
    uint64_t v12 = *(void *)(a1 + 32);
    id v7 = *(void **)(v12 + 528);
    *(void *)(v12 + 528) = v11;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_sharingInfo, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
}

- (void)initWithDocumentItem:sessionContext:forPublish:readonly:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: item.st.iWorkShareable%@", v2, v3, v4, v5, v6);
}

void __35__BRCiWorkPublishingOperation_main__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: No sharing info and no error%@", v2, v3, v4, v5, v6);
}

void __35__BRCiWorkPublishingOperation_main__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: self->_forPublish%@", v2, v3, v4, v5, v6);
}

void __35__BRCiWorkPublishingOperation_main__block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] %@ was shared%@");
}

void __35__BRCiWorkPublishingOperation_main__block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !self->_forPublish%@", v2, v3, v4, v5, v6);
}

void __35__BRCiWorkPublishingOperation_main__block_invoke_11_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] %@ was unshared%@");
}

@end