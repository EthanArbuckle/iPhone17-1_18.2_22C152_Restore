@interface BRCPCSChainingOperation
- (BOOL)canSyncDownBeforeRetry;
- (BOOL)shouldFillBatch;
- (BOOL)shouldRetryForError:(id)a3;
- (BRCPCSChainingOperation)initWithRootItem:(id)a3 appLibrary:(id)a4 sessionContext:(id)a5 syncUpCallback:(id)a6;
- (id)createActivity;
- (id)pcsChainCompletionBlock;
- (void)_buildRecordListWithCompletion:(id)a3;
- (void)_chainRecords;
- (void)_sendRecordBatch:(id)a3 completion:(id)a4;
- (void)_sendRecordBatch:(id)a3 recursed:(BOOL)a4 completion:(id)a5;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4;
- (void)main;
- (void)setCanSyncDownBeforeRetry:(BOOL)a3;
- (void)setPcsChainCompletionBlock:(id)a3;
- (void)setShouldFillBatch:(BOOL)a3;
@end

@implementation BRCPCSChainingOperation

- (BRCPCSChainingOperation)initWithRootItem:(id)a3 appLibrary:(id)a4 sessionContext:(id)a5 syncUpCallback:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v25 = a6;
  id v13 = a5;
  v14 = [v11 itemID];
  v15 = [v14 debugItemIDString];
  v16 = [@"pcs-chain/" stringByAppendingString:v15];

  if (!v11)
  {
    v23 = brc_bread_crumbs();
    v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[BRCPCSChainingOperation initWithRootItem:appLibrary:sessionContext:syncUpCallback:]();
    }
  }
  v17 = [v11 serverZone];
  v18 = [v17 metadataSyncContext];
  v26.receiver = self;
  v26.super_class = (Class)BRCPCSChainingOperation;
  v19 = [(_BRCOperation *)&v26 initWithName:v16 syncContext:v18 sessionContext:v13];

  if (v19)
  {
    objc_storeStrong((id *)&v19->_appLibrary, a4);
    objc_storeStrong((id *)&v19->_rootItem, a3);
    v20 = [v12 mangledID];
    v21 = +[BRCUserDefaults defaultsForMangledID:v20];
    v19->_batchSize = [v21 pcsChainingBatchSize];

    objc_storeStrong((id *)&v19->_syncUpCallback, a6);
  }

  return v19;
}

- (BOOL)shouldRetryForError:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "brc_isUserInitiatedRetriable"))
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = [(BRCServerItem *)self->_rootItem serverZone];
    v7 = [v6 clientZone];

    if (objc_msgSend(v4, "brc_isRetriableForPCSChaining")
      && self->_tryCount <= 2
      && ([v7 isSyncBlocked] & 1) == 0)
    {
      BOOL v5 = 1;
      if (self->_canSyncDownBeforeRetry) {
        self->_syncDownBeforeRetry = 1;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  return v5;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sync/pcs-chain", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listOperation);
  pcsChainCompletionBlock = (void (**)(id, uint64_t, id, unint64_t, id))self->_pcsChainCompletionBlock;
  if (pcsChainCompletionBlock)
  {
    pcsChainCompletionBlock[2](pcsChainCompletionBlock, [v6 BOOLValue], WeakRetained, self->_chainedRecordsCount, v7);
    id v10 = self->_pcsChainCompletionBlock;
    self->_pcsChainCompletionBlock = 0;
  }
  [WeakRetained endObservingChangesWithDelegate:self];
  objc_storeWeak((id *)&self->_listOperation, 0);
  v11.receiver = self;
  v11.super_class = (Class)BRCPCSChainingOperation;
  [(_BRCOperation *)&v11 finishWithResult:v6 error:v7];
}

- (void)listOperation:(id)a3 wasReplacedByOperation:(id)a4
{
  id obj = a4;
  p_listOperation = &self->_listOperation;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_listOperation);

  if (WeakRetained == v7) {
    objc_storeWeak((id *)p_listOperation, obj);
  }
}

- (void)_buildRecordListWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BRCServerItem *)self->_rootItem itemID];
  if ([v5 isDocumentsFolder]) {
    goto LABEL_4;
  }
  id v6 = [(BRCServerItem *)self->_rootItem itemID];
  if ([v6 isNonDesktopRoot])
  {

LABEL_4:
    goto LABEL_5;
  }
  id v10 = [(BRCServerItem *)self->_rootItem st];
  objc_super v11 = [v10 logicalName];
  char v12 = [v11 isEqualToString:@".Trash"];

  if ((v12 & 1) == 0)
  {
    id v13 = [(BRCAppLibrary *)self->_appLibrary session];
    v14 = [v13 clientTruthWorkloop];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __58__BRCPCSChainingOperation__buildRecordListWithCompletion___block_invoke;
    v15[3] = &unk_26507F850;
    v15[4] = self;
    id v16 = v4;
    dispatch_async(v14, v15);

    goto LABEL_8;
  }
LABEL_5:
  id v7 = brc_bread_crumbs();
  v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
    -[BRCPCSChainingOperation _buildRecordListWithCompletion:]();
  }

  v9 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: Can't PCS chain to documents, trash, or root");
  (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);

LABEL_8:
}

void __58__BRCPCSChainingOperation__buildRecordListWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 512);
  if (!v2)
  {
    objc_super v26 = brc_bread_crumbs();
    v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      __58__BRCPCSChainingOperation__buildRecordListWithCompletion___block_invoke_cold_3();
    }
  }
  if (([v2 pcsChainState] & 0xFFFFFFFE) != 2)
  {
    BOOL v5 = [[BRCPCSChainBatchInfo alloc] initWithAppLibrary:*(void *)(*(void *)(a1 + 32) + 504)];
    int v6 = [v2 isDocument];
    v32 = [BRCPCSChainInfo alloc];
    id v7 = [v2 itemID];
    v8 = [v2 parentItemIDOnServer];
    v34 = [v2 st];
    v9 = [v34 ckInfo];
    int v33 = v6;
    if (v6)
    {
      v31 = [v2 latestVersion];
      id v10 = [v31 ckInfo];
    }
    else
    {
      id v10 = 0;
    }
    objc_super v11 = [v2 st];
    uint64_t v12 = [v11 type];
    if ([v2 isBRAlias]) {
      uint64_t v13 = [v2 aliasTargetIsShared];
    }
    else {
      uint64_t v13 = 1;
    }
    LODWORD(v30) = [v2 pcsChainState];
    v14 = [(BRCPCSChainInfo *)v32 initWithItemID:v7 parentID:v8 structuralCKInfo:v9 contentCKInfo:v10 itemType:v12 aliasTargetZoneIsShared:v13 chainState:v30];

    if (v33)
    {

      [(BRCPCSChainBatchInfo *)v5 addFullyChainedRecordInfo:v14];
      *(unsigned char *)(*(void *)(a1 + 32) + 520) = 1;
    }
    else
    {

      v15 = [BRCPCSChainEnumerator alloc];
      id v16 = [*(id *)(*(void *)(a1 + 32) + 504) defaultClientZone];
      v17 = v14;
      v18 = [(BRCPCSChainEnumerator *)v15 initWithPCSChainInfo:v14 clientZone:v16];

      if ([(BRCPCSChainBatchInfo *)v5 batchCount] >= *(void *)(*(void *)(a1 + 32) + 528))
      {
        v20 = 0;
      }
      else
      {
        v19 = 0;
        do
        {
          v20 = [(BRCPCSChainEnumerator *)v18 nextObject];

          if (!v20) {
            break;
          }
          [(BRCPCSChainBatchInfo *)v5 addFullyChainedRecordInfo:v20];
          v19 = v20;
        }
        while ([(BRCPCSChainBatchInfo *)v5 batchCount] < *(void *)(*(void *)(a1 + 32) + 528));
      }
      uint64_t v21 = [(BRCPCSChainEnumerator *)v18 error];
      if (v21)
      {
        v22 = (void *)v21;
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

        v14 = v17;
LABEL_30:

        goto LABEL_31;
      }
      if (!v20)
      {
        v23 = [(BRCPCSChainEnumerator *)v18 itemIDNeedingListing];
        if (v23)
        {
          v24 = [v2 clientZone];
          id v25 = objc_msgSend(v24, "fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:", v23, objc_msgSend(*(id *)(a1 + 32), "nonDiscretionary"), 0);

          [v25 beginObservingChangesWithDelegate:*(void *)(a1 + 32)];
          objc_storeWeak((id *)(*(void *)(a1 + 32) + 552), v25);
          if (!v25)
          {
            v28 = brc_bread_crumbs();
            v29 = brc_default_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
              __58__BRCPCSChainingOperation__buildRecordListWithCompletion___block_invoke_cold_2();
            }
          }
        }
        else
        {
          *(unsigned char *)(*(void *)(a1 + 32) + 520) = 1;
        }
      }
      v14 = v17;
    }
    [(BRCPCSChainBatchInfo *)v5 prepareFirstPhaseRecordBatch];
    *(void *)(*(void *)(a1 + 32) + 544) = [(BRCPCSChainBatchInfo *)v5 chainedRecordsCount];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_30;
  }
  v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __58__BRCPCSChainingOperation__buildRecordListWithCompletion___block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 520) = 1;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_31:
}

- (void)_sendRecordBatch:(id)a3 completion:(id)a4
{
}

- (void)_sendRecordBatch:(id)a3 recursed:(BOOL)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v20 = a5;
  v19 = v8;
  if ([v8 count])
  {
    BOOL v18 = a4;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v31;
      uint64_t v12 = MEMORY[0x263EFFA88];
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v30 + 1) + 8 * v13);
          v36 = @"br_pcsChainingUpdate";
          uint64_t v37 = v12;
          v15 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          [v14 setPluginFields:v15];

          ++v13;
        }
        while (v10 != v13);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v10);
    }

    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__36;
    v28[4] = __Block_byref_object_dispose__36;
    id v29 = 0;
    id v16 = (void *)[objc_alloc(MEMORY[0x263EFD748]) initWithRecordsToSave:v9 recordIDsToDelete:0];
    [v16 setSavePolicy:0];
    [v16 setAtomic:1];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke_188;
    v24[3] = &unk_265084798;
    BOOL v27 = v18;
    v24[4] = self;
    objc_super v26 = v28;
    id v25 = v9;
    [v16 setPerRecordCompletionBlock:v24];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke_191;
    v21[3] = &unk_2650847C0;
    v23 = v28;
    v21[4] = self;
    id v22 = v20;
    [v16 setModifyRecordsCompletionBlock:v21];
    [(_BRCOperation *)self addSubOperation:v16];

    _Block_object_dispose(v28, 8);
  }
  else
  {
    v17 = [(_BRCOperation *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke;
    block[3] = &unk_265080B88;
    id v35 = v20;
    dispatch_async(v17, block);
  }
}

uint64_t __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke_188(uint64_t a1, void *a2, void *a3)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 504) defaultClientZone];
  id v8 = [v7 db];
  id v9 = [v8 serialQueue];
  dispatch_assert_queue_not_V2(v9);

  id v58 = 0;
  LODWORD(v9) = objc_msgSend(v6, "brc_isCloudKitErrorReparentedToNewParent:", &v58);
  id v10 = v58;
  uint64_t v11 = v10;
  if (v9 && !*(unsigned char *)(a1 + 56) && v10)
  {
    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v12)
    {
      uint64_t v13 = [*(id *)(a1 + 40) mutableCopy];
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v16 = v12;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v54 objects:v65 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      v47 = v7;
      id v48 = v6;
      v49 = v11;
      uint64_t v19 = *(void *)v55;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v55 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          id v22 = [v21 recordID];
          v23 = [v5 recordID];
          int v24 = [v22 isEqual:v23];

          if (v24)
          {
            long long v31 = brc_bread_crumbs();
            long long v32 = brc_default_log();
            long long v33 = v49;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v60 = v21;
              __int16 v61 = 2112;
              id v62 = v49;
              __int16 v63 = 2112;
              id v64 = v31;
              _os_log_impl(&dword_23FA42000, v32, OS_LOG_TYPE_DEFAULT, "[WARNING] Got an error indicating we need to reparent %@ to %@%@", buf, 0x20u);
            }

            id v7 = v47;
            v34 = [v47 serverZone];
            id v6 = v48;
            if (([v49 hasPrefix:@"directory/"] & 1) == 0)
            {
              v43 = brc_bread_crumbs();
              v44 = brc_default_log();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
                __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke_188_cold_1();
              }

              long long v33 = v49;
            }
            uint64_t v35 = [v33 substringFromIndex:objc_msgSend(@"directory/", "length")];
            v45 = [BRCItemID alloc];
            v36 = [*(id *)(*(void *)(a1 + 32) + 504) dbRowID];
            [v34 dbRowID];
            v38 = uint64_t v37 = v34;
            v46 = (void *)v35;
            uint64_t v39 = [(BRCItemID *)v45 initWithString:v35 libraryRowID:v36 sharedZoneRowID:v38];

            v40 = [(BRCItemID *)v39 validatingDirectoryReferenceInZone:v37];
            v41 = [v21 parent];

            if (v41)
            {
              v42 = [(BRCItemID *)v39 pcsChainParentReferenceInZone:v37];
              [v21 setParent:v42];
            }
            [v21 setObject:v40 forKeyedSubscript:@"parent"];

            goto LABEL_28;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v54 objects:v65 count:16];
        if (v18) {
          continue;
        }
        break;
      }
      id v7 = v47;
      id v6 = v48;
LABEL_28:
      uint64_t v11 = v49;
    }
    goto LABEL_29;
  }
  if (objc_msgSend(v6, "brc_isIndividualItemBlacklistError"))
  {
    id v25 = [v7 db];
    objc_super v26 = [v25 serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke_189;
    block[3] = &unk_26507EDC0;
    id v27 = v7;
    uint64_t v28 = *(void *)(a1 + 32);
    id v51 = v27;
    uint64_t v52 = v28;
    id v53 = v5;
    dispatch_sync(v26, block);

    id v16 = v51;
LABEL_29:

    goto LABEL_30;
  }
  if (v6 && (objc_msgSend(v6, "brc_isCloudKitAtomicFailure") & 1) == 0)
  {
    brc_bread_crumbs();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      long long v30 = objc_msgSend(v6, "brc_telemetryReportableErrorWithRecordName:", 0);
      *(_DWORD *)buf = 138412802;
      v60 = v30;
      __int16 v61 = 2112;
      id v62 = v5;
      __int16 v63 = 2112;
      id v64 = v16;
      _os_log_impl(&dword_23FA42000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] Encountered pcs chaining error %@ for record %@%@", buf, 0x20u);
    }
    goto LABEL_29;
  }
LABEL_30:
}

void __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke_189(void *a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = (void *)a1[4];
  v3 = [*(id *)(a1[5] + 512) itemID];
  id v4 = [v2 itemByItemID:v3];

  if (([v4 localDiffs] & 0x20) != 0 && objc_msgSend(v4, "needsSyncUp"))
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    {
      uint64_t v10 = a1[6];
      int v11 = 138412802;
      uint64_t v12 = v4;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_error_impl(&dword_23FA42000, v6, (os_log_type_t)0x90u, "[ERROR] Blocking %@ from sync up until it is next modified because the server failed to pcs chain %@ with a permanent error%@", (uint8_t *)&v11, 0x20u);
    }

    id v7 = (void *)a1[4];
    id v8 = *(void **)(a1[5] + 560);
    id v9 = [v7 dbRowID];
    [v8 blockSyncUpCallback:v4 inZone:v9];
  }
}

uint64_t __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke_191(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v2 = brc_bread_crumbs();
    v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v7 = 138412546;
      uint64_t v8 = v4;
      __int16 v9 = 2112;
      uint64_t v10 = v2;
      _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] Retrying with new record batch because we were told about a new parent - %@%@", (uint8_t *)&v7, 0x16u);
    }

    return [*(id *)(a1 + 32) _sendRecordBatch:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) recursed:1 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v6();
  }
}

- (void)_chainRecords
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __40__BRCPCSChainingOperation__chainRecords__block_invoke;
  v2[3] = &unk_265084810;
  v2[4] = self;
  [(BRCPCSChainingOperation *)self _buildRecordListWithCompletion:v2];
}

void __40__BRCPCSChainingOperation__chainRecords__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      __40__BRCPCSChainingOperation__chainRecords__block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) completedWithResult:0 error:v6];
  }
  else
  {
    __int16 v9 = *(unsigned __int8 **)(a1 + 32);
    if (v5)
    {
      uint64_t v10 = [v5 recordsForFirstPhase];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __40__BRCPCSChainingOperation__chainRecords__block_invoke_194;
      v12[3] = &unk_2650847E8;
      v12[4] = *(void *)(a1 + 32);
      id v13 = v5;
      [v9 _sendRecordBatch:v10 completion:v12];
    }
    else
    {
      uint64_t v11 = [NSNumber numberWithBool:v9[520]];
      [v9 completedWithResult:v11 error:0];
    }
  }
}

void __40__BRCPCSChainingOperation__chainRecords__block_invoke_194(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
      __40__BRCPCSChainingOperation__chainRecords__block_invoke_194_cold_1();
    }

    [*(id *)(a1 + 32) completedWithResult:0 error:v5];
  }
  else
  {
    [*(id *)(a1 + 40) chainPreparedRecordBatch:a2];
    uint64_t v8 = *(void **)(a1 + 32);
    __int16 v9 = [*(id *)(a1 + 40) recordsForSecondPhase];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __40__BRCPCSChainingOperation__chainRecords__block_invoke_195;
    v11[3] = &unk_2650847E8;
    uint64_t v10 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v10;
    [v8 _sendRecordBatch:v9 completion:v11];
  }
}

void __40__BRCPCSChainingOperation__chainRecords__block_invoke_195(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    brc_bread_crumbs();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      __40__BRCPCSChainingOperation__chainRecords__block_invoke_195_cold_1();
    }
  }
  else
  {
    __int16 v9 = [*(id *)(*(void *)(a1 + 32) + 504) defaultClientZone];
    uint64_t v10 = [v9 serverZone];

    uint64_t v11 = [*(id *)(a1 + 40) halfChainedRecordMap];
    id v12 = [v10 db];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __40__BRCPCSChainingOperation__chainRecords__block_invoke_196;
    v22[3] = &unk_265082B90;
    id v23 = *(id *)(a1 + 40);
    id v13 = v11;
    id v24 = v13;
    id v25 = v10;
    uint64_t v26 = *(void *)(a1 + 32);
    id v14 = v5;
    id v27 = v14;
    id v7 = v10;
    [v12 performWithFlags:25 action:v22];

    __int16 v15 = [*(id *)(*(void *)(a1 + 32) + 504) db];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __40__BRCPCSChainingOperation__chainRecords__block_invoke_204;
    v18[3] = &unk_265083AD8;
    v18[4] = *(void *)(a1 + 32);
    id v19 = v14;
    id v20 = v13;
    id v21 = *(id *)(a1 + 40);
    uint64_t v8 = v13;
    [v15 performWithFlags:5 action:v18];
  }
  id v16 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v17 = [NSNumber numberWithBool:v16[520]];
  [v16 completedWithResult:v17 error:v6];
}

uint64_t __40__BRCPCSChainingOperation__chainRecords__block_invoke_196(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) should2PhasePCSChain])
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = [*(id *)(a1 + 40) objectEnumerator];
    uint64_t v2 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v61 != v4) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          id v7 = [v6 record];
          uint64_t v8 = brc_bread_crumbs();
          __int16 v9 = brc_default_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = [v7 recordID];
            *(_DWORD *)buf = 138412546;
            uint64_t v66 = v10;
            __int16 v67 = 2112;
            v68 = v8;
            _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Learning etag in the server truth for half chained parent %@%@", buf, 0x16u);
          }
          uint64_t v11 = [[BRFieldCKInfo alloc] initWithRecord:v7];
          id v12 = [v7 recordID];
          id v13 = [*(id *)(a1 + 48) session];
          id v14 = objc_msgSend(v12, "brc_itemIDWithSession:", v13);

          __int16 v15 = [*(id *)(a1 + 48) db];
          id v16 = [*(id *)(a1 + 48) dbRowID];
          uint64_t v17 = [v6 ckInfo];
          [v15 execute:@"UPDATE server_items SET item_stat_ckinfo = %@, pcs_state = 4 WHERE item_id = %@ AND zone_rowid = %@ AND item_stat_ckinfo = %@", v11, v14, v16, v17];

          uint64_t v18 = [*(id *)(a1 + 48) db];
          uint64_t v19 = [v18 changes];

          if (!v19)
          {
            id v20 = brc_bread_crumbs();
            id v21 = brc_default_log();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v66 = v20;
              _os_log_impl(&dword_23FA42000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Uh oh... the record changed server side while we were mid pcs chain batch.  We might have oplock conflicts%@", buf, 0xCu);
            }
          }
          id v22 = [*(id *)(*(void *)(a1 + 56) + 512) itemID];
          int v23 = [v22 isEqualToItemID:v14];

          if (v23)
          {
            id v24 = [*(id *)(*(void *)(a1 + 56) + 512) st];
            [v24 setCkInfo:v11];
          }
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
      }
      while (v3);
    }
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obja = *(id *)(a1 + 64);
  uint64_t v25 = [obja countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v57;
    uint64_t v28 = @"UPDATE server_items SET pcs_state = 3 WHERE item_id = %@ AND zone_rowid = %@ AND pcs_state != 2";
    do
    {
      uint64_t v29 = 0;
      uint64_t v53 = v26;
      do
      {
        if (*(void *)v57 != v27) {
          objc_enumerationMutation(obja);
        }
        long long v30 = *(void **)(*((void *)&v56 + 1) + 8 * v29);
        long long v31 = [v30 recordID];
        long long v32 = [*(id *)(a1 + 48) session];
        long long v33 = objc_msgSend(v31, "brc_itemIDWithSession:", v32);

        if (([*(id *)(a1 + 32) should2PhasePCSChain] & 1) != 0
          || (v34 = *(void **)(a1 + 40),
              [v30 recordID],
              uint64_t v35 = objc_claimAutoreleasedReturnValue(),
              [v34 objectForKeyedSubscript:v35],
              v36 = objc_claimAutoreleasedReturnValue(),
              v35,
              !v36))
        {
          v46 = [v30 parent];

          if (!v46)
          {
            v47 = brc_bread_crumbs();
            id v48 = brc_default_log();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v66 = v47;
              _os_log_fault_impl(&dword_23FA42000, v48, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: record.parent%@", buf, 0xCu);
            }
          }
          v36 = [*(id *)(a1 + 48) db];
          v40 = [*(id *)(a1 + 48) dbRowID];
          objc_msgSend(v36, "execute:", v28, v33, v40);
        }
        else
        {
          uint64_t v37 = v27;
          v38 = v28;
          uint64_t v39 = [v30 parent];

          if (v39)
          {
            v49 = brc_bread_crumbs();
            v50 = brc_default_log();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v66 = v49;
              _os_log_fault_impl(&dword_23FA42000, v50, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !record.parent%@", buf, 0xCu);
            }
          }
          v40 = [[BRFieldCKInfo alloc] initWithRecord:v30];
          v41 = [*(id *)(a1 + 48) db];
          v42 = [*(id *)(a1 + 48) dbRowID];
          v43 = [v36 ckInfo];
          [v41 execute:@"UPDATE server_items SET item_stat_ckinfo = %@, pcs_state = 4 WHERE item_id = %@ AND zone_rowid = %@ AND item_stat_ckinfo = %@", v40, v33, v42, v43];

          v44 = [*(id *)(*(void *)(a1 + 56) + 512) itemID];
          LODWORD(v43) = [v44 isEqualToItemID:v33];

          if (v43)
          {
            v45 = [*(id *)(*(void *)(a1 + 56) + 512) st];
            [v45 setCkInfo:v40];
          }
          uint64_t v28 = v38;
          uint64_t v27 = v37;
          uint64_t v26 = v53;
        }

        ++v29;
      }
      while (v26 != v29);
      uint64_t v51 = [obja countByEnumeratingWithState:&v56 objects:v64 count:16];
      uint64_t v26 = v51;
    }
    while (v51);
  }

  return 1;
}

uint64_t __40__BRCPCSChainingOperation__chainRecords__block_invoke_204(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 504) defaultClientZone];
  [v2 learnCKInfosFromSavedRecords:*(void *)(a1 + 40) isOutOfBandModifyRecords:1];

  if ([*(id *)(a1 + 48) count] && objc_msgSend(*(id *)(a1 + 56), "should2PhasePCSChain"))
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 48), "objectEnumerator", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          __int16 v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) record];
          [v3 addObject:v9];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 504) defaultClientZone];
    [v10 learnCKInfosFromSavedRecords:v3 isOutOfBandModifyRecords:1];
  }
  return 1;
}

- (void)main
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  ++self->_tryCount;
  self->_completed = 0;
  if (self->_canSyncDownBeforeRetry && self->_syncDownBeforeRetry)
  {
    uint64_t v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v9 = self;
      __int16 v10 = 2112;
      uint64_t v11 = v3;
      _os_log_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Syncing down before retrying %@%@", buf, 0x16u);
    }

    uint64_t v5 = [(BRCAppLibrary *)self->_appLibrary session];
    uint64_t v6 = [v5 clientTruthWorkloop];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __31__BRCPCSChainingOperation_main__block_invoke;
    block[3] = &unk_26507ED70;
    void block[4] = self;
    dispatch_async(v6, block);
  }
  else
  {
    [(BRCPCSChainingOperation *)self _chainRecords];
  }
}

void __31__BRCPCSChainingOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 512) clientZone];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__BRCPCSChainingOperation_main__block_invoke_2;
  v4[3] = &unk_265084838;
  v4[4] = *(void *)(a1 + 32);
  uint64_t v3 = objc_opt_new();
  [v2 performBlock:v4 whenSyncDownCompletesLookingForItemID:v3];
}

void __31__BRCPCSChainingOperation_main__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 504) session];
  uint64_t v3 = [v2 clientTruthWorkloop];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__BRCPCSChainingOperation_main__block_invoke_3;
  block[3] = &unk_26507ED70;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v3, block);
}

void __31__BRCPCSChainingOperation_main__block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 512) clientZone];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 512) itemID];
  uint64_t v4 = [v2 itemByItemID:v3];

  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 512) clientZone];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 512) itemID];
  uint64_t v7 = [v5 serverItemByItemID:v6];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 512), v7);
    [*(id *)(*(void *)(a1 + 32) + 512) overrideCKInfoIfNecessaryForOutOfBandSyncOpWithLocalItem:v4];
    uint64_t v8 = brc_bread_crumbs();
    __int16 v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      __int16 v10 = *(void **)(*(void *)(a1 + 32) + 512);
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      long long v14 = v8;
      _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Refreshed root item from db %@%@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = brc_bread_crumbs();
    __int16 v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      uint64_t v12 = v8;
      _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't refresh item from the database%@", (uint8_t *)&v11, 0xCu);
    }
  }

  [*(id *)(a1 + 32) _chainRecords];
}

- (id)pcsChainCompletionBlock
{
  return self->_pcsChainCompletionBlock;
}

- (void)setPcsChainCompletionBlock:(id)a3
{
}

- (BOOL)shouldFillBatch
{
  return self->_shouldFillBatch;
}

- (void)setShouldFillBatch:(BOOL)a3
{
  self->_shouldFillBatch = a3;
}

- (BOOL)canSyncDownBeforeRetry
{
  return self->_canSyncDownBeforeRetry;
}

- (void)setCanSyncDownBeforeRetry:(BOOL)a3
{
  self->_canSyncDownBeforeRetry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pcsChainCompletionBlock, 0);
  objc_storeStrong((id *)&self->_syncUpCallback, 0);
  objc_destroyWeak((id *)&self->_listOperation);
  objc_storeStrong((id *)&self->_rootItem, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
}

- (void)initWithRootItem:appLibrary:sessionContext:syncUpCallback:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: rootItem%@", v2, v3, v4, v5, v6);
}

- (void)_buildRecordListWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Can't PCS chain to documents, trash, or root%@", v2, v3, v4, v5, v6);
}

void __58__BRCPCSChainingOperation__buildRecordListWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] %@ is already chained%@");
}

void __58__BRCPCSChainingOperation__buildRecordListWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: listOp%@", v2, v3, v4, v5, v6);
}

void __58__BRCPCSChainingOperation__buildRecordListWithCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: si%@", v2, v3, v4, v5, v6);
}

void __64__BRCPCSChainingOperation__sendRecordBatch_recursed_completion___block_invoke_188_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: [newParent hasPrefix:kBRRecordIDPrefixDirectoryStructure]%@", v2, v3, v4, v5, v6);
}

void __40__BRCPCSChainingOperation__chainRecords__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] Failed iterating PCS - %@%@");
}

void __40__BRCPCSChainingOperation__chainRecords__block_invoke_194_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] failed sending first PCS step - %@%@");
}

void __40__BRCPCSChainingOperation__chainRecords__block_invoke_195_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] Failed sending second PCS step - %@%@");
}

@end