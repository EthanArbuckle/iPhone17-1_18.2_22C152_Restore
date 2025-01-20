@interface BRCFetchParentChainOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCFetchParentChainOperation)initWithParentID:(id)a3 sessionContext:(id)a4 zone:(id)a5 isUserWaiting:(BOOL)a6;
- (BRCItemID)parentIDToList;
- (id)createActivity;
- (void)_fetchParentChain:(id)a3;
- (void)addFetchParentChainCompletionBlock:(id)a3;
- (void)cancelToBeReplacedByOperation:(id)a3;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
@end

@implementation BRCFetchParentChainOperation

- (BRCItemID)parentIDToList
{
  parentRecordID = self->_parentRecordID;
  v3 = [(BRCServerZone *)self->_serverZone session];
  v4 = [(CKRecordID *)parentRecordID brc_itemIDWithSession:v3];

  return (BRCItemID *)v4;
}

- (BRCFetchParentChainOperation)initWithParentID:(id)a3 sessionContext:(id)a4 zone:(id)a5 isUserWaiting:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a5;
  id v13 = a4;
  v14 = [v11 debugItemIDString];
  v15 = [@"fetch-parent/" stringByAppendingString:v14];

  v16 = [v12 metadataSyncContext];
  v24.receiver = self;
  v24.super_class = (Class)BRCFetchParentChainOperation;
  v17 = [(_BRCOperation *)&v24 initWithName:v15 syncContext:v16 sessionContext:v13];

  if (v17)
  {
    v18 = objc_msgSend(MEMORY[0x263EFD780], "br_fetchParentChain");
    [(_BRCOperation *)v17 setGroup:v18];

    [(_BRCOperation *)v17 setNonDiscretionary:v6];
    uint64_t v19 = objc_opt_new();
    fetchParentChainCompletionBlocks = v17->_fetchParentChainCompletionBlocks;
    v17->_fetchParentChainCompletionBlocks = (NSMutableArray *)v19;

    objc_storeStrong((id *)&v17->_parentID, a3);
    uint64_t v21 = [v11 directoryStructureRecordIDInZone:v12];
    parentRecordID = v17->_parentRecordID;
    v17->_parentRecordID = (CKRecordID *)v21;

    objc_storeStrong((id *)&v17->_serverZone, a5);
  }

  return v17;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sync/fetch-parent-chain", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_fetchParentChain:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend(v4, "brc_isZoneRootRecordID") & 1) != 0
    || objc_msgSend(v4, "brc_isAppLibraryRootRecordID"))
  {
    v5 = brc_bread_crumbs();
    BOOL v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCFetchParentChainOperation _fetchParentChain:]((uint64_t)v5, v6);
    }

    [(_BRCOperation *)self completedWithResult:0 error:0];
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x263F325E0]);
    v8 = [v4 zoneID];
    v9 = (void *)[v7 initWithRecordZoneID:v8];

    v10 = +[BRCUserDefaults defaultsForMangledID:v9];
    uint64_t v11 = [v10 fetchShareRecordsInline];

    id v12 = [[BRCFetchRecordSubResourcesOperation alloc] initAndScheduleWithServerZone:self->_serverZone parentOperation:self pendingChangesStream:0 contentRecordsFetchedInline:1 sessionContext:self->super._sessionContext];
    id v13 = objc_alloc(MEMORY[0x263EFD820]);
    v14 = (void *)[v13 initWithRecordID:v4 action:*MEMORY[0x263EFD528]];
    v15 = (void *)MEMORY[0x263F08A98];
    v16 = [NSNumber numberWithBool:v11];
    v17 = [v15 predicateWithFormat:@"%K == %@ AND %K == %@", @"recordIds", v14, @"getShareRecords", v16];

    v18 = (void *)[objc_alloc(MEMORY[0x263EFD7B0]) initWithRecordType:@"FetchAncestors" predicate:v17];
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263EFD7C0]) initWithQuery:v18];
    v20 = [v4 zoneID];
    [v19 setZoneID:v20];

    uint64_t v21 = +[BRCUserDefaults defaultsForMangledID:0];
    objc_msgSend(v19, "setResultsLimit:", objc_msgSend(v21, "maxRecordCountInFetchRecordsOperation"));

    [v19 setFetchAllResults:1];
    [v19 setShouldFetchAssetContent:0];
    v22 = [v12 callbackQueue];
    [v19 setCallbackQueue:v22];

    v23 = [MEMORY[0x263EFD7C8] desiredKeysWithMask:185];
    [v19 setDesiredKeys:v23];

    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __50__BRCFetchParentChainOperation__fetchParentChain___block_invoke;
    v29[3] = &unk_26507F4C8;
    id v24 = v12;
    id v30 = v24;
    [v19 setRecordFetchedBlock:v29];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __50__BRCFetchParentChainOperation__fetchParentChain___block_invoke_2;
    v26[3] = &unk_26507F738;
    id v27 = v24;
    v28 = self;
    id v25 = v24;
    [v19 setQueryCompletionBlock:v26];
    [(_BRCOperation *)self addSubOperation:v19];
  }
}

uint64_t __50__BRCFetchParentChainOperation__fetchParentChain___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addRecord:a2];
}

void __50__BRCFetchParentChainOperation__fetchParentChain___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    [v7 cancel];
    [*(id *)(a1 + 40) completedWithResult:0 error:v6];
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __50__BRCFetchParentChainOperation__fetchParentChain___block_invoke_3;
    v10[3] = &unk_26507EDC0;
    id v8 = v7;
    uint64_t v9 = *(void *)(a1 + 40);
    id v11 = v8;
    uint64_t v12 = v9;
    id v13 = v5;
    [v8 notifyWhenRecordsAreFetchedAndFinish:v10];
  }
}

void __50__BRCFetchParentChainOperation__fetchParentChain___block_invoke_3(uint64_t a1)
{
  os_activity_t v2 = [*(id *)(a1 + 32) error];

  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    id v9 = [*(id *)(a1 + 32) error];
    [v3 completedWithResult:0 error:v9];
  }
  else
  {
    int v4 = [*(id *)(a1 + 32) saveRecordsWithQueryCursor:*(void *)(a1 + 48)];
    *(void *)(*(void *)(a1 + 40) + 504) = [*(id *)(a1 + 32) recordsFetched];
    *(void *)(*(void *)(a1 + 40) + 512) = [*(id *)(a1 + 32) recordsFetchedTotalMetadataSize];
    *(void *)(*(void *)(a1 + 40) + 520) = [*(id *)(a1 + 32) xattrsFetchedTotalSize];
    id v5 = *(void **)(a1 + 40);
    if (v4)
    {
      [v5 completedWithResult:0 error:0];
    }
    else
    {
      id v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        __50__BRCFetchParentChainOperation__fetchParentChain___block_invoke_3_cold_1((uint64_t)v6, v7);
      }

      id v8 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: Couldn't allocate ranks when fetching parent chain");
      [v5 completedWithResult:0 error:v8];
    }
  }
}

- (void)main
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 528);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_23FA42000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Fetching parent chain of %@%@", (uint8_t *)&v4, 0x16u);
}

void __36__BRCFetchParentChainOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 528);
  int v4 = [*(id *)(v2 + 248) session];
  objc_msgSend(v3, "brc_itemIDWithSession:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = [*(id *)(a1 + 40) serverItemByItemID:v7];
  __int16 v6 = *(void **)(a1 + 32);
  if (v5) {
    [v6 completedWithResult:0 error:0];
  }
  else {
    [v6 _fetchParentChain:v6[66]];
  }
}

- (void)addFetchParentChainCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  fetchParentChainCompletionBlocks = v5->_fetchParentChainCompletionBlocks;
  if (fetchParentChainCompletionBlocks)
  {
    id v7 = (void *)MEMORY[0x2455D9A50](v4);
    [(NSMutableArray *)fetchParentChainCompletionBlocks addObject:v7];
  }
  else
  {
    uint64_t v8 = [(_BRCOperation *)v5 callbackQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __67__BRCFetchParentChainOperation_addFetchParentChainCompletionBlock___block_invoke;
    v9[3] = &unk_26507F450;
    v9[4] = v5;
    id v10 = v4;
    dispatch_async(v8, v9);
  }
  objc_sync_exit(v5);
}

void __67__BRCFetchParentChainOperation_addFetchParentChainCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)BRCFetchParentChainOperation;
  [(_BRCOperation *)&v24 finishWithResult:a3 error:v6];
  if (!v6 && [(_BRCOperation *)self nonDiscretionary])
  {
    id v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCFetchParentChainOperation finishWithResult:error:]((uint64_t)self, (uint64_t)v7, v8);
    }

    [(_BRCOperation *)self executionTimeInSec];
    id v9 = +[AppTelemetryTimeSeriesEvent newQBSOperationPrformanceEventWithTime:type:recordsFetched:recordsFetchedTotalMetadataSize:xattrsFetchedTotalSize:](AppTelemetryTimeSeriesEvent, "newQBSOperationPrformanceEventWithTime:type:recordsFetched:recordsFetchedTotalMetadataSize:xattrsFetchedTotalSize:", @"BRCFetchParentChainOperation", self->_recordsFetched, self->_recordsFetchedTotalMetadataSize, self->_xattrsFetchedTotalSize);
    id v10 = [(BRCServerZone *)self->_serverZone session];
    id v11 = [v10 analyticsReporter];
    [v11 postReportForDefaultSubCategoryWithCategory:11 telemetryTimeEvent:v9];
  }
  uint64_t v12 = self;
  objc_sync_enter(v12);
  id v13 = v12->_fetchParentChainCompletionBlocks;
  fetchParentChainCompletionBlocks = v12->_fetchParentChainCompletionBlocks;
  v12->_fetchParentChainCompletionBlocks = 0;

  objc_sync_exit(v12);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v15 = v13;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * v19) + 16))(*(void *)(*((void *)&v20 + 1) + 8 * v19));
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v17);
  }
}

- (void)cancelToBeReplacedByOperation:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v29 = self;
    __int16 v30 = 2112;
    id v31 = v4;
    __int16 v32 = 2112;
    v33 = v5;
    _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling %@ to be replaced by %@%@", buf, 0x20u);
  }

  if (v4)
  {
    id v7 = self;
    objc_sync_enter(v7);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v8 = [(BRCFetchParentChainOperation *)v7 dependencies];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v23;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v8);
          }
          [v4 addDependency:*(void *)(*((void *)&v22 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v9);
    }

    uint64_t v12 = v7->_fetchParentChainCompletionBlocks;
    fetchParentChainCompletionBlocks = v7->_fetchParentChainCompletionBlocks;
    v7->_fetchParentChainCompletionBlocks = 0;

    objc_sync_exit(v7);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v14 = v12;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(v4, "addFetchParentChainCompletionBlock:", *(void *)(*((void *)&v18 + 1) + 8 * v17++), (void)v18);
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v15);
    }

    [(_BRCOperation *)v7 cancel];
    if ([(_BRCOperation *)v7 isExecuting]) {
      [v4 addDependency:v7];
    }
  }
  else
  {
    [(_BRCOperation *)self cancel];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchParentChainCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_parentID, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_parentRecordID, 0);
}

- (void)_fetchParentChain:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23FA42000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] found zone root record ID%@", (uint8_t *)&v2, 0xCu);
}

void __50__BRCFetchParentChainOperation__fetchParentChain___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't allocate ranks when fetching parent chain%@", (uint8_t *)&v2, 0xCu);
}

- (void)finishWithResult:(NSObject *)a3 error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = [*(id *)(a1 + 528) debugDescription];
  [(id)a1 executionTimeInSec];
  uint64_t v7 = *(void *)(a1 + 504);
  uint64_t v8 = *(void *)(a1 + 512);
  uint64_t v9 = *(void *)(a1 + 520);
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
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Fetch parent chain of %@ took [%f] Secs and fetched [%llu,%llu] records [%llu] xattrs%@", (uint8_t *)&v11, 0x3Eu);
}

@end