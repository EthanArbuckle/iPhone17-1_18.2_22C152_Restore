@interface BRCListDirectoryContentsOperation
- (BOOL)rescheduleApply;
- (BOOL)shouldRetryForError:(id)a3;
- (BRCItemID)folderToList;
- (BRCListDirectoryContentsOperation)initWithItemID:(id)a3 sessionContext:(id)a4 zone:(id)a5 isUserWaiting:(BOOL)a6;
- (void)_cursorWasUpdated:(id)a3 subResourcesOp:(id)a4;
- (void)_scheduleQueryOp;
- (void)_waitForFlushAndRescheduleApplyIfNecessaryWithError:(id)a3;
- (void)addDirectoryListCompletionBlock:(id)a3;
- (void)addPreFlushDirectoryListCompletionBlock:(id)a3;
- (void)beginObservingChangesWithDelegate:(id)a3;
- (void)cancelToBeReplacedByOperation:(id)a3;
- (void)endObservingChangesWithDelegate:(id)a3;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setRescheduleApply:(BOOL)a3;
@end

@implementation BRCListDirectoryContentsOperation

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (BRCListDirectoryContentsOperation)initWithItemID:(id)a3 sessionContext:(id)a4 zone:(id)a5 isUserWaiting:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a5;
  id v13 = a4;
  v14 = [v11 debugItemIDString];
  v15 = [@"list-dir/" stringByAppendingString:v14];

  v16 = [v12 metadataSyncContext];
  v30.receiver = self;
  v30.super_class = (Class)BRCListDirectoryContentsOperation;
  v17 = [(_BRCOperation *)&v30 initWithName:v15 syncContext:v16 sessionContext:v13];

  if (v17)
  {
    [(_BRCOperation *)v17 setNonDiscretionary:v6];
    objc_storeStrong((id *)&v17->_serverZone, a5);
    objc_storeStrong((id *)&v17->_itemID, a3);
    uint64_t v18 = [v11 directoryStructureRecordIDInZone:v12];
    recordID = v17->_recordID;
    v17->_recordID = (CKRecordID *)v18;

    v20 = [v12 mangledID];
    v21 = +[BRCUserDefaults defaultsForMangledID:v20];

    v17->_batchSize = [v21 maxRecordCountWhenListingDirChanges];
    uint64_t v22 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    delegates = v17->_delegates;
    v17->_delegates = (NSHashTable *)v22;

    v24 = objc_msgSend(MEMORY[0x263EFD780], "br_listDirectoryContents");
    [(_BRCOperation *)v17 setGroup:v24];

    uint64_t v25 = objc_opt_new();
    preFlushListCompletionBlocks = v17->_preFlushListCompletionBlocks;
    v17->_preFlushListCompletionBlocks = (NSMutableArray *)v25;

    uint64_t v27 = objc_opt_new();
    listCompletionBlocks = v17->_listCompletionBlocks;
    v17->_listCompletionBlocks = (NSMutableArray *)v27;

    if (v6) {
      [(BRCListDirectoryContentsOperation *)v17 setQueuePriority:8];
    }
  }
  return v17;
}

- (void)beginObservingChangesWithDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (![(NSHashTable *)self->_delegates containsObject:v4])
    {
      v5.receiver = self;
      v5.super_class = (Class)BRCListDirectoryContentsOperation;
      [(BRCAutoCancelOperation *)&v5 beginObservingChanges];
      [(NSHashTable *)self->_delegates addObject:v4];
    }
  }
  else
  {
    self->_hasNilDelegate = 1;
    v6.receiver = self;
    v6.super_class = (Class)BRCListDirectoryContentsOperation;
    [(BRCAutoCancelOperation *)&v6 beginObservingChanges];
  }
}

- (void)endObservingChangesWithDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BRCListDirectoryContentsOperation;
  id v4 = a3;
  [(BRCAutoCancelOperation *)&v5 endObservingChanges];
  -[NSHashTable removeObject:](self->_delegates, "removeObject:", v4, v5.receiver, v5.super_class);
}

- (void)cancelToBeReplacedByOperation:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = self;
    objc_sync_enter(v5);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    objc_super v6 = [(BRCListDirectoryContentsOperation *)v5 dependencies];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v42 != v8) {
            objc_enumerationMutation(v6);
          }
          [v4 addDependency:*(void *)(*((void *)&v41 + 1) + 8 * i)];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v7);
    }

    v10 = v5->_delegates;
    delegates = v5->_delegates;
    v5->_delegates = 0;

    id v12 = v5->_listCompletionBlocks;
    id v13 = v5->_preFlushListCompletionBlocks;
    listCompletionBlocks = v5->_listCompletionBlocks;
    v5->_listCompletionBlocks = 0;

    preFlushListCompletionBlocks = v5->_preFlushListCompletionBlocks;
    v5->_preFlushListCompletionBlocks = 0;

    objc_sync_exit(v5);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v16 = v10;
    uint64_t v17 = [(NSHashTable *)v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v16);
          }
          v20 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          [v4 beginObservingChangesWithDelegate:v20];
          [v20 listOperation:v5 wasReplacedByOperation:v4];
        }
        uint64_t v17 = [(NSHashTable *)v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v17);
    }

    if (v5->_hasNilDelegate) {
      [v4 beginObservingChangesWithDelegate:0];
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v21 = v12;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v33 objects:v46 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v34;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(v21);
          }
          [v4 addDirectoryListCompletionBlock:*(void *)(*((void *)&v33 + 1) + 8 * k)];
        }
        uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v33 objects:v46 count:16];
      }
      while (v22);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v25 = v13;
    uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v29 objects:v45 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v30;
      do
      {
        for (uint64_t m = 0; m != v26; ++m)
        {
          if (*(void *)v30 != v27) {
            objc_enumerationMutation(v25);
          }
          objc_msgSend(v4, "addPreFlushDirectoryListCompletionBlock:", *(void *)(*((void *)&v29 + 1) + 8 * m), (void)v29);
        }
        uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v29 objects:v45 count:16];
      }
      while (v26);
    }

    [(_BRCOperation *)v5 cancel];
    if ([(_BRCOperation *)v5 isExecuting]) {
      [v4 addDependency:v5];
    }
  }
  else
  {
    [(_BRCOperation *)self cancel];
  }
}

- (void)_cursorWasUpdated:(id)a3 subResourcesOp:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 error];

  if (v8
    && ([v7 error],
        v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = objc_msgSend(v9, "brc_checkErrorsFromCloudKit:", &__block_literal_global_8),
        v9,
        v10))
  {
    id v11 = [v7 error];
    [(_BRCOperation *)self completedWithResult:0 error:v11];
  }
  else
  {
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v19 = [(BRCListDirectoryContentsOperation *)self name];
      int v20 = 138412802;
      v21 = v19;
      __int16 v22 = 2112;
      id v23 = v6;
      __int16 v24 = 2112;
      uint64_t v25 = v12;
      _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ finished listing batch with cursor %@%@", (uint8_t *)&v20, 0x20u);
    }
    if (([v7 saveRecordsWithQueryCursor:v6] & 1) == 0)
    {
      v14 = [v7 error];

      if (!v14)
      {
        serverZone = self->_serverZone;
        v16 = [v7 pendingChangesStream];
        uint64_t v17 = [v7 queryFinishedServerTruthCallback];
        uint64_t v18 = [v7 queryFinishedClientTruthCallback];
        [(BRCServerZone *)serverZone failedListingDirectoryChanges:v16 serverTruthCallback:v17 clientTruthCallback:v18 folderItemID:self->_itemID];

        [v7 setQueryFinishedServerTruthCallback:0];
        [v7 setQueryFinishedClientTruthCallback:0];
      }
    }
  }
}

BOOL __70__BRCListDirectoryContentsOperation__cursorWasUpdated_subResourcesOp___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = (objc_msgSend(v2, "brc_isCloudKitUnknownItemError") & 1) == 0
    && !objc_msgSend(v2, "brc_isCloudKitAtomicFailure");

  return v3;
}

- (void)_scheduleQueryOp
{
  *(_DWORD *)BOOL v3 = 138412546;
  *(void *)&v3[4] = *(void *)(*(void *)a1 + 40);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_23FA42000, a2, a3, "[DEBUG] Dropping list directory database because of a token fetch error - %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke(void *a1, void *a2, void *a3, char a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = *(void *)(a1[4] + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v9;
  id v20 = v9;

  uint64_t v14 = *(void *)(a1[5] + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v10;
  id v16 = v10;

  uint64_t v17 = *(void *)(a1[6] + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v11;
  id v19 = v11;

  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = a4;
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_76(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = brc_bread_crumbs();
  BOOL v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_76_cold_1(a1);
  }

  *(void *)(*(void *)(a1 + 40) + 552) = [*(id *)(a1 + 48) recordsFetched];
  *(void *)(*(void *)(a1 + 40) + 560) = [*(id *)(a1 + 48) recordsFetchedTotalMetadataSize];
  *(void *)(*(void *)(a1 + 40) + 568) = [*(id *)(a1 + 48) xattrsFetchedTotalSize];
  if ([*(id *)(a1 + 32) isNonDesktopRoot]) {
    goto LABEL_4;
  }
  id v7 = [*(id *)(a1 + 56) changeState];
  uint64_t v8 = [v7 changeToken];
  if (v8)
  {

LABEL_9:
    id v4 = [*(id *)(a1 + 56) db];
    uint64_t v10 = *(void *)(a1 + 32);
    objc_super v5 = [*(id *)(a1 + 56) dbRowID];
    [v4 execute:@"UPDATE server_items SET item_type = 0, item_ranuint64_t k = NULL WHERE item_id = %@ AND zone_rowid = %@ AND item_type = 9", v10, v5];
    goto LABEL_10;
  }
  int v9 = [*(id *)(a1 + 56) isSharedZone];

  if (v9) {
    goto LABEL_9;
  }
LABEL_4:
  id v4 = brc_bread_crumbs();
  objc_super v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) debugItemIDString];
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Not trying to promote %@ to a normal directory%@", buf, 0x16u);
  }
LABEL_10:
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_80(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isNonDesktopRoot])
  {
    id v2 = [*(id *)(a1 + 40) session];
    BOOL v3 = [*(id *)(a1 + 32) appLibraryRowID];
    id v4 = [v2 appLibraryByRowID:v3];

    [v4 setStateBits:0x2000000];
    if ([v4 isCloudDocsAppLibrary]) {
      [v4 setStateBits:0x4000000];
    }
  }
  if ([*(id *)(a1 + 32) isDocumentsFolder])
  {
    objc_super v5 = [*(id *)(a1 + 40) session];
    id v6 = [*(id *)(a1 + 32) appLibraryRowID];
    id v7 = [v5 appLibraryByRowID:v6];

    [v7 setStateBits:0x4000000];
  }
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_81(int8x16_t *a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_2;
  v2[3] = &unk_26507ED98;
  int8x16_t v1 = a1[2];
  int8x16_t v3 = vextq_s8(v1, v1, 8uLL);
  [(id)v1.i64[0] notifyWhenRecordsAreFetchedAndFinish:v2];
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _cursorWasUpdated:0 subResourcesOp:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) error];
  [v2 completedWithResult:0 error:v3];
}

uint64_t __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_102(uint64_t a1)
{
  return [*(id *)(a1 + 32) addRecordIDToDeserialize:*(void *)(*(void *)(a1 + 40) + 536)];
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_2_103(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 520) clientZone];
  int v3 = [v2 itemTypeByItemID:*(void *)(*(void *)(a1 + 32) + 528) db:*(void *)(a1 + 40)];

  if (v3 == 10)
  {
    id v4 = brc_bread_crumbs();
    objc_super v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_2_103_cold_1((uint64_t)v4, v5);
    }

    id v6 = [*(id *)(a1 + 48) callbackQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_104;
    v9[3] = &unk_26507ED98;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    dispatch_async(v6, v9);
  }
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_104(uint64_t a1)
{
  [*(id *)(a1 + 32) addRecordIDToDeserialize:*(void *)(*(void *)(a1 + 40) + 536)];
  id v2 = objc_alloc(MEMORY[0x263EFD7E8]);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(v3 + 528);
  objc_super v5 = [*(id *)(v3 + 520) zoneID];
  id v6 = (id)[v2 initShareIDWithItemID:v4 zoneID:v5];

  [*(id *)(a1 + 32) addRecordIDToDeserialize:v6 recordType:3];
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_2_107(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 528) debugDescription];
    id v16 = [v8 recordType];
    int v17 = 138413314;
    uint64_t v18 = v15;
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    __int16 v22 = v16;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    uint64_t v26 = v10;
    _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Listing directory contents of %@: Got record: ID [%@] Type [%@], error %@%@", (uint8_t *)&v17, 0x34u);
  }
  if (v8)
  {
    [*(id *)(a1 + 40) addRecord:v8];
  }
  else if (objc_msgSend(v9, "brc_isCloudKitPCSDecryptionFailure") {
         && [*(id *)(a1 + 48) isPrivateZone])
  }
  {
    uint64_t v12 = [*(id *)(a1 + 48) clientZone];
    __int16 v13 = [v12 asPrivateClientZone];
    uint64_t v14 = [v7 recordName];
    [v13 reportProblemWithType:12 recordName:v14];
  }
}

uint64_t __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_109(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _cursorWasUpdated:a2 subResourcesOp:*(void *)(a1 + 40)];
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_2_111(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6 && (objc_msgSend(v6, "brc_isIgnorableListDirectoryError") & 1) == 0)
  {
    [*(id *)(a1 + 32) cancel];
    [*(id *)(a1 + 40) completedWithResult:0 error:v7];
  }
  else
  {
    [*(id *)(a1 + 40) _cursorWasUpdated:v5 subResourcesOp:*(void *)(a1 + 32)];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_3;
    v9[3] = &unk_26507EE10;
    id v8 = *(void **)(a1 + 32);
    void v9[4] = *(void *)(a1 + 40);
    id v10 = v5;
    id v11 = *(id *)(a1 + 32);
    id v12 = v7;
    [v8 notifyWhenRecordsAreFetchedAndFinish:v9];
  }
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _cursorWasUpdated:*(void *)(a1 + 40) subResourcesOp:*(void *)(a1 + 48)];
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_3_cold_1((uint64_t)v4, v5);
    }
  }
  id v2 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0);
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 48) error];
    [v2 completedWithResult:0 error:v3];
  }
}

- (void)main
{
  int8x16_t v1 = [*(id *)(a1 + 528) debugDescription];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] Listing directory contents of %@%@", v4, v5, v6, v7, v8);
}

- (void)_waitForFlushAndRescheduleApplyIfNecessaryWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_serverZone;
  uint64_t v6 = [(BRCServerZone *)v5 clientZone];
  uint64_t v7 = [v6 db];
  uint8_t v8 = [v7 serialQueue];

  if (v8)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __89__BRCListDirectoryContentsOperation__waitForFlushAndRescheduleApplyIfNecessaryWithError___block_invoke;
    v9[3] = &unk_26507EE10;
    id v10 = v6;
    id v11 = self;
    id v12 = v5;
    id v13 = v4;
    dispatch_async(v8, v9);
  }
}

void __89__BRCListDirectoryContentsOperation__waitForFlushAndRescheduleApplyIfNecessaryWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) db];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __89__BRCListDirectoryContentsOperation__waitForFlushAndRescheduleApplyIfNecessaryWithError___block_invoke_2;
  v7[3] = &unk_26507F760;
  uint64_t v3 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __89__BRCListDirectoryContentsOperation__waitForFlushAndRescheduleApplyIfNecessaryWithError___block_invoke_3;
  v4[3] = &unk_26507F060;
  v4[4] = *(void *)(a1 + 40);
  id v5 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 32);
  [v2 performWithFlags:4 action:v7 whenFlushed:v4];
}

uint64_t __89__BRCListDirectoryContentsOperation__waitForFlushAndRescheduleApplyIfNecessaryWithError___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  if ([a1[4] rescheduleApply])
  {
    id v4 = [BRCItemGlobalID alloc];
    id v5 = [a1[5] dbRowID];
    id v6 = [(BRCItemGlobalID *)v4 initWithZoneRowID:v5 itemID:*((void *)a1[4] + 66)];

    uint64_t v7 = [a1[6] session];
    id v8 = [v7 applyScheduler];
    [v8 rescheduleItemsParentedToItemGlobalID:v6];
  }
  [v3 forceBatchStart];

  return 1;
}

void __89__BRCListDirectoryContentsOperation__waitForFlushAndRescheduleApplyIfNecessaryWithError___block_invoke_3(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = *(id *)(*(void *)(a1 + 32) + 576);
  id v4 = *(id *)(*(void *)(a1 + 32) + 584);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 584);
  *(void *)(v5 + 584) = 0;

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 576);
  *(void *)(v7 + 576) = 0;

  objc_sync_exit(v2);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v23 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v11);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v3;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * v18) + 16))(*(void *)(*((void *)&v19 + 1) + 8 * v18));
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }

  objc_msgSend(*(id *)(a1 + 48), "scheduleSyncUp", (void)v19);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7 && [(_BRCOperation *)self nonDiscretionary])
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCListDirectoryContentsOperation finishWithResult:error:]((uint64_t)self, (uint64_t)v8, v9);
    }

    [(_BRCOperation *)self executionTimeInSec];
    id v10 = +[AppTelemetryTimeSeriesEvent newQBSOperationPrformanceEventWithTime:type:recordsFetched:recordsFetchedTotalMetadataSize:xattrsFetchedTotalSize:](AppTelemetryTimeSeriesEvent, "newQBSOperationPrformanceEventWithTime:type:recordsFetched:recordsFetchedTotalMetadataSize:xattrsFetchedTotalSize:", @"BRCListDirectoryContentsOperation", self->_recordsFetched, self->_recordsFetchedTotalMetadataSize, self->_xattrsFetchedTotalSize);
    uint64_t v11 = [(BRCServerZone *)self->_serverZone session];
    uint64_t v12 = [v11 analyticsReporter];
    [v12 postReportForDefaultSubCategoryWithCategory:11 telemetryTimeEvent:v10];
  }
  uint64_t v13 = [v7 userInfo];
  id v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263EFD4C8]];
  uint64_t v15 = [v14 objectForKeyedSubscript:self->_recordID];
  if (!objc_msgSend(v15, "brc_isCloudKitUnknownItemError"))
  {

    goto LABEL_12;
  }
  if ([(BRCItemID *)self->_itemID isDocumentsFolder])
  {
  }
  else
  {
    BOOL v16 = [(BRCItemID *)self->_itemID isNonDesktopRoot];

    if (!v16) {
      goto LABEL_12;
    }
  }

  uint64_t v17 = [(BRCServerZone *)self->_serverZone clientZone];
  uint64_t v18 = [v17 db];
  long long v19 = [v18 serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__BRCListDirectoryContentsOperation_finishWithResult_error___block_invoke;
  block[3] = &unk_26507ED70;
  block[4] = self;
  dispatch_sync(v19, block);

  long long v20 = [(BRCServerZone *)self->_serverZone db];
  long long v21 = [v20 serialQueue];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __60__BRCListDirectoryContentsOperation_finishWithResult_error___block_invoke_2;
  v33[3] = &unk_26507ED70;
  v33[4] = self;
  dispatch_sync(v21, v33);

  id v7 = 0;
LABEL_12:
  v32.receiver = self;
  v32.super_class = (Class)BRCListDirectoryContentsOperation;
  [(_BRCOperation *)&v32 finishWithResult:v6 error:v7];
  long long v22 = self;
  objc_sync_enter(v22);
  long long v23 = (void *)[(NSMutableArray *)v22->_preFlushListCompletionBlocks copy];
  [(NSMutableArray *)v22->_preFlushListCompletionBlocks removeAllObjects];
  objc_sync_exit(v22);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v24 = v23;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(v24);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v28 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v28 + 1) + 8 * i));
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v25);
  }

  -[BRCListDirectoryContentsOperation _waitForFlushAndRescheduleApplyIfNecessaryWithError:](v22, "_waitForFlushAndRescheduleApplyIfNecessaryWithError:", v7, (void)v28);
}

void __60__BRCListDirectoryContentsOperation_finishWithResult_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 528) isNonDesktopRoot])
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 520) session];
    id v3 = [*(id *)(*(void *)(a1 + 32) + 528) appLibraryRowID];
    id v4 = [v2 appLibraryByRowID:v3];

    [v4 setStateBits:0x2000000];
    if ([v4 isCloudDocsAppLibrary]) {
      [v4 setStateBits:0x4000000];
    }
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 248) session];
    [v5 saveAppLibraryToDB:v4];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 528) isDocumentsFolder])
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 520) session];
    id v7 = [*(id *)(*(void *)(a1 + 32) + 528) appLibraryRowID];
    id v9 = [v6 appLibraryByRowID:v7];

    [v9 setStateBits:0x4000000];
    id v8 = [*(id *)(*(void *)(a1 + 32) + 248) session];
    [v8 saveAppLibraryToDB:v9];
  }
}

void __60__BRCListDirectoryContentsOperation_finishWithResult_error___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 520) checkIfFinishedFullSync];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 520) session];
  [v2 saveServerZoneToDB:*(void *)(*(void *)(a1 + 32) + 520)];
}

- (void)addDirectoryListCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  listCompletionBlocks = v5->_listCompletionBlocks;
  if (listCompletionBlocks)
  {
    id v7 = (void *)MEMORY[0x2455D9A50](v4);
    [(NSMutableArray *)listCompletionBlocks addObject:v7];
  }
  else
  {
    id v8 = [(_BRCOperation *)v5 callbackQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __69__BRCListDirectoryContentsOperation_addDirectoryListCompletionBlock___block_invoke;
    v9[3] = &unk_26507F450;
    void v9[4] = v5;
    id v10 = v4;
    dispatch_async(v8, v9);
  }
  objc_sync_exit(v5);
}

void __69__BRCListDirectoryContentsOperation_addDirectoryListCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)addPreFlushDirectoryListCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  preFlushListCompletionBlocks = v5->_preFlushListCompletionBlocks;
  if (!preFlushListCompletionBlocks)
  {
    id v7 = [(_BRCOperation *)v5 callbackQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __77__BRCListDirectoryContentsOperation_addPreFlushDirectoryListCompletionBlock___block_invoke;
    v9[3] = &unk_26507F450;
    void v9[4] = v5;
    id v10 = v4;
    dispatch_async(v7, v9);

    preFlushListCompletionBlocks = v5->_preFlushListCompletionBlocks;
  }
  id v8 = (void *)MEMORY[0x2455D9A50](v4);
  [(NSMutableArray *)preFlushListCompletionBlocks addObject:v8];

  objc_sync_exit(v5);
}

void __77__BRCListDirectoryContentsOperation_addPreFlushDirectoryListCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BRCItemID)folderToList
{
  return self->_itemID;
}

- (BOOL)rescheduleApply
{
  return self->_rescheduleApply;
}

- (void)setRescheduleApply:(BOOL)a3
{
  self->_rescheduleApply = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryOp, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_preFlushListCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_listCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_76_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) debugItemIDString];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] Finished listing directory contents of %@%@", v4, v5, v6, v7, v8);
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_2_103_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23FA42000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Fetching the root as well of this share accept fault%@", (uint8_t *)&v2, 0xCu);
}

void __53__BRCListDirectoryContentsOperation__scheduleQueryOp__block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !continuationCursor%@", (uint8_t *)&v2, 0xCu);
}

- (void)finishWithResult:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v6 = [*(id *)(a1 + 528) debugDescription];
  [(id)a1 executionTimeInSec];
  uint64_t v7 = *(void *)(a1 + 552);
  uint64_t v8 = *(void *)(a1 + 560);
  uint64_t v9 = *(void *)(a1 + 568);
  int v11 = 138413570;
  uint64_t v12 = v6;
  __int16 v13 = 2048;
  uint64_t v14 = v10;
  __int16 v15 = 2048;
  uint64_t v16 = v7;
  __int16 v17 = 2048;
  uint64_t v18 = v8;
  __int16 v19 = 2048;
  uint64_t v20 = v9;
  __int16 v21 = 2112;
  uint64_t v22 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Listing directory contents of %@ took [%f] Secs and fetched [%llu,%llu] records [%llu] xattrs%@", (uint8_t *)&v11, 0x3Eu);
}

@end