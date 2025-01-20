@interface BRCRecursiveListDirectoryContentsOperation
- (BOOL)_finishIfBlockedFromListing;
- (BOOL)rescheduleApply;
- (BOOL)shouldRetryForError:(id)a3;
- (BRCRecursiveListDirectoryContentsOperation)initWithItemID:(id)a3 sessionContext:(id)a4 zone:(id)a5 isUserWaiting:(BOOL)a6;
- (void)addRecursiveDirectoryListCompletionBlock:(id)a3;
- (void)cancel;
- (void)fetchNextItemToList;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)listNextItem;
- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4;
- (void)listOrFetchNextItem;
- (void)main;
- (void)setRescheduleApply:(BOOL)a3;
@end

@implementation BRCRecursiveListDirectoryContentsOperation

- (BRCRecursiveListDirectoryContentsOperation)initWithItemID:(id)a3 sessionContext:(id)a4 zone:(id)a5 isUserWaiting:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a5;
  id v13 = a4;
  v14 = [v11 debugItemIDString];
  v15 = [@"rec-list-dir/" stringByAppendingString:v14];

  v16 = [v12 metadataSyncContext];
  v26.receiver = self;
  v26.super_class = (Class)BRCRecursiveListDirectoryContentsOperation;
  v17 = [(_BRCOperation *)&v26 initWithName:v15 syncContext:v16 sessionContext:v13];

  if (v17)
  {
    [(_BRCOperation *)v17 setNonDiscretionary:v6];
    objc_storeStrong((id *)&v17->_serverZone, a5);
    uint64_t v18 = objc_opt_new();
    itemsToList = v17->_itemsToList;
    v17->_itemsToList = (NSMutableSet *)v18;

    objc_storeStrong((id *)&v17->_rootItemID, a3);
    uint64_t v20 = objc_opt_new();
    itemsFailedListing = v17->_itemsFailedListing;
    v17->_itemsFailedListing = (NSMutableSet *)v20;

    v22 = objc_msgSend(MEMORY[0x263EFD780], "br_listDirectoryContents");
    [(_BRCOperation *)v17 setGroup:v22];

    uint64_t v23 = objc_opt_new();
    recursiveListCompletionBlocks = v17->_recursiveListCompletionBlocks;
    v17->_recursiveListCompletionBlocks = (NSMutableArray *)v23;
  }
  return v17;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (void)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  [(BRCListDirectoryContentsOperation *)v2->_activeListOp endObservingChangesWithDelegate:v2];
  activeListOp = v2->_activeListOp;
  v2->_activeListOp = 0;

  objc_sync_exit(v2);
  v4.receiver = v2;
  v4.super_class = (Class)BRCRecursiveListDirectoryContentsOperation;
  [(_BRCOperation *)&v4 cancel];
  [(_BRCOperation *)v2 finishIfCancelled];
}

- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4
{
  id v7 = a4;
  if (self->_activeListOp == a3)
  {
    id v8 = v7;
    objc_storeStrong((id *)&self->_activeListOp, a4);
    id v7 = v8;
  }
}

- (BOOL)_finishIfBlockedFromListing
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = [(BRCServerZone *)self->_serverZone clientZone];
  int v4 = [v3 _isSideSyncOperationBlockedWithName:@"rec-list fetch next item"];

  if (v4)
  {
    v5 = brc_bread_crumbs();
    BOOL v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't list anymore in the middle of a rec-list operation%@", (uint8_t *)&v9, 0xCu);
    }

    id v7 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorSyncBlocked");
    [(_BRCOperation *)self completedWithResult:0 error:v7];
  }
  return v4;
}

- (void)fetchNextItemToList
{
  if (![(_BRCOperation *)self finishIfCancelled])
  {
    v3 = [(BRCServerZone *)self->_serverZone clientZone];
    int v4 = [v3 serverZone];
    v5 = [v4 db];
    BOOL v6 = [v5 serialQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __65__BRCRecursiveListDirectoryContentsOperation_fetchNextItemToList__block_invoke;
    v8[3] = &unk_26507ED98;
    v8[4] = self;
    id v9 = v3;
    id v7 = v3;
    dispatch_async(v6, v8);
  }
}

void __65__BRCRecursiveListDirectoryContentsOperation_fetchNextItemToList__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _finishIfBlockedFromListing] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 40) mangledID];
    v3 = +[BRCUserDefaults defaultsForMangledID:v2];
    uint64_t v4 = [v3 recursiveListFetchDirFaultBatchSize];

    v5 = [*(id *)(a1 + 40) serverZone];
    BOOL v6 = [v5 db];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __65__BRCRecursiveListDirectoryContentsOperation_fetchNextItemToList__block_invoke_2;
    v9[3] = &unk_26507F788;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    uint64_t v12 = v4;
    [v6 performWithFlags:8 action:v9];
  }
}

uint64_t __65__BRCRecursiveListDirectoryContentsOperation_fetchNextItemToList__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) dbRowID];
  uint64_t v18 = v3;
  v5 = (void *)[v3 fetch:@"WITH RECURSIVE item_children (item_id, zone_rowid, item_type) AS(    SELECT item_id, zone_rowid, item_type FROM server_items      WHERE zone_rowid = %@ AND item_parent_id = %@ AND item_type IN (0, 9, 10) AND NOT item_id_is_documents(item_id)  UNION ALL     SELECT si.item_id, si.zone_rowid, si.item_type FROM server_items AS si INNER JOIN item_children AS p WHERE si.item_parent_id = p.item_id AND si.zone_rowid = p.zone_rowid AND si.item_type IN (0, 9, 10)) SELECT item_id FROM item_children WHERE item_type IN (9, 10)", v4, *(void *)(*(void *)(a1 + 40) + 536)];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v6 = [v5 enumerateObjectsOfClass:objc_opt_class()];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
      if ([v11 isDocumentsFolder])
      {
        v16 = brc_bread_crumbs();
        uint64_t v12 = brc_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v16;
          _os_log_fault_impl(&dword_23FA42000, v12, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !childID.isDocumentsFolder%@", buf, 0xCu);
        }
      }
      if ([*(id *)(*(void *)(a1 + 40) + 528) containsObject:v11])
      {
        v17 = brc_bread_crumbs();
        v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v17;
          _os_log_fault_impl(&dword_23FA42000, v15, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: ![self->_itemsToList containsObject:childID]%@", buf, 0xCu);
        }
      }
      if (([*(id *)(*(void *)(a1 + 40) + 552) containsObject:v11] & 1) == 0)
      {
        [*(id *)(*(void *)(a1 + 40) + 528) addObject:v11];
        if ((unint64_t)[*(id *)(*(void *)(a1 + 40) + 528) count] >= *(void *)(a1 + 48)) {
          break;
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v13 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
        uint64_t v8 = v13;
        if (v13) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  [*(id *)(a1 + 40) listNextItem];
  return 1;
}

- (void)listOrFetchNextItem
{
  if ([(NSMutableSet *)self->_itemsToList count])
  {
    [(BRCRecursiveListDirectoryContentsOperation *)self listNextItem];
  }
  else
  {
    [(BRCRecursiveListDirectoryContentsOperation *)self fetchNextItemToList];
  }
}

- (void)listNextItem
{
  if (![(_BRCOperation *)self finishIfCancelled])
  {
    id v3 = [(BRCServerZone *)self->_serverZone clientZone];
    uint64_t v4 = [v3 db];
    v5 = [v4 serialQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__BRCRecursiveListDirectoryContentsOperation_listNextItem__block_invoke;
    v7[3] = &unk_26507ED98;
    v7[4] = self;
    id v8 = v3;
    id v6 = v3;
    dispatch_async(v5, v7);
  }
}

void __58__BRCRecursiveListDirectoryContentsOperation_listNextItem__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) _finishIfBlockedFromListing] & 1) == 0)
  {
    v2 = [*(id *)(*(void *)(a1 + 32) + 528) anyObject];
    id v3 = *(id **)(a1 + 32);
    if (v2)
    {
      [v3[66] removeObject:v2];
      uint64_t v4 = brc_bread_crumbs();
      v5 = brc_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = *(void **)(a1 + 32);
        long long v19 = [v2 debugDescription];
        *(_DWORD *)buf = 138412802;
        v25 = v18;
        __int16 v26 = 2112;
        v27 = v19;
        __int16 v28 = 2112;
        v29 = v4;
        _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ listing next item %@%@", buf, 0x20u);
      }
      id v6 = [*(id *)(*(void *)(a1 + 32) + 520) clientZone];
      uint64_t v7 = objc_msgSend(v6, "fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:", v2, objc_msgSend(*(id *)(a1 + 32), "nonDiscretionary"), objc_msgSend(*(id *)(a1 + 32), "rescheduleApply"));

      uint64_t v8 = *(void *)(a1 + 32);
      if (v7)
      {
        [v7 beginObservingChangesWithDelegate:v8];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __58__BRCRecursiveListDirectoryContentsOperation_listNextItem__block_invoke_189;
        v22[3] = &unk_26507F7B0;
        v22[4] = *(void *)(a1 + 32);
        id v23 = v2;
        [v7 addPreFlushDirectoryListCompletionBlock:v22];
        id v9 = *(id *)(a1 + 32);
        objc_sync_enter(v9);
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 544), v7);
        objc_sync_exit(v9);
      }
      else
      {
        if (([v2 isEqualToItemID:*(void *)(v8 + 536)] & 1) == 0)
        {
          v15 = brc_bread_crumbs();
          v16 = brc_default_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = [v2 debugItemIDString];
            *(_DWORD *)buf = 138412546;
            v25 = v17;
            __int16 v26 = 2112;
            v27 = v15;
            _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] ItemID %@ isn't able to be listed%@", buf, 0x16u);
          }
        }
        if ([*(id *)(*(void *)(a1 + 32) + 552) containsObject:v2])
        {
          long long v20 = brc_bread_crumbs();
          long long v21 = brc_default_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
            __58__BRCRecursiveListDirectoryContentsOperation_listNextItem__block_invoke_cold_1((uint64_t)v20, v21);
          }
        }
        [*(id *)(*(void *)(a1 + 32) + 552) addObject:v2];
        [*(id *)(a1 + 32) listOrFetchNextItem];
      }
    }
    else
    {
      if ([v3 rescheduleApply])
      {
        uint64_t v10 = [BRCItemGlobalID alloc];
        uint64_t v11 = [*(id *)(a1 + 40) dbRowID];
        uint64_t v12 = [(BRCItemGlobalID *)v10 initWithZoneRowID:v11 itemID:*(void *)(*(void *)(a1 + 32) + 536)];

        uint64_t v13 = [*(id *)(a1 + 40) session];
        v14 = [v13 applyScheduler];
        [v14 rescheduleItemsRecursivelyUnderFolder:v12];
      }
      [*(id *)(a1 + 32) completedWithResult:0 error:0];
    }
  }
}

void __58__BRCRecursiveListDirectoryContentsOperation_listNextItem__block_invoke_189(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([*(id *)(a1 + 32) finishIfCancelled] & 1) == 0)
  {
    if (objc_msgSend(v3, "brc_isIgnorableListDirectoryError"))
    {
      uint64_t v4 = brc_bread_crumbs();
      v5 = brc_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v6 = [*(id *)(a1 + 32) name];
        uint64_t v7 = [*(id *)(a1 + 40) debugItemIDString];
        int v8 = 138412802;
        id v9 = v6;
        __int16 v10 = 2112;
        uint64_t v11 = v7;
        __int16 v12 = 2112;
        uint64_t v13 = v4;
        _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Continuing %@ after encountering a ignorable error for %@%@", (uint8_t *)&v8, 0x20u);
      }
      [*(id *)(*(void *)(a1 + 32) + 552) addObject:*(void *)(a1 + 40)];

      goto LABEL_8;
    }
    if (!v3)
    {
LABEL_8:
      [*(id *)(a1 + 32) listOrFetchNextItem];
      id v3 = 0;
      goto LABEL_9;
    }
    [*(id *)(a1 + 32) completedWithResult:0 error:v3];
  }
LABEL_9:
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)BRCRecursiveListDirectoryContentsOperation;
  [(_BRCOperation *)&v19 finishWithResult:a3 error:v6];
  uint64_t v7 = self;
  objc_sync_enter(v7);
  int v8 = v7->_recursiveListCompletionBlocks;
  recursiveListCompletionBlocks = v7->_recursiveListCompletionBlocks;
  v7->_recursiveListCompletionBlocks = 0;

  objc_sync_exit(v7);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  __int16 v10 = v8;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v14) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * v14));
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)main
{
  v6.receiver = self;
  v6.super_class = (Class)BRCRecursiveListDirectoryContentsOperation;
  [(BRCAutoCancelOperation *)&v6 main];
  if (![(BRCItemID *)self->_rootItemID isDocumentsFolder]
    && ![(BRCItemID *)self->_rootItemID isNonDesktopRoot])
  {
    goto LABEL_8;
  }
  id v3 = [(BRCServerZone *)self->_serverZone session];
  uint64_t v4 = [(BRCItemID *)self->_rootItemID appLibraryRowID];
  v5 = [v3 appLibraryByRowID:v4];

  if ((![(BRCItemID *)self->_rootItemID isDocumentsFolder]
     || ([v5 state] & 0x4000000) == 0)
    && (![(BRCItemID *)self->_rootItemID isNonDesktopRoot]
     || ([v5 state] & 0x2000000) == 0))
  {

LABEL_8:
    [(NSMutableSet *)self->_itemsToList addObject:self->_rootItemID];
    [(BRCRecursiveListDirectoryContentsOperation *)self listNextItem];
    return;
  }
  [(BRCRecursiveListDirectoryContentsOperation *)self fetchNextItemToList];
}

- (void)addRecursiveDirectoryListCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  recursiveListCompletionBlocks = v5->_recursiveListCompletionBlocks;
  if (recursiveListCompletionBlocks)
  {
    uint64_t v7 = (void *)MEMORY[0x2455D9A50](v4);
    [(NSMutableArray *)recursiveListCompletionBlocks addObject:v7];
  }
  else
  {
    int v8 = [(_BRCOperation *)v5 callbackQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __87__BRCRecursiveListDirectoryContentsOperation_addRecursiveDirectoryListCompletionBlock___block_invoke;
    v9[3] = &unk_26507F450;
    void v9[4] = v5;
    id v10 = v4;
    dispatch_async(v8, v9);
  }
  objc_sync_exit(v5);
}

void __87__BRCRecursiveListDirectoryContentsOperation_addRecursiveDirectoryListCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
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
  objc_storeStrong((id *)&self->_recursiveListCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_itemsFailedListing, 0);
  objc_storeStrong((id *)&self->_activeListOp, 0);
  objc_storeStrong((id *)&self->_rootItemID, 0);
  objc_storeStrong((id *)&self->_itemsToList, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
}

void __58__BRCRecursiveListDirectoryContentsOperation_listNextItem__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: ![self->_itemsFailedListing containsObject:itemID]%@", (uint8_t *)&v2, 0xCu);
}

@end