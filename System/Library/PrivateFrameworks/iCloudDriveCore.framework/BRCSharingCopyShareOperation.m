@interface BRCSharingCopyShareOperation
- (BRCClientZone)clientZone;
- (BRCItemID)rootItemIDToLookup;
- (BRCSharingCopyShareOperation)initWithItem:(id)a3 sessionContext:(id)a4;
- (CKRecordID)recordIDNeedingFetch;
- (CKRecordID)shareID;
- (id)createActivity;
- (void)fetchRootURLIfNecessaryAndFinishWithShare:(id)a3;
- (void)main;
- (void)setClientZone:(id)a3;
- (void)setRecordIDNeedingFetch:(id)a3;
- (void)setRootItemIDToLookup:(id)a3;
- (void)setShareID:(id)a3;
@end

@implementation BRCSharingCopyShareOperation

- (BRCSharingCopyShareOperation)initWithItem:(id)a3 sessionContext:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 serverZone];
  v9 = [v8 metadataSyncContext];

  if (!v9)
  {
    v33 = [v6 serverZone];

    if (v33)
    {
      v34 = brc_bread_crumbs();
      v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        -[BRCSharingCopyShareOperation initWithItem:sessionContext:](v6, (uint64_t)v34, v35);
      }
    }
    else
    {
      v34 = brc_bread_crumbs();
      v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        -[BRCSharingCopyShareOperation initWithItem:sessionContext:]((uint64_t)v6, (uint64_t)v34, v35);
      }
    }
  }
  v10 = [v6 itemID];
  v11 = [v10 debugItemIDString];
  v12 = [@"sharing/copy-share" stringByAppendingPathComponent:v11];

  v36.receiver = self;
  v36.super_class = (Class)BRCSharingCopyShareOperation;
  v13 = [(_BRCOperation *)&v36 initWithName:v12 syncContext:v9 sessionContext:v7];

  if (v13)
  {
    [(_BRCOperation *)v13 setNonDiscretionary:1];
    uint64_t v14 = [v6 clientZone];
    clientZone = v13->_clientZone;
    v13->_clientZone = (BRCClientZone *)v14;

    if (([v6 sharingOptions] & 0x48) != 0)
    {
      if (([v6 sharingOptions] & 4) != 0) {
        goto LABEL_12;
      }
LABEL_8:
      v18 = brc_bread_crumbs();
      v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v38 = v6;
        __int16 v39 = 2112;
        v40 = v18;
        _os_log_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Fetching the root share object for shared to me child item %@%@", buf, 0x16u);
      }

      uint64_t v20 = objc_msgSend(MEMORY[0x263EFD7E8], "brc_fetchShareIDWithSharedItem:", v6);
      shareID = v13->_shareID;
      v13->_shareID = (CKRecordID *)v20;

      uint64_t v22 = [(CKRecordID *)v13->_shareID brc_shareItemID];
      rootItemIDToLookup = v13->_rootItemIDToLookup;
      v13->_rootItemIDToLookup = (BRCItemID *)v22;
      goto LABEL_22;
    }
    v16 = [v6 clientZone];
    if ([v16 isSharedZone])
    {
      char v17 = [v6 sharingOptions];

      if ((v17 & 4) == 0) {
        goto LABEL_8;
      }
    }
    else
    {
    }
LABEL_12:
    if (([v6 isDirectory] & 1) != 0 || objc_msgSend(v6, "isDocument"))
    {
      id v24 = objc_alloc(MEMORY[0x263EFD7E8]);
      v25 = [v6 asShareableItem];
      uint64_t v26 = [v24 initShareIDWithShareableItem:v25];
      v27 = v13->_shareID;
      v13->_shareID = (CKRecordID *)v26;

      if (([v6 sharingOptions] & 4) != 0) {
        goto LABEL_23;
      }
      rootItemIDToLookup = [v6 st];
      int v28 = [rootItemIDToLookup iWorkShareable];

      if (!v28) {
        goto LABEL_23;
      }
      int v29 = [v6 isDocument];
      if (v29)
      {
        rootItemIDToLookup = [v6 asDocument];
        v30 = [rootItemIDToLookup documentRecordID];
      }
      else
      {
        v30 = 0;
      }
      objc_storeStrong((id *)&v13->_recordIDNeedingFetch, v30);
      if (!v29) {
        goto LABEL_23;
      }
    }
    else
    {
      rootItemIDToLookup = v13->_shareID;
      v13->_shareID = 0;
    }
LABEL_22:

LABEL_23:
    v31 = objc_msgSend(MEMORY[0x263EFD780], "br_sharingMisc");
    [(_BRCOperation *)v13 setGroup:v31];
  }
  return v13;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sharing/copy-share", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)fetchRootURLIfNecessaryAndFinishWithShare:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorDocumentIsNotShared");
    v8 = self;
    v9 = 0;
    v10 = v5;
LABEL_6:
    [(_BRCOperation *)v8 completedWithResult:v9 error:v10];
    goto LABEL_7;
  }
  v5 = objc_opt_new();
  [v5 setObject:v4 forKeyedSubscript:@"share"];
  if (!self->_rootItemIDToLookup)
  {
    v8 = self;
    v9 = v5;
    v10 = 0;
    goto LABEL_6;
  }
  id v6 = [(BRCClientZone *)self->_clientZone db];
  id v7 = [v6 serialQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke;
  v11[3] = &unk_26507ED98;
  v11[4] = self;
  id v12 = v5;
  dispatch_async(v7, v11);

LABEL_7:
}

void __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  os_activity_t v2 = [*(id *)(*(void *)(a1 + 32) + 544) itemByItemID:*(void *)(*(void *)(a1 + 32) + 536)];
  if (v2)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_10;
    v20[3] = &unk_2650812D8;
    v3 = *(void **)(a1 + 40);
    v20[4] = *(void *)(a1 + 32);
    id v21 = v3;
    id v4 = (void *)MEMORY[0x2455D9A50](v20);
    v5 = [v2 fileObjectID];
    id v6 = [v5 asString];

    id v7 = objc_msgSend(MEMORY[0x263F055B8], "br_sharedProviderManager");
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_19;
    v16[3] = &unk_265081300;
    uint64_t v8 = *(void *)(a1 + 32);
    id v17 = v6;
    uint64_t v18 = v8;
    id v19 = v4;
    id v9 = v4;
    id v10 = v6;
    [v7 getUserVisibleURLForItemIdentifier:v10 completionHandler:v16];
  }
  else
  {
    v11 = *(void **)(a1 + 32);
    id v12 = brc_bread_crumbs();
    v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 536);
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v15;
      __int16 v24 = 2112;
      v25 = v12;
      _os_log_fault_impl(&dword_23FA42000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't find root itemID %@%@", buf, 0x16u);
    }

    uint64_t v14 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: Can't find root itemID %@", *(void *)(*(void *)(a1 + 32) + 536));
    [v11 completedWithResult:0 error:v14];
  }
}

void __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_10(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) setObject:a2 forKeyedSubscript:@"rootURL"];
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 completedWithResult:v4 error:0];
  }
  else
  {
    uint64_t v6 = a1 + 32;
    v5 = *(void **)(a1 + 32);
    id v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_10_cold_1(v6, (uint64_t)v7, v8);
    }

    id v9 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: Can't find URL for root itemID %@", *(void *)(*(void *)v6 + 536));
    [v5 completedWithResult:0 error:v9];
  }
}

void __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6)
  {
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      v30 = v9;
      _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't get user visible file on %@ - %@%@", buf, 0x20u);
    }

    uint64_t v8 = 0;
  }
  id v12 = [*(id *)(*(void *)(a1 + 40) + 544) db];
  v13 = [v12 serialQueue];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_20;
  v24[3] = &unk_26507F450;
  id v26 = *(id *)(a1 + 48);
  id v14 = v8;
  id v25 = v14;
  uint64_t v15 = v13;
  v16 = v24;
  id v17 = (void *)MEMORY[0x2455D97F0]();
  long long v27 = 0uLL;
  uint64_t v28 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v27);
  uint64_t v18 = brc_bread_crumbs();
  id v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = v27;
    label = dispatch_queue_get_label(v15);
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v22;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = label;
    *(_WORD *)&buf[22] = 2112;
    v30 = v18;
    _os_log_debug_impl(&dword_23FA42000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", buf, 0x20u);
  }

  long long v33 = v27;
  uint64_t v34 = v28;
  *(void *)buf = MEMORY[0x263EF8330];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __dispatch_async_with_logs_block_invoke_5;
  v30 = &unk_26507EE60;
  uint64_t v20 = v15;
  v31 = v20;
  id v21 = v16;
  id v32 = v21;
  dispatch_async(v20, buf);
}

uint64_t __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)main
{
  v11[4] = *MEMORY[0x263EF8340];
  if (self->_shareID)
  {
    id v3 = objc_alloc(MEMORY[0x263EFD6D8]);
    uint64_t v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", self->_shareID, self->_recordIDNeedingFetch, 0);
    id v5 = (void *)[v3 initWithRecordIDs:v4];

    [v5 setShouldFetchAssetContent:0];
    uint64_t v6 = *MEMORY[0x263EFD5B0];
    v11[0] = *MEMORY[0x263EFD598];
    v11[1] = v6;
    uint64_t v7 = *MEMORY[0x263EFD538];
    v11[2] = *MEMORY[0x263EFD530];
    v11[3] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];
    [v5 setDesiredKeys:v8];

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __36__BRCSharingCopyShareOperation_main__block_invoke;
    v10[3] = &unk_2650805D0;
    v10[4] = self;
    [v5 setFetchRecordsCompletionBlock:v10];
    [(_BRCOperation *)self addSubOperation:v5];
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorDocumentIsNotShared");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation completedWithResult:error:](self, "completedWithResult:error:", 0);
  }
}

void __36__BRCSharingCopyShareOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  if (a3)
  {
    [v6 completedWithResult:0 error:a3];
  }
  else
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:v6[65]];
    uint64_t v8 = *(void **)(a1 + 32);
    if (v8[66])
    {
      id v9 = objc_msgSend(v5, "objectForKeyedSubscript:");
      id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263EFD598]];
      uint64_t v11 = [v9 encryptedValues];
      id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263EFD5B0]];

      v13 = [v9 recordID];
      id v14 = [*(id *)(a1 + 32) syncContext];
      uint64_t v15 = [v14 session];
      v16 = objc_msgSend(v13, "brc_itemIDWithSession:", v15);

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 setPublicSharingIdentity:v12];
      }
      else
      {
        id v17 = brc_bread_crumbs();
        uint64_t v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412546;
          uint64_t v22 = v16;
          __int16 v23 = 2112;
          __int16 v24 = v17;
          _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] No sharing identity on %@%@", (uint8_t *)&v21, 0x16u);
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 setBaseToken:v10];
      }
      else
      {
        id v19 = brc_bread_crumbs();
        uint64_t v20 = brc_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412546;
          uint64_t v22 = v16;
          __int16 v23 = 2112;
          __int16 v24 = v19;
          _os_log_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] No base token on %@%@", (uint8_t *)&v21, 0x16u);
        }
      }
      uint64_t v8 = *(void **)(a1 + 32);
    }
    [v8 fetchRootURLIfNecessaryAndFinishWithShare:v7];
  }
}

- (CKRecordID)shareID
{
  return self->_shareID;
}

- (void)setShareID:(id)a3
{
}

- (CKRecordID)recordIDNeedingFetch
{
  return self->_recordIDNeedingFetch;
}

- (void)setRecordIDNeedingFetch:(id)a3
{
}

- (BRCItemID)rootItemIDToLookup
{
  return self->_rootItemIDToLookup;
}

- (void)setRootItemIDToLookup:(id)a3
{
}

- (BRCClientZone)clientZone
{
  return self->_clientZone;
}

- (void)setClientZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientZone, 0);
  objc_storeStrong((id *)&self->_rootItemIDToLookup, 0);
  objc_storeStrong((id *)&self->_recordIDNeedingFetch, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
}

- (void)initWithItem:(NSObject *)a3 sessionContext:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, a2, a3, "[CRIT] UNREACHABLE: Copying share for item %@ that does not have a server zone%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)initWithItem:(NSObject *)a3 sessionContext:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 serverZone];
  int v7 = 138412802;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  id v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_fault_impl(&dword_23FA42000, a3, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Item's %@ server zone %@ is missing sync context while coping share%@", (uint8_t *)&v7, 0x20u);
}

void __74__BRCSharingCopyShareOperation_fetchRootURLIfNecessaryAndFinishWithShare___block_invoke_10_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138412546;
  *(void *)&v3[4] = *(void *)(*(void *)a1 + 536);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, a2, a3, "[CRIT] UNREACHABLE: Can't find URL for root itemID %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

@end